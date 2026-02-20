'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'
import toast from 'react-hot-toast'
import { User, Clock, CreditCard, LogOut, Calendar, ChevronRight } from 'lucide-react'
import { cn } from '@/lib/utils'

interface PerfilClientProps {
    user: {
        nome: string | null
        email: string | null
        perfil: string | null
        horario_mensagem: string | null
        telefone_whatsapp: string | null
        timezone: string
    } | null
    subscription: {
        data_fim: string | null
        data_inicio: string
        plans: { nome: string; preco: number } | null
    } | null
    checkins: { resposta: string; created_at: string }[]
    email: string
}

export function PerfilClient({ user, subscription, checkins, email }: PerfilClientProps) {
    const [horario, setHorario] = useState(user?.horario_mensagem ?? '08:00')
    const [salvandoHorario, setSalvandoHorario] = useState(false)
    const router = useRouter()
    const supabase = createClient()

    async function salvarHorario() {
        setSalvandoHorario(true)
        const { error } = await supabase
            .from('users')
            .update({ horario_mensagem: horario })
            .eq('email', email)

        if (error) toast.error('Erro ao salvar horário.')
        else toast.success('Horário atualizado!')
        setSalvandoHorario(false)
    }

    async function sair() {
        await supabase.auth.signOut()
        router.push('/login')
    }

    const totalFiz = checkins.filter(c => c.resposta === 'fiz').length
    const totalNao = checkins.filter(c => c.resposta === 'nao_consegui').length

    return (
        <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-emerald-950 main-content">
            <div className="max-w-md mx-auto px-4 pt-8 pb-6 space-y-4">
                {/* Header */}
                <div className="flex items-center justify-between">
                    <h1 className="text-2xl font-bold text-white">Perfil</h1>
                    <button
                        onClick={sair}
                        className="flex items-center gap-1.5 text-sm text-slate-500 hover:text-red-400 transition-colors"
                    >
                        <LogOut className="w-4 h-4" /> Sair
                    </button>
                </div>

                {/* Dados da usuária */}
                <div className="glass-card rounded-3xl p-5 space-y-3">
                    <div className="flex items-center gap-3">
                        <div className="w-12 h-12 rounded-full bg-emerald-500/20 border-2 border-emerald-500/30 flex items-center justify-center text-2xl">
                            {user?.perfil ?? '👤'}
                        </div>
                        <div>
                            <p className="font-bold text-white">{user?.nome ?? 'Usuária'}</p>
                            <p className="text-slate-400 text-sm">{email}</p>
                        </div>
                    </div>

                    <div className="grid grid-cols-2 gap-2 pt-1">
                        <div className="bg-slate-800/50 rounded-xl p-3">
                            <p className="text-xs text-slate-500">Perfil alimentar</p>
                            <p className="font-bold text-emerald-400 text-lg">{user?.perfil ?? '—'}</p>
                        </div>
                        <div className="bg-slate-800/50 rounded-xl p-3">
                            <p className="text-xs text-slate-500">Fuso horário</p>
                            <p className="font-bold text-slate-200 text-sm mt-0.5">{user?.timezone ?? 'America/Sao_Paulo'}</p>
                        </div>
                    </div>
                </div>

                {/* Plano ativo */}
                {subscription && (
                    <div className="glass-card rounded-2xl p-4 flex items-center justify-between">
                        <div className="flex items-center gap-3">
                            <div className="w-9 h-9 rounded-xl bg-purple-500/20 flex items-center justify-center">
                                <CreditCard className="w-4 h-4 text-purple-400" />
                            </div>
                            <div>
                                <p className="text-xs text-slate-500">Plano ativo</p>
                                <p className="font-semibold text-white">{subscription.plans?.nome}</p>
                            </div>
                        </div>
                        {subscription.data_fim && (
                            <div className="text-right">
                                <p className="text-xs text-slate-500">Expira em</p>
                                <p className="text-sm text-slate-300">{new Date(subscription.data_fim).toLocaleDateString('pt-BR')}</p>
                            </div>
                        )}
                    </div>
                )}

                {/* Horário das mensagens */}
                <div className="glass-card rounded-2xl p-4 space-y-3">
                    <div className="flex items-center gap-2">
                        <Clock className="w-4 h-4 text-emerald-400" />
                        <p className="font-medium text-white text-sm">Horário das mensagens WhatsApp</p>
                    </div>
                    <div className="flex gap-2">
                        <input
                            type="time"
                            value={horario}
                            onChange={e => setHorario(e.target.value)}
                            className="flex-1 bg-slate-800/50 border border-slate-700 rounded-xl py-2.5 px-3 text-slate-100 focus:outline-none focus:ring-2 focus:ring-emerald-500 text-sm"
                        />
                        <button
                            onClick={salvarHorario}
                            disabled={salvandoHorario}
                            className="bg-emerald-500 hover:bg-emerald-400 disabled:opacity-50 text-white font-semibold py-2.5 px-4 rounded-xl transition-all text-sm"
                        >
                            {salvandoHorario ? '...' : 'Salvar'}
                        </button>
                    </div>
                </div>

                {/* Histórico de check-ins */}
                <div className="glass-card rounded-2xl p-4 space-y-3">
                    <div className="flex items-center justify-between">
                        <div className="flex items-center gap-2">
                            <Calendar className="w-4 h-4 text-slate-400" />
                            <p className="font-medium text-white text-sm">Últimos 30 dias</p>
                        </div>
                        <div className="flex gap-3 text-xs text-slate-500">
                            <span className="text-emerald-400">✅ {totalFiz}</span>
                            <span className="text-red-400">❌ {totalNao}</span>
                        </div>
                    </div>

                    <div className="space-y-1.5 max-h-48 overflow-y-auto scrollbar-thin">
                        {checkins.slice(0, 20).map((c, i) => (
                            <div key={i} className="flex items-center justify-between py-1.5 border-b border-slate-800/50 last:border-0">
                                <div className="flex items-center gap-2">
                                    <span className="text-sm">{c.resposta === 'fiz' ? '✅' : '❌'}</span>
                                    <span className={cn(
                                        'text-xs font-medium',
                                        c.resposta === 'fiz' ? 'text-emerald-400' : 'text-red-400'
                                    )}>
                                        {c.resposta === 'fiz' ? 'Fiz' : 'Não consegui'}
                                    </span>
                                </div>
                                <span className="text-xs text-slate-500">
                                    {new Date(c.created_at).toLocaleDateString('pt-BR')}
                                </span>
                            </div>
                        ))}
                        {checkins.length === 0 && (
                            <p className="text-slate-500 text-xs text-center py-4">Nenhum check-in ainda.</p>
                        )}
                    </div>
                </div>
            </div>
        </div>
    )
}
