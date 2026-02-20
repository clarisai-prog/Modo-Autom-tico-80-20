-- 001_schema.sql
-- Modo Automático 80/20 — Schema completo

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================
-- PLANS
-- ============================================================
CREATE TABLE IF NOT EXISTS plans (
  id               uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  nome             text NOT NULL,
  preco            numeric(10,2) NOT NULL,
  tipo             text NOT NULL CHECK (tipo IN ('one_time','recorrente')),
  decisoes_liberadas int NOT NULL DEFAULT 3,
  tem_receitas     boolean NOT NULL DEFAULT false,
  created_at       timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- USERS (extends Supabase Auth users via trigger)
-- ============================================================
CREATE TABLE IF NOT EXISTS users (
  id               uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  nome             text,
  email            text,
  telefone_whatsapp text,
  timezone         text NOT NULL DEFAULT 'America/Sao_Paulo',
  horario_mensagem time,
  perfil           text CHECK (perfil IN ('A','B','C','D')),
  created_at       timestamptz NOT NULL DEFAULT now(),
  updated_at       timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- SUBSCRIPTIONS
-- ============================================================
CREATE TABLE IF NOT EXISTS subscriptions (
  id           uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id      uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  plan_id      uuid NOT NULL REFERENCES plans(id),
  status       text NOT NULL CHECK (status IN ('active','cancelled','expired')) DEFAULT 'active',
  plataforma   text NOT NULL DEFAULT 'hotmart',
  external_id  text,
  data_inicio  timestamptz NOT NULL DEFAULT now(),
  data_fim     timestamptz,
  created_at   timestamptz NOT NULL DEFAULT now(),
  updated_at   timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- DECISIONS
-- ============================================================
CREATE TABLE IF NOT EXISTS decisions (
  id               uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  titulo           text NOT NULL,
  momento_do_dia   text CHECK (momento_do_dia IN ('manha','tarde','noite','qualquer')),
  plano_minimo     int NOT NULL DEFAULT 1,
  ativo            boolean NOT NULL DEFAULT true,
  created_at       timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- DECISION_VARIATIONS
-- ============================================================
CREATE TABLE IF NOT EXISTS decision_variations (
  id           uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  decision_id  uuid NOT NULL REFERENCES decisions(id) ON DELETE CASCADE,
  texto_acao   text NOT NULL,
  ordem        int NOT NULL DEFAULT 1,
  created_at   timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- DAILY_ACTIONS
-- ============================================================
CREATE TABLE IF NOT EXISTS daily_actions (
  id           uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id      uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  decision_id  uuid NOT NULL REFERENCES decisions(id),
  variation_id uuid NOT NULL REFERENCES decision_variations(id),
  data_envio   timestamptz NOT NULL DEFAULT now(),
  canal        text NOT NULL DEFAULT 'whatsapp',
  status_envio text NOT NULL CHECK (status_envio IN ('pendente','enviado','falhou')) DEFAULT 'pendente',
  created_at   timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- CHECKINS
-- ============================================================
CREATE TABLE IF NOT EXISTS checkins (
  id               uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id          uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  daily_action_id  uuid NOT NULL REFERENCES daily_actions(id),
  resposta         text NOT NULL CHECK (resposta IN ('fiz','nao_consegui')),
  motivo_opcional  text,
  created_at       timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- STREAKS
-- ============================================================
CREATE TABLE IF NOT EXISTS streaks (
  id                  uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id             uuid NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
  streak_atual        int NOT NULL DEFAULT 0,
  streak_maximo       int NOT NULL DEFAULT 0,
  ultima_data_checkin date,
  created_at          timestamptz NOT NULL DEFAULT now(),
  updated_at          timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- RECIPES (plano premium)
-- ============================================================
CREATE TABLE IF NOT EXISTS recipes (
  id              uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  nome            text NOT NULL,
  ingredientes    text[] NOT NULL,
  momento_do_dia  text NOT NULL CHECK (momento_do_dia IN ('manha','tarde','noite')),
  tempo_preparo   int NOT NULL, -- em minutos
  proteina_g      numeric(5,1),
  perfil          text[] NOT NULL DEFAULT ARRAY['A','B','C','D'],
  ativo           boolean NOT NULL DEFAULT true,
  created_at      timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- Trigger: updated_at automático
-- ============================================================
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER users_updated_at BEFORE UPDATE ON users
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER subscriptions_updated_at BEFORE UPDATE ON subscriptions
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER streaks_updated_at BEFORE UPDATE ON streaks
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();
