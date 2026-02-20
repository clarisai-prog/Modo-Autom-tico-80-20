'use client'

import { useState } from 'react'
import { Clock, Beef, Search } from 'lucide-react'
import { cn } from '@/lib/utils'

interface Recipe {
    id: string
    nome: string
    ingredientes: string[]
    momento_do_dia: 'manha' | 'tarde' | 'noite'
    tempo_preparo: number
    proteina_g: number | null
    perfil: string[]
}

interface ReceitasClientProps {
    recipes: Recipe[]
}

const MOMENTOS = [
    { value: '', label: 'Todos' },
    { value: 'manha', label: 'Manhã ☀️' },
    { value: 'tarde', label: 'Tarde 🌤️' },
    { value: 'noite', label: 'Noite 🌙' },
]

const TEMPOS = [
    { value: 0, label: 'Todos' },
    { value: 5, label: 'Até 5min' },
    { value: 10, label: 'Até 10min' },
]

const PERFIS = ['', 'A', 'B', 'C', 'D']

export function ReceitasClient({ recipes }: ReceitasClientProps) {
    const [momento, setMomento] = useState('')
    const [tempo, setTempo] = useState(0)
    const [perfil, setPerfil] = useState('')
    const [busca, setBusca] = useState('')

    const filtradas = recipes.filter(r => {
        if (momento && r.momento_do_dia !== momento) return false
        if (tempo > 0 && r.tempo_preparo > tempo) return false
        if (perfil && !r.perfil.includes(perfil)) return false
        if (busca && !r.nome.toLowerCase().includes(busca.toLowerCase())) return false
        return true
    })

    return (
        <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-emerald-950 main-content">
            <div className="max-w-md mx-auto px-4 pt-8 pb-6 space-y-4">
                {/* Header */}
                <div>
                    <h1 className="text-2xl font-bold text-white">Receitas Premium</h1>
                    <p className="text-slate-400 text-sm mt-1">{recipes.length} receitas disponíveis</p>
                </div>

                {/* Busca */}
                <div className="relative">
                    <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
                    <input
                        value={busca}
                        onChange={e => setBusca(e.target.value)}
                        placeholder="Buscar receita..."
                        className="w-full bg-slate-800/50 border border-slate-700 rounded-xl py-3 pl-10 pr-4 text-slate-100 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-emerald-500 text-sm"
                    />
                </div>

                {/* Filtros */}
                <div className="space-y-2">
                    {/* Momento do dia */}
                    <div className="flex gap-2 overflow-x-auto pb-1 scrollbar-none">
                        {MOMENTOS.map(m => (
                            <button
                                key={m.value}
                                onClick={() => setMomento(m.value)}
                                className={cn(
                                    'flex-shrink-0 px-3 py-1.5 rounded-full text-xs font-medium transition-all',
                                    momento === m.value
                                        ? 'bg-emerald-500 text-white shadow-lg shadow-emerald-500/25'
                                        : 'bg-slate-800 text-slate-400 hover:text-slate-200'
                                )}
                            >
                                {m.label}
                            </button>
                        ))}
                    </div>

                    <div className="flex gap-2">
                        {/* Tempo */}
                        <div className="flex gap-1.5 overflow-x-auto">
                            {TEMPOS.map(t => (
                                <button
                                    key={t.value}
                                    onClick={() => setTempo(t.value)}
                                    className={cn(
                                        'flex-shrink-0 px-3 py-1.5 rounded-full text-xs font-medium transition-all',
                                        tempo === t.value
                                            ? 'bg-blue-500 text-white'
                                            : 'bg-slate-800 text-slate-400 hover:text-slate-200'
                                    )}
                                >
                                    {t.label}
                                </button>
                            ))}
                        </div>

                        {/* Perfil */}
                        <div className="flex gap-1.5 ml-auto">
                            {PERFIS.map(p => (
                                <button
                                    key={p}
                                    onClick={() => setPerfil(p)}
                                    className={cn(
                                        'flex-shrink-0 px-2.5 py-1.5 rounded-full text-xs font-bold transition-all',
                                        perfil === p
                                            ? 'bg-purple-500 text-white'
                                            : 'bg-slate-800 text-slate-400 hover:text-slate-200'
                                    )}
                                >
                                    {p || 'All'}
                                </button>
                            ))}
                        </div>
                    </div>
                </div>

                {/* Grid de receitas */}
                {filtradas.length === 0 ? (
                    <div className="text-center py-12">
                        <p className="text-4xl mb-3">🍽️</p>
                        <p className="text-slate-400">Nenhuma receita encontrada com esses filtros.</p>
                    </div>
                ) : (
                    <div className="space-y-3">
                        {filtradas.map(recipe => (
                            <div key={recipe.id} className="glass-card rounded-2xl p-4 space-y-2">
                                <div className="flex items-start justify-between gap-2">
                                    <h3 className="font-bold text-white text-sm">{recipe.nome}</h3>
                                    <div className="flex gap-1 flex-shrink-0">
                                        {recipe.perfil.map(p => (
                                            <span key={p} className="text-xs bg-purple-500/20 text-purple-300 border border-purple-500/30 px-1.5 py-0.5 rounded-full font-medium">
                                                {p}
                                            </span>
                                        ))}
                                    </div>
                                </div>

                                <p className="text-slate-400 text-xs">
                                    {recipe.ingredientes.join(' · ')}
                                </p>

                                <div className="flex items-center gap-3 text-xs text-slate-500">
                                    <span className="flex items-center gap-1">
                                        <Clock className="w-3 h-3" /> {recipe.tempo_preparo}min
                                    </span>
                                    {recipe.proteina_g && (
                                        <span className="flex items-center gap-1">
                                            <Beef className="w-3 h-3" /> {recipe.proteina_g}g proteína
                                        </span>
                                    )}
                                    <span className="capitalize ml-auto">
                                        {recipe.momento_do_dia === 'manha' ? '☀️ manhã' : recipe.momento_do_dia === 'tarde' ? '🌤️ tarde' : '🌙 noite'}
                                    </span>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </div>
        </div>
    )
}
