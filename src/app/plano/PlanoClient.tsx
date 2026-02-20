'use client'

import { AnaCard } from '@/components/AnaCard'
import Link from 'next/link'
import { Lock, ChefHat, CheckCircle2, Zap } from 'lucide-react'
import { cn } from '@/lib/utils'

interface Decision {
    id: string
    titulo: string
    momento_do_dia: string
    decision_variations: { texto_acao: string; ordem: number }[]
}

interface PlanoClientProps {
    nomePlano: string
    decisoesLiberadas: number
    temReceitas: boolean
    dataFim: string | null
    decisions: Decision[]
}

const PLANOS = {
    entrada: { cor: 'text-slate-300', bg: 'bg-slate-700', emoji: '🌱' },
    completo: { cor: 'text-emerald-300', bg: 'bg-emerald-900/50', emoji: '⚡' },
    premium: { cor: 'text-yellow-300', bg: 'bg-yellow-900/50', emoji: '👑' },
}

export function PlanoClient({ nomePlano, decisoesLiberadas, temReceitas, dataFim, decisions }: PlanoClientProps) {
    const nomeLower = nomePlano.toLowerCase() as keyof typeof PLANOS
    const planoConfig = PLANOS[nomeLower] ?? PLANOS.entrada
    const isEntrada = decisoesLiberadas <= 3
    const totalDecisoes = 7
    const progresso = Math.round((decisoesLiberadas / totalDecisoes) * 100)

    return (
        <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-emerald-950 main-content">
            <div className="max-w-md mx-auto px-4 pt-8 pb-6 space-y-4">
                {/* Header */}
                <div>
                    <h1 className="text-2xl font-bold text-white">Meu Plano</h1>
                    <div className="flex items-center gap-2 mt-1">
                        <span className={cn('text-sm font-semibold', planoConfig.cor)}>
                            {planoConfig.emoji} Plano {nomePlano}
                        </span>
                        {dataFim && (
                            <span className="text-xs text-slate-500">
                                · até {new Date(dataFim).toLocaleDateString('pt-BR')}
                            </span>
                        )}
                    </div>
                </div>

                {/* Barra de progresso (plano entrada) */}
                {isEntrada && (
                    <div className="glass-card rounded-2xl p-5 space-y-3">
                        <div className="flex items-center justify-between">
                            <p className="text-sm font-medium text-slate-300">Decisões desbloqueadas</p>
                            <p className="text-sm font-bold text-emerald-400">{decisoesLiberadas}/{totalDecisoes}</p>
                        </div>
                        <div className="w-full bg-slate-800 rounded-full h-2.5">
                            <div
                                className="h-2.5 rounded-full bg-gradient-to-r from-emerald-500 to-emerald-400 transition-all duration-700"
                                style={{ width: `${progresso}%` }}
                            />
                        </div>
                        <div className="bg-slate-800/80 rounded-xl p-3 border border-slate-700/50">
                            <p className="text-slate-300 text-sm font-medium mb-1">🔓 Desbloqueie todas as 7 decisões</p>
                            <p className="text-slate-500 text-xs mb-3">
                                Acesse o plano Completo e maximize seus resultados com {totalDecisoes - decisoesLiberadas} decisões extras.
                            </p>
                            <a
                                href="https://hotmart.com" target="_blank" rel="noopener noreferrer"
                                className="flex items-center justify-center gap-2 w-full bg-emerald-500 hover:bg-emerald-400 text-white font-bold py-3 rounded-xl transition-all text-sm active:scale-95"
                            >
                                <Zap className="w-4 h-4" /> Fazer upgrade — R$67
                            </a>
                        </div>
                    </div>
                )}

                {/* Lista de decisões */}
                <div className="space-y-2">
                    <p className="text-xs font-semibold text-slate-500 uppercase tracking-wider px-1">
                        Suas decisões
                    </p>
                    {decisions.map((d, i) => (
                        <div key={d.id} className="glass-card rounded-2xl p-4 flex items-start gap-3">
                            <div className="w-7 h-7 rounded-full bg-emerald-500/20 border border-emerald-500/30 flex items-center justify-center flex-shrink-0 mt-0.5">
                                <span className="text-xs font-bold text-emerald-400">{i + 1}</span>
                            </div>
                            <div className="flex-1 min-w-0">
                                <p className="font-semibold text-white text-sm">{d.titulo}</p>
                                <p className="text-slate-500 text-xs capitalize mt-0.5">{d.momento_do_dia}</p>
                                {d.decision_variations?.[0] && (
                                    <p className="text-slate-400 text-xs mt-1 line-clamp-2">
                                        {d.decision_variations[0].texto_acao}
                                    </p>
                                )}
                            </div>
                            <CheckCircle2 className="w-4 h-4 text-emerald-400 flex-shrink-0 mt-0.5" />
                        </div>
                    ))}

                    {/* Decisões bloqueadas */}
                    {isEntrada && Array.from({ length: totalDecisoes - decisoesLiberadas }).map((_, i) => (
                        <div key={i} className="rounded-2xl p-4 flex items-center gap-3 border border-slate-800 opacity-50">
                            <Lock className="w-4 h-4 text-slate-600" />
                            <p className="text-slate-600 text-sm">Decisão {decisoesLiberadas + i + 1} — bloqueada</p>
                        </div>
                    ))}
                </div>

                {/* Receitas (premium) */}
                {temReceitas && (
                    <Link
                        href="/receitas"
                        className="flex items-center gap-3 glass-card rounded-2xl p-4 hover:bg-slate-800/50 transition-colors"
                    >
                        <ChefHat className="w-5 h-5 text-yellow-400" />
                        <div>
                            <p className="font-semibold text-white text-sm">Receitas Premium</p>
                            <p className="text-slate-500 text-xs">Acessar sua biblioteca de receitas</p>
                        </div>
                    </Link>
                )}

                {/* Ana */}
                <AnaCard
                    estado={isEntrada ? 'curiosa' : 'animada'}
                    mensagem={isEntrada
                        ? 'Você está usando 3 decisões. Imagine o que 7 podem fazer por você.'
                        : 'Todas as suas decisões estão ativas. Siga o ritmo!'
                    }
                />
            </div>
        </div>
    )
}
