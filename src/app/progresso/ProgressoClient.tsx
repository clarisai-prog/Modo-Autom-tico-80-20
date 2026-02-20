'use client'

import { AnaCard } from '@/components/AnaCard'
import { StreakBadge } from '@/components/StreakBadge'
import { CalendarGrid } from '@/components/CalendarGrid'
import { Share2 } from 'lucide-react'
import toast from 'react-hot-toast'

type DayStatus = 'fiz' | 'nao_consegui' | 'sem_resposta' | 'futuro'

interface ProgressoClientProps {
    streak: number
    streakMax: number
    checkins: { resposta: string; created_at: string }[]
    anaMessage: string
    desde: string
}

function buildCalendarDays(
    checkins: { resposta: string; created_at: string }[],
    desde: string
) {
    const hoje = new Date()
    const days = []
    const checkinMap: Record<string, string> = {}

    checkins.forEach(c => {
        const d = c.created_at.split('T')[0]
        checkinMap[d] = c.resposta
    })

    for (let i = 0; i < 30; i++) {
        const d = new Date(desde + 'T12:00:00')
        d.setDate(d.getDate() + i)
        const dateStr = d.toISOString().split('T')[0]
        const isFuture = d > hoje

        let status: DayStatus = 'sem_resposta'
        if (isFuture) status = 'futuro'
        else if (checkinMap[dateStr] === 'fiz') status = 'fiz'
        else if (checkinMap[dateStr] === 'nao_consegui') status = 'nao_consegui'

        days.push({ date: dateStr, status })
    }
    return days
}

export function ProgressoClient({ streak, streakMax, checkins, anaMessage, desde }: ProgressoClientProps) {
    const days = buildCalendarDays(checkins, desde)
    const totalFiz = checkins.filter(c => c.resposta === 'fiz').length
    const totalNao = checkins.filter(c => c.resposta === 'nao_consegui').length
    const taxaSucesso = checkins.length > 0 ? Math.round((totalFiz / checkins.length) * 100) : 0

    function compartilhar() {
        const texto = `🔥 ${streak} dias no Modo Automático 80/20!\n✅ ${totalFiz} decisões cumpridas nos últimos 30 dias.\nTaxa de sucesso: ${taxaSucesso}% 💪`
        if (navigator.share) {
            navigator.share({ title: 'Meu Progresso — Modo 80/20', text: texto })
        } else {
            navigator.clipboard.writeText(texto)
            toast.success('Progresso copiado!')
        }
    }

    return (
        <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-emerald-950 main-content">
            <div className="max-w-md mx-auto px-4 pt-8 pb-6 space-y-5">
                {/* Header */}
                <div className="flex items-center justify-between">
                    <h1 className="text-2xl font-bold text-white">Progresso</h1>
                    <button
                        onClick={compartilhar}
                        className="flex items-center gap-2 text-sm text-emerald-400 hover:text-emerald-300 bg-emerald-500/10 hover:bg-emerald-500/20 px-3 py-2 rounded-xl transition-colors"
                    >
                        <Share2 className="w-4 h-4" /> Compartilhar
                    </button>
                </div>

                {/* Streak e stats */}
                <div className="glass-card rounded-3xl p-5 space-y-4">
                    <div className="flex items-center justify-between">
                        <div>
                            <p className="text-slate-400 text-xs uppercase tracking-wider mb-1">Streak atual</p>
                            <StreakBadge streak={streak} />
                        </div>
                        <div className="text-right">
                            <p className="text-slate-400 text-xs uppercase tracking-wider mb-1">Recorde</p>
                            <div className="text-2xl font-bold text-slate-200">🏆 {streakMax}d</div>
                        </div>
                    </div>

                    {/* KPIs */}
                    <div className="grid grid-cols-3 gap-2 pt-1">
                        {[
                            { label: 'Realizadas', value: totalFiz, emoji: '✅' },
                            { label: 'Não consegui', value: totalNao, emoji: '❌' },
                            { label: 'Taxa de sucesso', value: `${taxaSucesso}%`, emoji: '📊' },
                        ].map(stat => (
                            <div key={stat.label} className="bg-slate-800/50 rounded-2xl p-3 text-center">
                                <p className="text-lg">{stat.emoji}</p>
                                <p className="text-xl font-bold text-white">{stat.value}</p>
                                <p className="text-slate-500 text-xs mt-0.5">{stat.label}</p>
                            </div>
                        ))}
                    </div>
                </div>

                {/* Calendário */}
                <div className="glass-card rounded-3xl p-5">
                    <h2 className="text-sm font-semibold text-slate-300 mb-4 uppercase tracking-wider">
                        Últimos 30 dias
                    </h2>
                    <CalendarGrid days={days} />
                </div>

                {/* Ana */}
                <AnaCard
                    estado={streak > 0 ? 'animada' : 'curiosa'}
                    mensagem={anaMessage}
                />
            </div>
        </div>
    )
}
