import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { ReceitasClient } from './ReceitasClient'

export default async function ReceitasPage() {
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) redirect('/login')

    // Verificar se é plano premium
    const { data: subscription } = await supabase
        .from('subscriptions')
        .select('*, plans(tem_receitas, nome)')
        .eq('user_id', user.id)
        .eq('status', 'active')
        .order('created_at', { ascending: false })
        .limit(1)
        .single()

    const temReceitas = subscription?.plans?.tem_receitas ?? false
    if (!temReceitas) redirect('/plano')

    // Buscar receitas
    const { data: recipes } = await supabase
        .from('recipes')
        .select('*')
        .eq('ativo', true)
        .order('nome', { ascending: true })

    return <ReceitasClient recipes={recipes ?? []} />
}
