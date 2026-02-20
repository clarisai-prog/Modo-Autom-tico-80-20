'use client'

import { cn } from '@/lib/utils'

interface StreakBadgeProps {
    streak: number
    className?: string
}

export function StreakBadge({ streak, className }: StreakBadgeProps) {
    const isCelebrating = streak > 0 && streak % 7 === 0

    return (
        <div className={cn(
            'inline-flex items-center gap-2 rounded-full px-4 py-2 font-bold text-lg',
            streak === 0
                ? 'bg-slate-800 text-slate-400'
                : isCelebrating
                    ? 'bg-gradient-to-r from-yellow-500 to-orange-500 text-white shadow-lg shadow-orange-500/25'
                    : 'bg-gradient-to-r from-orange-500 to-red-500 text-white shadow-lg shadow-orange-500/25',
            className
        )}>
            <span className={cn('text-2xl', streak > 0 && 'animate-pulse')}>🔥</span>
            <span>{streak}</span>
            <span className="text-sm font-medium opacity-90">
                {streak === 1 ? 'dia' : 'dias'}
            </span>
        </div>
    )
}
