'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { Home, TrendingUp, BookOpen, User, ChefHat } from 'lucide-react'
import { cn } from '@/lib/utils'

const NAV_ITEMS = [
    { href: '/hoje', label: 'Hoje', icon: Home },
    { href: '/progresso', label: 'Progresso', icon: TrendingUp },
    { href: '/plano', label: 'Plano', icon: BookOpen },
    { href: '/receitas', label: 'Receitas', icon: ChefHat },
    { href: '/perfil', label: 'Perfil', icon: User },
]

export function Navbar() {
    const pathname = usePathname()

    return (
        <nav className="fixed bottom-0 left-0 right-0 z-50 border-t border-slate-800 bg-slate-900/95 backdrop-blur-sm safe-area-pb">
            <div className="flex items-stretch max-w-md mx-auto">
                {NAV_ITEMS.map(({ href, label, icon: Icon }) => {
                    const isActive = pathname === href || pathname.startsWith(href + '/')

                    return (
                        <Link
                            key={href}
                            href={href}
                            className={cn(
                                'flex-1 flex flex-col items-center justify-center gap-1 py-3 px-1 text-xs transition-colors duration-200 min-h-[60px]',
                                isActive
                                    ? 'text-emerald-400'
                                    : 'text-slate-500 hover:text-slate-300'
                            )}
                        >
                            <Icon className={cn('w-5 h-5', isActive && 'drop-shadow-[0_0_6px_rgba(52,211,153,0.6)]')} />
                            <span className="font-medium leading-none">{label}</span>
                            {isActive && (
                                <span className="absolute bottom-0 w-8 h-0.5 bg-emerald-400 rounded-full" />
                            )}
                        </Link>
                    )
                })}
            </div>
        </nav>
    )
}
