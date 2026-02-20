'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import toast from 'react-hot-toast'
import { Loader2, Mail, Leaf } from 'lucide-react'

export default function LoginPage() {
    const [email, setEmail] = useState('')
    const [loading, setLoading] = useState(false)
    const [sent, setSent] = useState(false)

    const supabase = createClient()

    async function handleSubmit(e: React.FormEvent) {
        e.preventDefault()
        if (!email) return

        setLoading(true)
        const { error } = await supabase.auth.signInWithOtp({
            email,
            options: {
                emailRedirectTo: `${window.location.origin}/hoje`,
            },
        })

        if (error) {
            toast.error('Erro ao enviar link. Tente novamente.')
        } else {
            setSent(true)
            toast.success('Link enviado! Verifique seu email.')
        }
        setLoading(false)
    }

    return (
        <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-emerald-950 flex flex-col items-center justify-center p-6">
            {/* Logo */}
            <div className="flex flex-col items-center mb-10">
                <div className="w-16 h-16 rounded-2xl bg-emerald-500/20 border border-emerald-500/30 flex items-center justify-center mb-4 shadow-lg shadow-emerald-500/10">
                    <Leaf className="w-8 h-8 text-emerald-400" />
                </div>
                <h1 className="text-2xl font-bold text-white tracking-tight">Modo Automático</h1>
                <p className="text-emerald-400 font-semibold text-lg">80/20</p>
                <p className="text-slate-400 text-sm mt-2 text-center max-w-xs">
                    Decisões simples. Resultados reais.
                </p>
            </div>

            {/* Card */}
            <div className="w-full max-w-sm glass-card rounded-2xl p-6">
                {!sent ? (
                    <>
                        <h2 className="text-lg font-semibold text-white mb-1">Acessar minha conta</h2>
                        <p className="text-slate-400 text-sm mb-6">
                            Informe seu email. Vamos te enviar um link de acesso.
                        </p>

                        <form onSubmit={handleSubmit} className="space-y-4">
                            <div>
                                <label htmlFor="email" className="block text-sm font-medium text-slate-300 mb-1.5">
                                    Email
                                </label>
                                <div className="relative">
                                    <Mail className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
                                    <input
                                        id="email"
                                        type="email"
                                        value={email}
                                        onChange={(e) => setEmail(e.target.value)}
                                        placeholder="seu@email.com"
                                        required
                                        className="w-full bg-slate-800/50 border border-slate-700 rounded-xl py-3 pl-10 pr-4 text-slate-100 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-transparent text-sm"
                                    />
                                </div>
                            </div>

                            <button
                                type="submit"
                                disabled={loading}
                                className="w-full bg-emerald-500 hover:bg-emerald-400 disabled:opacity-50 disabled:cursor-not-allowed text-white font-semibold py-3 px-4 rounded-xl transition-all duration-200 flex items-center justify-center gap-2 shadow-lg shadow-emerald-500/25"
                            >
                                {loading ? (
                                    <><Loader2 className="w-4 h-4 animate-spin" /> Enviando...</>
                                ) : (
                                    'Entrar com magic link'
                                )}
                            </button>
                        </form>

                        <p className="text-xs text-slate-500 text-center mt-4">
                            Acesso exclusivo para quem já adquiriu o Modo Automático 80/20.
                        </p>
                    </>
                ) : (
                    <div className="text-center py-4">
                        <div className="text-4xl mb-4">📬</div>
                        <h2 className="text-lg font-semibold text-white mb-2">Email enviado!</h2>
                        <p className="text-slate-400 text-sm mb-4">
                            Clique no link que enviamos para <strong className="text-slate-200">{email}</strong> para acessar sua conta.
                        </p>
                        <p className="text-xs text-slate-500">
                            Não recebeu? Verifique a caixa de spam.
                        </p>
                        <button
                            onClick={() => { setSent(false); setEmail('') }}
                            className="mt-4 text-sm text-emerald-400 hover:text-emerald-300 underline"
                        >
                            Tentar com outro email
                        </button>
                    </div>
                )}
            </div>
        </div>
    )
}
