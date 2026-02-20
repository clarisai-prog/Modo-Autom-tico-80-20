import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { PlanoClient } from './PlanoClient'

export default async function PlanoPage() {
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) redirect('/login')

    // Subscription ativa + plano
    const { data: subscription } = await supabase
        .from('subscriptions')
        .select('*, plans(*)')
        .eq('user_id', user.id)
        .eq('status', 'active')
        .order('created_at', { ascending: false })
        .limit(1)
        .single()

    // Decisões disponíveis no plano
    const decisoesLiberadas = subscription?.plans?.decisoes_liberadas ?? 3
    const temReceitas = subscription?.plans?.tem_receitas ?? false

    const { data: decisions } = await supabase
        .from('decisions')
        .select('*, decision_variations(texto_acao, ordem)')
        .eq('ativo', true)
        .lte('plano_minimo', decisoesLiberadas)
        .order('plano_minimo', { ascending: true })

    return (
        <PlanoClient
            nomePlano={subscription?.plans?.nome ?? 'Entrada'}
            decisoesLiberadas={decisoesLiberadas}
            temReceitas={temReceitas}
            dataFim={subscription?.data_fim ?? null}
            decisions={decisions ?? []}
        />
    )
}
