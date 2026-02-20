'use client'

import { cn } from '@/lib/utils'

type AnaEstado = 'animada' | 'curiosa' | 'acolhedora' | 'comemorando'

interface AnaCardProps {
    estado: AnaEstado
    mensagem?: string
    className?: string
}

const CONFIG: Record<AnaEstado, {
    emoji: string
    mensagemPadrao: string
    corBorda: string
    corFundo: string
    animacao: string
}> = {
    animada: {
        emoji: '😊',
        mensagemPadrao: 'Tá no ritmo. Continua assim. 🙂',
        corBorda: 'border-emerald-400',
        corFundo: 'bg-emerald-950/40',
        animacao: 'ana-bounce',
    },
    curiosa: {
        emoji: '🤔',
        mensagemPadrao: 'Tudo bem aí? Manda um OK quando puder.',
        corBorda: 'border-amber-400',
        corFundo: 'bg-amber-950/40',
        animacao: 'ana-pulse',
    },
    acolhedora: {
        emoji: '🤗',
        mensagemPadrao: 'Recomeça quando estiver pronta. Sem pressa.',
        corBorda: 'border-purple-400',
        corFundo: 'bg-purple-950/40',
        animacao: 'ana-sway',
    },
    comemorando: {
        emoji: '🎉',
        mensagemPadrao: '30 dias. Você provou que consegue fazer sem pensar. Modo automático ativado.',
        corBorda: 'border-yellow-400',
        corFundo: 'bg-yellow-950/40',
        animacao: 'ana-spin',
    },
}

export function AnaCard({ estado, mensagem, className }: AnaCardProps) {
    const config = CONFIG[estado]
    const texto = mensagem ?? config.mensagemPadrao

    return (
        <div className={cn(
            'rounded-2xl border-2 p-4 flex items-start gap-3 transition-all duration-500',
            config.corBorda,
            config.corFundo,
            className
        )}>
            {/* Avatar */}
            <div className={cn('text-3xl select-none flex-shrink-0 mt-0.5', config.animacao)}>
                {config.emoji}
            </div>

            {/* Conteúdo */}
            <div className="flex-1 min-w-0">
                <p className="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-1">
                    Ana diz:
                </p>
                <p className="text-sm text-slate-200 leading-relaxed">
                    {texto}
                </p>
            </div>
        </div>
    )
}
