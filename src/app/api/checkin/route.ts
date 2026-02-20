import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'

export async function POST(request: NextRequest) {
    try {
        const supabase = createClient()
        const { data: { user } } = await supabase.auth.getUser()

        if (!user) {
            return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
        }

        const body = await request.json()
        const { daily_action_id, resposta } = body

        if (!daily_action_id || !['fiz', 'nao_consegui'].includes(resposta)) {
            return NextResponse.json({ error: 'Dados inválidos' }, { status: 400 })
        }

        // Verificar se já fez check-in hoje
        const hoje = new Date().toISOString().split('T')[0]
        const { data: existing } = await supabase
            .from('checkins')
            .select('id')
            .eq('user_id', user.id)
            .gte('created_at', `${hoje}T00:00:00`)
            .limit(1)
            .single()

        if (existing) {
            return NextResponse.json({ error: 'Já foi registrado um check-in hoje' }, { status: 409 })
        }

        // Inserir check-in (trigger do PostgreSQL atualiza streak automaticamente)
        const { data: checkin, error } = await supabase
            .from('checkins')
            .insert({
                user_id: user.id,
                daily_action_id,
                resposta,
            })
            .select()
            .single()

        if (error) {
            return NextResponse.json({ error: error.message }, { status: 500 })
        }

        // Buscar streak atualizado
        const { data: streak } = await supabase
            .from('streaks')
            .select('streak_atual, streak_maximo')
            .eq('user_id', user.id)
            .single()

        return NextResponse.json({
            success: true,
            checkin,
            streak: streak ?? { streak_atual: 0, streak_maximo: 0 },
        })
    } catch (_err) {
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
    }
}
