'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import toast from 'react-hot-toast'
import { Loader2, Mail, Lock, Leaf } from 'lucide-react'

type Modo = 'senha' | 'magic'

export default function LoginPage() {
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [loading, setLoading] = useState(false)
    const [sent, setSent] = useState(false)
    const [modo, setModo] = useState<Modo>('senha')

    const supabase = createClient()

    async function handleSenha(e: React.FormEvent) {
        e.preventDefault()
        setLoading(true)
        const { error } = await supabase.auth.signInWithPassword({ email, password })
        if (error) {
            toast.error('Email ou senha incorretos.')
        } else {
            window.location.href = '/hoje'
        }
        setLoading(false)
    }

    async function handleMagicLink(e: React.FormEvent) {
        e.preventDefault()
        setLoading(true)
        const { error } = await supabase.auth.signInWithOtp({
            email,
            options: {
                emailRedirectTo: 'https://modo-autom-tico-80-20-production.up.railway.app/auth/callback',
            },
        })
        if (error) {
            toast.error(error.message)
        } else {
            setSent(true)
        }
        setLoading(false)
    }

    return (
        <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-emerald-950 flex flex-col items-center justify-center p-6">
            <div className="flex flex-col items-center mb-10">
                <div className="w-16 h-16 rounded-2xl bg-emerald-500/20 border border-emerald-500/30 flex items-center justify-center mb-4 shadow-lg shadow-emerald-500/10">
                    <Leaf className="w-8 h-8 text-emerald-400" />
                </div>
                <h1 className="text-2xl font-bold text-white tracking-tight">Modo Automático</h1>
                <p className="text-emerald-400 font-semibold text-lg">80/20</p>
                <p className="text-slate-400 text-sm mt-2 text-center max-w-xs">Decisões simples. Resultados reais.</p>
            </div>

            <div className="w-full max-w-sm glass-card rounded-2xl p-6">
                {!sent ? (
                    <>
                        {/* Tabs */}
                        <div className="flex gap-2 mb-6 bg-slate-800/50 rounded-xl p-1">
                            <button
                                onClick={() => setModo('senha')}
                                className={`flex-1 py-2 rounded-lg text-sm font-medium transition-all ${modo === 'senha' ? 'bg-emerald-500 text-white' : 'text-slate-400'}`}
                            >
                                Senha
                            </button>
                            <button
                                onClick={() => setModo('magic')}
                                className={`flex-1 py-2 rounded-lg text-sm font-medium transition-all ${modo === 'magic' ? 'bg-emerald-500 text-white' : 'text-slate-400'}`}
                            >
                                Magic Link
                            </button>
                        </div>

                        {modo === 'senha' ? (
                            <form onSubmit={handleSenha} className="space-y-4">
                                <div className="relative">
                                    <Mail className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
                                    <input type="email" value={email} onChange={e => setEmail(e.target.value)}
                                        placeholder="seu@email.com" required
                                        className="w-full bg-slate-800/50 border border-slate-700 rounded-xl py-3 pl-10 pr-4 text-slate-100 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-emerald-500 text-sm" />
                                </div>
                                <div className="relative">
                                    <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
                                    <input type="password" value={password} onChange={e => setPassword(e.target.value)}
                                        placeholder="sua senha" required
                                        className="w-full bg-slate-800/50 border border-slate-700 rounded-xl py-3 pl-10 pr-4 text-slate-100 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-emerald-500 text-sm" />
                                </div>
                                <button type="submit" disabled={loading}
                                    className="w-full bg-emerald-500 hover:bg-emerald-400 disabled:opacity-50 text-white font-semibold py-3 px-4 rounded-xl transition-all flex items-center justify-center gap-2">
                                    {loading ? <><Loader2 className="w-4 h-4 animate-spin" /> Entrando...</> : 'Entrar'}
                                </button>
                            </form>
                        ) : (
                            <form onSubmit={handleMagicLink} className="space-y-4">
                                <div className="relative">
                                    <Mail className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
                                    <input type="email" value={email} onChange={e => setEmail(e.target.value)}
                                        placeholder="seu@email.com" required
                                        className="w-full bg-slate-800/50 border border-slate-700 rounded-xl py-3 pl-10 pr-4 text-slate-100 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-emerald-500 text-sm" />
                                </div>
                                <button type="submit" disabled={loading}
                                    className="w-full bg-emerald-500 hover:bg-emerald-400 disabled:opacity-50 text-white font-semibold py-3 px-4 rounded-xl transition-all flex items-center justify-center gap-2">
                                    {loading ? <><Loader2 className="w-4 h-4 animate-spin" /> Enviando...</> : 'Entrar com magic link'}
                                </button>
                            </form>
                        )}

                        <p className="text-xs text-slate-500 text-center mt-4">
                            Acesso exclusivo para quem já adquiriu o Modo Automático 80/20.
                        </p>
                    </>
                ) : (
                    <div className="text-center py-4">
                        <div className="text-4xl mb-4">📬</div>
                        <h2 className="text-lg font-semibold text-white mb-2">Email enviado!</h2>
                        <p className="text-slate-400 text-sm mb-4">
                            Clique no link enviado para <strong className="text-slate-200">{email}</strong>
                        </p>
                        <button onClick={() => { setSent(false); setEmail('') }}
                            className="mt-4 text-sm text-emerald-400 hover:text-emerald-300 underline">
                            Tentar com outro email
                        </button>
                    </div>
                )}
            </div>
        </div>
    )
}