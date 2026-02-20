# Modo Automático 80/20 — PWA

Sistema de decisão guiada de emagrecimento via WhatsApp para mulheres brasileiras. PWA com Next.js 14, Supabase, e integração Hotmart.

## Stack

| Camada | Tecnologia |
|--------|-----------|
| Frontend | Next.js 14 + Tailwind CSS + shadcn/ui |
| Auth | Supabase Auth (magic link) |
| Banco de Dados | Supabase PostgreSQL |
| PWA | next-pwa (service worker + manifest) |
| Notificações | OneSignal |
| Pagamentos | Hotmart (webhook) |
| Hospedagem | Railway (Nixpacks) |

---

## Setup Local

### 1. Pré-requisitos
- Node.js 18+
- Conta Supabase: [supabase.com](https://supabase.com)
- Conta Railway: [railway.com](https://railway.com)

### 2. Clonar e instalar
```bash
git clone <seu-repositorio>
cd modo-automatico-pwa
npm install
```

### 3. Variáveis de ambiente
Crie um arquivo `.env.local` com base no `.env.example`:

```bash
cp .env.example .env.local
```

Preencha os valores:
```env
NEXT_PUBLIC_SUPABASE_URL=https://SEU-PROJETO.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=sua-anon-key
SUPABASE_SERVICE_ROLE_KEY=sua-service-role-key
HOTMART_WEBHOOK_SECRET=seu-segredo-hotmart
NEXT_PUBLIC_ONESIGNAL_APP_ID=seu-app-id-onesignal
```

### 4. Rodar localmente
```bash
npm run dev
```
Acesse: [http://localhost:3000](http://localhost:3000)

---

## Configurar Supabase

### Criar tabelas (migrations)
No painel Supabase → **SQL Editor**, execute os arquivos em ordem:

```bash
supabase/migrations/001_schema.sql   # Todas as tabelas
supabase/migrations/002_rls.sql      # Políticas RLS
supabase/migrations/003_triggers.sql # Trigger de streak
```

### Popular dados iniciais (seed)
```bash
# No SQL Editor do Supabase:
supabase/seed.sql
```

Inclui:
- 3 planos: Entrada (R$27), Completo (R$67), Premium (R$147)
- 7 decisões × 3 variações = 21 textos de ação
- 7 receitas premium de exemplo

### Configurar Auth
No Supabase → **Authentication → URL Configuration**:
- Site URL: `https://seu-app.railway.app`
- Redirect URLs: `https://seu-app.railway.app/hoje`

---

## Deploy no Railway

### 1. Criar projeto no Railway
1. Acesse [railway.com](https://railway.com)
2. **New Project** → **Deploy from GitHub repo**
3. Conecte seu repositório

### 2. Configurar variáveis de ambiente
No Railway Dashboard → **Variables**, adicione:

```
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
HOTMART_WEBHOOK_SECRET=
NEXT_PUBLIC_ONESIGNAL_APP_ID=
NEXT_PUBLIC_APP_URL=https://seu-app.railway.app
NODE_ENV=production
```

### 3. Deploy automático
- Railway detecta Next.js via **Nixpacks** automaticamente
- Cada push para `main` dispara deploy automático
- Health check em: `/api/health`

---

## Webhook Hotmart

### Configurar na Hotmart
Na Hotmart → **Ferramentas → Webhook**:
- URL: `https://seu-app.railway.app/api/webhook/hotmart`
- Token: cole o valor de `HOTMART_WEBHOOK_SECRET`
- Evento: `PURCHASE_APPROVED`

### Mapear produtos para planos
Em `src/app/api/webhook/hotmart/route.ts`, edite `PRODUCT_PLAN_MAP`:
```typescript
const PRODUCT_PLAN_MAP: Record<string, string> = {
  'SEU_PRODUCT_ID_ENTRADA': '00000000-0000-0000-0000-000000000001',
  'SEU_PRODUCT_ID_COMPLETO': '00000000-0000-0000-0000-000000000002',
  'SEU_PRODUCT_ID_PREMIUM': '00000000-0000-0000-0000-000000000003',
}
```

### Testar localmente
```bash
curl -X POST http://localhost:3000/api/webhook/hotmart \
  -H "Content-Type: application/json" \
  -H "x-hotmart-webhook-token: seu-segredo" \
  -d '{"event":"purchase_approved","data":{"buyer":{"email":"test@test.com","name":"Usuária Teste"}}}'
```

---

## Rotas do App

| Rota | Descrição | Acesso |
|------|-----------|--------|
| `/login` | Magic link login | Público |
| `/hoje` | Decisão do dia + FIZ/NÃO CONSEGUI | Autenticado |
| `/progresso` | Streak + calendário 30 dias | Autenticado |
| `/plano` | Decisões do plano + upsell | Autenticado |
| `/receitas` | Receitas filtráveis | Premium only |
| `/perfil` | Dados + configurações | Autenticado |
| `/api/health` | Health check Railway | Público |
| `/api/checkin` | Registrar check-in | Autenticado |
| `/api/webhook/hotmart` | Webhook de compra | Token Hotmart |

---

## Estrutura de arquivos

```
src/
├── app/
│   ├── layout.tsx          # Root layout + PWA metadata
│   ├── globals.css         # Tema emerald + animações Ana
│   ├── login/page.tsx      # Magic link login
│   ├── hoje/
│   │   ├── page.tsx        # Server component
│   │   └── HojeClient.tsx  # Client component
│   ├── progresso/
│   ├── plano/
│   ├── receitas/
│   ├── perfil/
│   └── api/
│       ├── health/route.ts
│       ├── checkin/route.ts
│       └── webhook/hotmart/route.ts
├── components/
│   ├── AnaCard.tsx         # Persona Ana (4 estados)
│   ├── StreakBadge.tsx      # 🔥 contador de dias
│   ├── CalendarGrid.tsx    # Grade mensal
│   └── Navbar.tsx          # Bottom navigation
└── lib/
    └── supabase/
        ├── client.ts       # Browser client
        ├── server.ts       # Server client
        └── admin.ts        # Service role client
supabase/
├── migrations/
│   ├── 001_schema.sql
│   ├── 002_rls.sql
│   └── 003_triggers.sql
└── seed.sql
```
