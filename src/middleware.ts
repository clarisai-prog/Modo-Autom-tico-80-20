import { NextResponse, type NextRequest } from 'next/server'
import { createServerClient } from '@supabase/ssr'

const PROTECTED_ROUTES = ['/hoje', '/progresso', '/plano', '/receitas', '/perfil']
const AUTH_ROUTES = ['/login']

export async function middleware(request: NextRequest) {
    let supabaseResponse = NextResponse.next({ request })

    const supabase = createServerClient(
        process.env.NEXT_PUBLIC_SUPABASE_URL!,
        process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
        {
            cookies: {
                getAll() {
                    return request.cookies.getAll()
                },
                setAll(cookiesToSet) {
                    cookiesToSet.forEach(({ name, value }) => request.cookies.set(name, value))
                    supabaseResponse = NextResponse.next({ request })
                    cookiesToSet.forEach(({ name, value, options }) =>
                        supabaseResponse.cookies.set(name, value, options)
                    )
                },
            },
        }
    )

    const { data: { user } } = await supabase.auth.getUser()
    const pathname = request.nextUrl.pathname

    // Redirect unauthenticated users away from protected routes
    const isProtected = PROTECTED_ROUTES.some(route => pathname.startsWith(route))
    if (isProtected && !user) {
        return NextResponse.redirect(new URL('/login', request.url))
    }

    // Redirect authenticated users away from login page
    const isAuthRoute = AUTH_ROUTES.some(route => pathname === route)
    if (isAuthRoute && user) {
        return NextResponse.redirect(new URL('/hoje', request.url))
    }

    // Redirect root to /hoje if authenticated, else /login
    if (pathname === '/') {
        return NextResponse.redirect(new URL(user ? '/hoje' : '/login', request.url))
    }

    return supabaseResponse
}

export const config = {
    matcher: ['/((?!_next/static|_next/image|favicon.ico|icon-192.png|icon-512.png|manifest.json|api|sw.js|workbox).*)'],
}
