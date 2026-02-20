import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { ProgressoClient } from './ProgressoClient'

export default async function ProgressoPage() {
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) redirect('/login')

    // Streak
    const { data: streakData } = await supabase
        .from('streaks')
        .select('*')
        .eq('user_id', user.id)
        .single()

    // Check-ins dos últimos 30 dias
    const trintaDiasAtras = new Date()
    trintaDiasAtras.setDate(trintaDiasAtras.getDate() - 29)
    const desde = trintaDiasAtras.toISOString().split('T')[0]

    const { data: checkins } = await supabase
        .from('checkins')
        .select('resposta, created_at')
        .eq('user_id', user.id)
        .gte('created_at', `${desde}T00:00:00`)
        .order('created_at', { ascending: true })

    // Detectar padrão de falhas (dia da semana com mais 'nao_consegui')
    const failsByDay = [0, 0, 0, 0, 0, 0, 0] // Dom-Sáb
    checkins?.forEach(c => {
        if (c.resposta === 'nao_consegui') {
            failsByDay[new Date(c.created_at).getDay()]++
        }
    })
    const dayNames = ['domingo', 'segunda', 'terça', 'quarta', 'quinta', 'sexta', 'sábado']
    const maxFailDay = failsByDay.indexOf(Math.max(...failsByDay))
    const anaMessage = failsByDay[maxFailDay] > 0
        ? `Você costuma ter mais dificuldade às ${dayNames[maxFailDay]}s. Quer planejar esse dia com mais cuidado? 🤔`
        : 'Continue assim! Seu padrão está consistente. 🙂'

    return (
        <ProgressoClient
            streak={streakData?.streak_atual ?? 0}
            streakMax={streakData?.streak_maximo ?? 0}
            checkins={checkins ?? []}
            anaMessage={anaMessage}
            desde={desde}
        />
    )
}
