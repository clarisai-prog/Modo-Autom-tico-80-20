import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { PerfilClient } from './PerfilClient'

export default async function PerfilPage() {
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) redirect('/login')

    const { data: userData } = await supabase
        .from('users')
        .select('*')
        .eq('id', user.id)
        .single()

    const { data: subscription } = await supabase
        .from('subscriptions')
        .select('*, plans(nome, preco)')
        .eq('user_id', user.id)
        .eq('status', 'active')
        .order('created_at', { ascending: false })
        .limit(1)
        .single()

    // Histórico dos últimos 30 dias
    const trintaDiasAtras = new Date()
    trintaDiasAtras.setDate(trintaDiasAtras.getDate() - 29)

    const { data: checkins } = await supabase
        .from('checkins')
        .select('resposta, created_at')
        .eq('user_id', user.id)
        .gte('created_at', trintaDiasAtras.toISOString())
        .order('created_at', { ascending: false })

    return (
        <PerfilClient
            user={userData}
            subscription={subscription}
            checkins={checkins ?? []}
            email={user.email ?? ''}
        />
    )
}
