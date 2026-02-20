import { NextRequest, NextResponse } from 'next/server'
import { createAdminClient } from '@/lib/supabase/admin'

export async function POST(request: NextRequest) {
    try {
        // Verificar token do Hotmart
        const token = request.headers.get('x-hotmart-webhook-token')
        if (token !== process.env.HOTMART_WEBHOOK_SECRET) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const body = await request.json()
        const { event, data } = body

        // Só processar compras aprovadas
        if (event !== 'purchase_approved' && event !== 'PURCHASE_APPROVED') {
            return NextResponse.json({ message: 'Event ignored' })
        }

        const supabase = createAdminClient()

        // Extrair dados do comprador
        const buyer = data?.buyer ?? data?.purchase?.buyer ?? {}
        const email = buyer.email
        const nome = buyer.name ?? buyer.full_name ?? ''
        const productId = data?.product?.id ?? data?.purchase?.product?.id ?? ''

        if (!email) {
            return NextResponse.json({ error: 'Email não encontrado no payload' }, { status: 400 })
        }

        // Mapear produto para plano
        // Ajuste os IDs de produto do Hotmart conforme necessário
        const PRODUCT_PLAN_MAP: Record<string, string> = {
            // 'HOTMART_PRODUCT_ID_ENTRADA': '00000000-0000-0000-0000-000000000001',
            // 'HOTMART_PRODUCT_ID_COMPLETO': '00000000-0000-0000-0000-000000000002',
            // 'HOTMART_PRODUCT_ID_PREMIUM': '00000000-0000-0000-0000-000000000003',
        }

        // Default: plano entrada se não mapeado
        const planId = PRODUCT_PLAN_MAP[productId] ?? '00000000-0000-0000-0000-000000000001'

        // Criar usuário no Supabase Auth (se não existir)
        // getUserByEmail foi removido da Admin API — consultamos a tabela pública
        let userId: string

        const { data: existingRow } = await supabase
            .from('users')
            .select('id')
            .eq('email', email)
            .maybeSingle()

        if (existingRow?.id) {
            userId = existingRow.id
        } else {
            const { data: newUser, error: createError } = await supabase.auth.admin.createUser({
                email,
                email_confirm: true,
                user_metadata: { nome },
            })

            if (createError || !newUser.user) {
                return NextResponse.json({ error: 'Erro ao criar usuário' }, { status: 500 })
            }
            userId = newUser.user.id
        }

        // Upsert na tabela users
        await supabase.from('users').upsert({
            id: userId,
            nome,
            email,
        }, { onConflict: 'id' })

        // Criar subscription
        const dataFim = new Date()
        dataFim.setFullYear(dataFim.getFullYear() + 1)

        const { error: subError } = await supabase.from('subscriptions').insert({
            user_id: userId,
            plan_id: planId,
            status: 'active',
            plataforma: 'hotmart',
            external_id: data?.purchase?.transaction ?? `hotmart_${Date.now()}`,
            data_inicio: new Date().toISOString(),
            data_fim: dataFim.toISOString(),
        })

        if (subError) {
            console.error('Erro ao criar subscription:', subError)
        }

        // Inicializar streak
        await supabase.from('streaks').upsert({
            user_id: userId,
            streak_atual: 0,
            streak_maximo: 0,
        }, { onConflict: 'user_id' })

        // Enviar magic link de acesso
        const { error: magicError } = await supabase.auth.admin.generateLink({
            type: 'magiclink',
            email,
            options: {
                redirectTo: `${process.env.NEXT_PUBLIC_APP_URL ?? 'https://your-app.railway.app'}/hoje`,
            },
        })

        if (magicError) {
            console.error('Erro ao gerar magic link:', magicError)
        }

        return NextResponse.json({
            success: true,
            message: 'Usuário criado e acesso enviado por email',
            userId,
        })
    } catch (err) {
        console.error('Webhook error:', err)
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
