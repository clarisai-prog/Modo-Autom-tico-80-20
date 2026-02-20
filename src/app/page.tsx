import { redirect } from 'next/navigation'

// Root redirects are handled by middleware
// This page is only reached if middleware is bypassed
export default function RootPage() {
  redirect('/login')
}
