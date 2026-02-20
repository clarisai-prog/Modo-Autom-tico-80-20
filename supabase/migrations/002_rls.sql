-- 002_rls.sql
-- Row Level Security — usuário só acessa os próprios dados

ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE subscriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE daily_actions ENABLE ROW LEVEL SECURITY;
ALTER TABLE checkins ENABLE ROW LEVEL SECURITY;
ALTER TABLE streaks ENABLE ROW LEVEL SECURITY;

-- Public (sem RLS) — leitura por todos autenticados
ALTER TABLE plans ENABLE ROW LEVEL SECURITY;
ALTER TABLE decisions ENABLE ROW LEVEL SECURITY;
ALTER TABLE decision_variations ENABLE ROW LEVEL SECURITY;
ALTER TABLE recipes ENABLE ROW LEVEL SECURITY;

-- ============================================================
-- PLANS — leitura pública para autenticados
-- ============================================================
CREATE POLICY "plans_read" ON plans FOR SELECT TO authenticated USING (true);

-- ============================================================
-- DECISIONS — leitura pública para autenticados
-- ============================================================
CREATE POLICY "decisions_read" ON decisions FOR SELECT TO authenticated USING (ativo = true);

-- ============================================================
-- DECISION_VARIATIONS — leitura pública para autenticados
-- ============================================================
CREATE POLICY "decision_variations_read" ON decision_variations FOR SELECT TO authenticated USING (true);

-- ============================================================
-- RECIPES — leitura pública para autenticados (filtro de premium é na app)
-- ============================================================
CREATE POLICY "recipes_read" ON recipes FOR SELECT TO authenticated USING (ativo = true);

-- ============================================================
-- USERS — CRUD próprio
-- ============================================================
CREATE POLICY "users_select_own" ON users FOR SELECT TO authenticated USING (auth.uid() = id);
CREATE POLICY "users_insert_own" ON users FOR INSERT TO authenticated WITH CHECK (auth.uid() = id);
CREATE POLICY "users_update_own" ON users FOR UPDATE TO authenticated USING (auth.uid() = id);

-- ============================================================
-- SUBSCRIPTIONS — leitura/inserção do próprio usuário
-- ============================================================
CREATE POLICY "subscriptions_select_own" ON subscriptions FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "subscriptions_insert_own" ON subscriptions FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "subscriptions_update_own" ON subscriptions FOR UPDATE TO authenticated USING (auth.uid() = user_id);

-- ============================================================
-- DAILY_ACTIONS
-- ============================================================
CREATE POLICY "daily_actions_select_own" ON daily_actions FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "daily_actions_insert_own" ON daily_actions FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);

-- ============================================================
-- CHECKINS
-- ============================================================
CREATE POLICY "checkins_select_own" ON checkins FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "checkins_insert_own" ON checkins FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);

-- ============================================================
-- STREAKS
-- ============================================================
CREATE POLICY "streaks_select_own" ON streaks FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "streaks_insert_own" ON streaks FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "streaks_update_own" ON streaks FOR UPDATE TO authenticated USING (auth.uid() = user_id);

-- Service role bypasses RLS — webhook Hotmart usa service role
