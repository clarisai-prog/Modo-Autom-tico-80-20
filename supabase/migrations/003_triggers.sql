-- 003_triggers.sql
-- Trigger: atualizar streak automaticamente após checkin de 'fiz'

CREATE OR REPLACE FUNCTION update_streak_on_checkin()
RETURNS TRIGGER AS $$
DECLARE
  v_ultima_data   date;
  v_streak_atual  int;
  v_streak_max    int;
  v_hoje          date := CURRENT_DATE;
BEGIN
  -- Só processa check-ins com resposta 'fiz'
  IF NEW.resposta <> 'fiz' THEN
    RETURN NEW;
  END IF;

  -- Buscar ou criar registro de streak
  INSERT INTO streaks (user_id, streak_atual, streak_maximo, ultima_data_checkin)
  VALUES (NEW.user_id, 0, 0, NULL)
  ON CONFLICT (user_id) DO NOTHING;

  SELECT streak_atual, streak_maximo, ultima_data_checkin
  INTO v_streak_atual, v_streak_max, v_ultima_data
  FROM streaks WHERE user_id = NEW.user_id;

  -- Lógica de streak
  IF v_ultima_data IS NULL THEN
    -- Primeiro check-in
    v_streak_atual := 1;
  ELSIF v_ultima_data = v_hoje THEN
    -- Já fez check-in hoje, não incrementa
    RETURN NEW;
  ELSIF v_ultima_data = v_hoje - INTERVAL '1 day' THEN
    -- Dia consecutivo
    v_streak_atual := v_streak_atual + 1;
  ELSE
    -- Quebrou o streak (mais de 1 dia sem 'fiz')
    v_streak_atual := 1;
  END IF;

  -- Atualizar máximo se necessário
  IF v_streak_atual > v_streak_max THEN
    v_streak_max := v_streak_atual;
  END IF;

  UPDATE streaks
  SET
    streak_atual        = v_streak_atual,
    streak_maximo       = v_streak_max,
    ultima_data_checkin = v_hoje,
    updated_at          = now()
  WHERE user_id = NEW.user_id;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Dropar trigger se já existir (idempotente)
DROP TRIGGER IF EXISTS trg_update_streak ON checkins;

CREATE TRIGGER trg_update_streak
  AFTER INSERT ON checkins
  FOR EACH ROW
  EXECUTE FUNCTION update_streak_on_checkin();
