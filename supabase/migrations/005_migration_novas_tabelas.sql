-- 005_migration_novas_tabelas.sql
-- Modo Automático 80/20 — Novas tabelas: mensagens, ações, upsell tracking, onboarding
-- Compatível com schema existente (001_schema.sql)

-- ============================================================
-- MESSAGES — banco das 173 mensagens da Ana
-- ============================================================
CREATE TABLE IF NOT EXISTS messages (
  id           uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  codigo       text NOT NULL UNIQUE,           -- ex: ATIVA-001, FIZ-011, NAO-021
  tipo         text NOT NULL CHECK (tipo IN (
                 'ativacao_diaria',
                 'resposta_fiz',
                 'resposta_nao_consegui',
                 'reengajamento',
                 'streak_marco',
                 'upsell',
                 'onboarding',
                 'especial'
               )),
  subtipo      text,                           -- ex: neutra, identidade, microdica, acolhimento, alternativa, ressignificacao
  situacao     text,                           -- ex: trabalho, familia, social, solo, emocional, especial, saude
  texto        text NOT NULL,
  perfil       text[] NOT NULL DEFAULT ARRAY['A','B','C','D'],
  gatilho      text NOT NULL CHECK (gatilho IN ('automatico','manual','keyword')),
  keywords     text[],                         -- palavras-chave que disparam (para tipo keyword)
  dia_inativo  int,                            -- para reengajamento: 1, 2 ou 3
  streak_dias  int,                            -- para streak_marco: 3, 7, 14, 21, 30
  fiz_count    int,                            -- para upsell: 10, 20 ou 25
  ativo        boolean NOT NULL DEFAULT true,
  created_at   timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- SITUATIONS — 7 situações das 224 ações específicas
-- ============================================================
CREATE TABLE IF NOT EXISTS situations (
  id           uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  nome         text NOT NULL,
  descricao    text,
  contexto     text,
  restricao    text,
  ordem        int NOT NULL DEFAULT 1,
  ativo        boolean NOT NULL DEFAULT true,
  created_at   timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- SITUATION_ACTIONS — variações de ação por situação e perfil
-- ============================================================
CREATE TABLE IF NOT EXISTS situation_actions (
  id            uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  situation_id  uuid NOT NULL REFERENCES situations(id) ON DELETE CASCADE,
  numero        int NOT NULL,                  -- 1-15 variações principais
  texto_acao    text NOT NULL,
  perfil        text[] NOT NULL DEFAULT ARRAY['A','B','C','D'],
  tempo_minutos int,
  tipo          text NOT NULL CHECK (tipo IN ('variacao','emergencia','perfil_especifico')),
  perfil_codigo text,                          -- A, B, C ou D (para tipo perfil_especifico)
  acao_ordem    int DEFAULT 1,                 -- 1,2,3 para ações específicas por perfil
  created_at    timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- USER_UPSELL_TRACKING — rastreio de FIZ para upsell automático
-- ============================================================
CREATE TABLE IF NOT EXISTS user_upsell_tracking (
  id                  uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id             uuid NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
  total_fiz           int NOT NULL DEFAULT 0,
  upsell_10_enviado   boolean NOT NULL DEFAULT false,
  upsell_20_enviado   boolean NOT NULL DEFAULT false,
  upsell_25_enviado   boolean NOT NULL DEFAULT false,
  updated_at          timestamptz NOT NULL DEFAULT now(),
  created_at          timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- USER_ONBOARDING — respostas do questionário inicial
-- ============================================================
CREATE TABLE IF NOT EXISTS user_onboarding (
  id                uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id           uuid NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
  resp_rotina       text CHECK (resp_rotina IN ('A','B','C','D')),       -- Q1
  resp_desafio      text CHECK (resp_desafio IN ('A','B','C','D')),      -- Q2
  resp_historico    text CHECK (resp_historico IN ('A','B','C','D')),    -- Q3
  resp_motivacao    text CHECK (resp_motivacao IN ('A','B','C','D')),    -- Q4
  resp_horario      text CHECK (resp_horario IN ('A','B','C','D')),      -- Q5
  onboarding_completo boolean NOT NULL DEFAULT false,
  completed_at      timestamptz,
  created_at        timestamptz NOT NULL DEFAULT now(),
  updated_at        timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- USER_STATUS — pausa, cancelamento, retorno
-- ============================================================
CREATE TABLE IF NOT EXISTS user_status (
  id           uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id      uuid NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
  status       text NOT NULL CHECK (status IN ('ativo','pausado','cancelado')) DEFAULT 'ativo',
  pausado_em   timestamptz,
  retornou_em  timestamptz,
  cancelado_em timestamptz,
  motivo_cancelamento text,
  created_at   timestamptz NOT NULL DEFAULT now(),
  updated_at   timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- MESSAGE_LOG — histórico de mensagens enviadas a cada usuária
-- ============================================================
CREATE TABLE IF NOT EXISTS message_log (
  id           uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id      uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  message_id   uuid NOT NULL REFERENCES messages(id),
  enviado_em   timestamptz NOT NULL DEFAULT now(),
  canal        text NOT NULL DEFAULT 'whatsapp',
  status       text NOT NULL CHECK (status IN ('enviado','falhou','pendente')) DEFAULT 'pendente',
  created_at   timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- Triggers: updated_at
-- ============================================================
CREATE TRIGGER user_upsell_tracking_updated_at
  BEFORE UPDATE ON user_upsell_tracking
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER user_onboarding_updated_at
  BEFORE UPDATE ON user_onboarding
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER user_status_updated_at
  BEFORE UPDATE ON user_status
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- ============================================================
-- Trigger: incrementar total_fiz automaticamente após checkin FIZ
-- ============================================================
CREATE OR REPLACE FUNCTION increment_upsell_fiz_count()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.resposta = 'fiz' THEN
    INSERT INTO user_upsell_tracking (user_id, total_fiz)
    VALUES (NEW.user_id, 1)
    ON CONFLICT (user_id)
    DO UPDATE SET
      total_fiz  = user_upsell_tracking.total_fiz + 1,
      updated_at = now();
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS trg_increment_upsell_fiz ON checkins;
CREATE TRIGGER trg_increment_upsell_fiz
  AFTER INSERT ON checkins
  FOR EACH ROW
  EXECUTE FUNCTION increment_upsell_fiz_count();

-- ============================================================
-- RLS — novas tabelas
-- ============================================================
ALTER TABLE messages              ENABLE ROW LEVEL SECURITY;
ALTER TABLE situations            ENABLE ROW LEVEL SECURITY;
ALTER TABLE situation_actions     ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_upsell_tracking  ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_onboarding       ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_status           ENABLE ROW LEVEL SECURITY;
ALTER TABLE message_log           ENABLE ROW LEVEL SECURITY;

-- Leitura pública (conteúdo)
CREATE POLICY "messages_read"          ON messages          FOR SELECT TO authenticated USING (ativo = true);
CREATE POLICY "situations_read"        ON situations        FOR SELECT TO authenticated USING (ativo = true);
CREATE POLICY "situation_actions_read" ON situation_actions FOR SELECT TO authenticated USING (true);

-- Dados pessoais
CREATE POLICY "upsell_select_own" ON user_upsell_tracking FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "upsell_insert_own" ON user_upsell_tracking FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "upsell_update_own" ON user_upsell_tracking FOR UPDATE TO authenticated USING (auth.uid() = user_id);

CREATE POLICY "onboarding_select_own" ON user_onboarding FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "onboarding_insert_own" ON user_onboarding FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "onboarding_update_own" ON user_onboarding FOR UPDATE TO authenticated USING (auth.uid() = user_id);

CREATE POLICY "status_select_own" ON user_status FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "status_insert_own" ON user_status FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "status_update_own" ON user_status FOR UPDATE TO authenticated USING (auth.uid() = user_id);

CREATE POLICY "msglog_select_own" ON message_log FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "msglog_insert_own" ON message_log FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);

-- ============================================================
-- Índices de performance
-- ============================================================
CREATE INDEX IF NOT EXISTS idx_messages_tipo      ON messages(tipo);
CREATE INDEX IF NOT EXISTS idx_messages_codigo    ON messages(codigo);
CREATE INDEX IF NOT EXISTS idx_message_log_user   ON message_log(user_id);
CREATE INDEX IF NOT EXISTS idx_message_log_msg    ON message_log(message_id);
CREATE INDEX IF NOT EXISTS idx_sit_actions_sit    ON situation_actions(situation_id);
CREATE INDEX IF NOT EXISTS idx_upsell_user        ON user_upsell_tracking(user_id);
