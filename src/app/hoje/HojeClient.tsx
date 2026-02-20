'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { AnaCard } from '@/components/AnaCard'
import { StreakBadge } from '@/components/StreakBadge'
import toast from 'react-hot-toast'
import { CheckCircle2, XCircle, Loader2 } from 'lucide-react'
import { cn } from '@/lib/utils'

type AnaEstado = 'animada' | 'curiosa' | 'acolhedora' | 'comemorando'

interface HojeClientProps {
    userName: string
    streak: number
    anaEstado: AnaEstado
    dailyAction: {
        id: string
        decisions: { titulo: string } | null
        decision_variations: { texto_acao: string } | null
    } | null
    jaRespondeu: boolean
    respostaHoje: string | null
}

export function HojeClient({ userName, streak, anaEstado, dailyAction, jaRespondeu, respostaHoje }: HojeClientProps) {
    const [loading, setLoading] = useState<'fiz' | 'nao_consegui' | null>(null)
    const [respondeu, setRespondeu] = useState(jaRespondeu)
    const [resposta, setResposta] = useState(respostaHoje)
    const supabase = createClient()

    const primeiroNome = userName.split(' ')[0]

    async function registrarCheckin(tipo: 'fiz' | 'nao_consegui') {
        if (!dailyAction || respondeu) return
        setLoading(tipo)

        const { error } = await supabase.from('checkins').insert({
            user_id: (await supabase.auth.getUser()).data.user?.id,
            daily_action_id: dailyAction.id,
            resposta: tipo,
        })

        if (error) {
            toast.error('Erro ao registrar. Tente novamente.')
        } else {
            setRespondeu(true)
            setResposta(tipo)
            if (tipo === 'fiz') {
                toast.success('🔥 Check-in registrado! Streak atualizado.')
            } else {
                toast('💙 Tudo bem. Amanhã é um novo dia.', { icon: '💙' })
            }
        }
        setLoading(null)
    }

    const hoje = new Date().toLocaleDateString('pt-BR', { weekday: 'long', day: 'numeric', month: 'long' })

    return (
        <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-emerald-950 main-content">
            <div className="max-w-md mx-auto px-4 pt-8 pb-6 space-y-5">
                {/* Header */}
                <div className="flex items-center justify-between">
                    <div>
                        <p className="text-slate-400 text-sm capitalize">{hoje}</p>
                        <h1 className="text-2xl font-bold text-white">
                            Olá, {primeiroNome} 👋
                        </h1>
                    </div>
                    <StreakBadge streak={streak} />
                </div>

                {/* Decisão do Dia */}
                {dailyAction ? (
                    <div className="glass-card rounded-3xl p-6 space-y-4">
                        <div>
                            <p className="text-xs font-semibold text-emerald-400 uppercase tracking-widest mb-1">
                                Decisão de hoje
                            </p>
                            <h2 className="text-xl font-bold text-white leading-snug">
                                {dailyAction.decisions?.titulo ?? 'Decisão do dia'}
                            </h2>
                        </div>

                        <div className="bg-slate-800/50 rounded-2xl p-4 border border-slate-700/50">
                            <p className="text-slate-200 text-base leading-relaxed line-clamp-2">
                                {dailyAction.decision_variations?.texto_acao ?? 'Ação do dia a ser definida.'}
                            </p>
                        </div>

                        {/* Botões */}
                        {!respondeu ? (
                            <div className="grid grid-cols-2 gap-3 pt-1">
                                <button
                                    onClick={() => registrarCheckin('fiz')}
                                    disabled={!!loading}
                                    className="flex items-center justify-center gap-2 bg-emerald-500 hover:bg-emerald-400 disabled:opacity-50 text-white font-bold py-4 rounded-2xl transition-all duration-200 shadow-lg shadow-emerald-500/25 active:scale-95"
                                >
                                    {loading === 'fiz'
                                        ? <Loader2 className="w-5 h-5 animate-spin" />
                                        : <CheckCircle2 className="w-5 h-5" />
                                    }
                                    FIZ ✅
                                </button>
                                <button
                                    onClick={() => registrarCheckin('nao_consegui')}
                                    disabled={!!loading}
                                    className="flex items-center justify-center gap-2 bg-slate-700 hover:bg-slate-600 disabled:opacity-50 text-slate-200 font-bold py-4 rounded-2xl transition-all duration-200 active:scale-95"
                                >
                                    {loading === 'nao_consegui'
                                        ? <Loader2 className="w-5 h-5 animate-spin" />
                                        : <XCircle className="w-5 h-5" />
                                    }
                                    NÃO CONSEGUI 😔
                                </button>
                            </div>
                        ) : (
                            <div className={cn(
                                'rounded-2xl p-4 flex items-center gap-3',
                                resposta === 'fiz'
                                    ? 'bg-emerald-500/20 border border-emerald-500/30'
                                    : 'bg-slate-700/50 border border-slate-600'
                            )}>
                                <span className="text-2xl">{resposta === 'fiz' ? '✅' : '😔'}</span>
                                <div>
                                    <p className="font-semibold text-white text-sm">
                                        {resposta === 'fiz' ? 'Você fez! 🔥' : 'Registrado'}
                                    </p>
                                    <p className="text-slate-400 text-xs">
                                        {resposta === 'fiz' ? 'Streak atualizado. Até amanhã!' : 'Amanhã é um novo começo.'}
                                    </p>
                                </div>
                            </div>
                        )}
                    </div>
                ) : (
                    <div className="glass-card rounded-3xl p-6 text-center">
                        <p className="text-4xl mb-3">💤</p>
                        <p className="text-slate-300 font-medium">Nenhuma decisão para hoje.</p>
                        <p className="text-slate-500 text-sm mt-1">Sua próxima decisão chegará pelo WhatsApp.</p>
                    </div>
                )}

                {/* Ana Card */}
                <AnaCard estado={anaEstado} />
            </div>
        </div>
    )
}
