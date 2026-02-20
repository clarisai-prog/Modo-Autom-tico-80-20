import { NextResponse } from 'next/server'

export async function GET() {
    return NextResponse.json({
        status: 'ok',
        app: 'Modo Automático 80/20',
        timestamp: Date.now(),
    })
}
