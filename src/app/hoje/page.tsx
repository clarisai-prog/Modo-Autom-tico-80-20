import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { HojeClient } from './HojeClient'

export default async function HojePage() {
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) redirect('/login')

    // Buscar dados do usuário
    const { data: userData } = await supabase
        .from('users')
        .select('*')
        .eq('id', user.id)
        .single()

    // Buscar streak
    const { data: streakData } = await supabase
        .from('streaks')
        .select('*')
        .eq('user_id', user.id)
        .single()

    // Buscar daily_action de hoje
    const hoje = new Date().toISOString().split('T')[0]
    const { data: dailyAction } = await supabase
        .from('daily_actions')
        .select(`
      *,
      decisions(titulo),
      decision_variations(texto_acao)
    `)
        .eq('user_id', user.id)
        .gte('data_envio', `${hoje}T00:00:00`)
        .lte('data_envio', `${hoje}T23:59:59`)
        .order('created_at', { ascending: false })
        .limit(1)
        .single()

    // Checar se já fez checkin hoje
    const { data: checkinHoje } = await supabase
        .from('checkins')
        .select('resposta')
        .eq('user_id', user.id)
        .gte('created_at', `${hoje}T00:00:00`)
        .lte('created_at', `${hoje}T23:59:59`)
        .limit(1)
        .single()

    // Calcular estado da Ana
    const streak = streakData?.streak_atual ?? 0
    const ultimaData = streakData?.ultima_data_checkin
    const diasSemResposta = ultimaData
        ? Math.floor((Date.now() - new Date(ultimaData).getTime()) / 86400000)
        : 99

    let anaEstado: 'animada' | 'curiosa' | 'acolhedora' | 'comemorando' = 'curiosa'
    if (streak >= 30) anaEstado = 'comemorando'
    else if (streak > 0 && diasSemResposta <= 1) anaEstado = 'animada'
    else if (diasSemResposta > 1) anaEstado = 'curiosa'
    else if (streak === 0) anaEstado = 'acolhedora'

    return (
        <HojeClient
            userName={userData?.nome ?? 'você'}
            streak={streak}
            anaEstado={anaEstado}
            dailyAction={dailyAction ?? null}
            jaRespondeu={!!checkinHoje}
            respostaHoje={checkinHoje?.resposta ?? null}
        />
    )
}
