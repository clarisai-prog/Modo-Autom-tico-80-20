'use client'

import { cn } from '@/lib/utils'

type DayStatus = 'fiz' | 'nao_consegui' | 'sem_resposta' | 'futuro'

interface CalendarDay {
    date: string // YYYY-MM-DD
    status: DayStatus
}

interface CalendarGridProps {
    days: CalendarDay[]
    className?: string
}

const STATUS_STYLE: Record<DayStatus, { bg: string; icon: string; label: string }> = {
    fiz: { bg: 'bg-emerald-500 border-emerald-400', icon: '✅', label: 'Fiz' },
    nao_consegui: { bg: 'bg-red-500/60 border-red-400', icon: '❌', label: 'Não consegui' },
    sem_resposta: { bg: 'bg-slate-700 border-slate-600', icon: '', label: 'Sem resposta' },
    futuro: { bg: 'bg-slate-800/50 border-slate-700/50', icon: '', label: 'Futuro' },
}

function getDayNumber(dateStr: string) {
    return new Date(dateStr + 'T12:00:00').getDate()
}

export function CalendarGrid({ days, className }: CalendarGridProps) {
    const weekDays = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S']

    return (
        <div className={cn('', className)}>
            {/* Cabeçalho dos dias da semana */}
            <div className="grid grid-cols-7 mb-1">
                {weekDays.map((d, i) => (
                    <div key={i} className="text-center text-xs font-medium text-slate-500 py-1">
                        {d}
                    </div>
                ))}
            </div>

            {/* Grid de dias */}
            <div className="grid grid-cols-7 gap-1">
                {days.map((day) => {
                    const style = STATUS_STYLE[day.status]
                    const dayNum = getDayNumber(day.date)

                    return (
                        <div
                            key={day.date}
                            title={`${day.date} — ${style.label}`}
                            className={cn(
                                'aspect-square rounded-md border text-[10px] flex flex-col items-center justify-center gap-0.5 transition-all duration-200',
                                style.bg
                            )}
                        >
                            <span className="text-slate-300 leading-none font-medium">{dayNum}</span>
                            {style.icon && (
                                <span className="text-[8px] leading-none">{style.icon}</span>
                            )}
                        </div>
                    )
                })}
            </div>

            {/* Legenda */}
            <div className="flex items-center gap-4 mt-3 text-xs text-slate-500">
                <span className="flex items-center gap-1"><span className="w-3 h-3 rounded-sm bg-emerald-500 inline-block" />Fiz</span>
                <span className="flex items-center gap-1"><span className="w-3 h-3 rounded-sm bg-red-500/60 inline-block" />Não consegui</span>
                <span className="flex items-center gap-1"><span className="w-3 h-3 rounded-sm bg-slate-700 inline-block" />Sem resposta</span>
            </div>
        </div>
    )
}
