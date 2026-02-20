-- seed.sql — conteúdo real do Modo Automático 80/20

-- ============================================================
-- PLANOS
-- ============================================================
INSERT INTO plans (id, nome, preco, tipo, decisoes_liberadas, tem_receitas) VALUES
  ('00000000-0000-0000-0000-000000000001', 'Entrada',  27.00, 'one_time', 3, false),
  ('00000000-0000-0000-0000-000000000002', 'Completo',  67.00, 'one_time', 7, false),
  ('00000000-0000-0000-0000-000000000003', 'Premium',  147.00, 'one_time', 7, true);

-- ============================================================
-- DECISÕES (7 decisões, plano_minimo indica o índice de plano)
-- ============================================================
INSERT INTO decisions (id, titulo, momento_do_dia, plano_minimo, ativo) VALUES
  ('10000000-0000-0000-0000-000000000001', 'Café da Manhã Proteico',   'manha',    1, true),
  ('10000000-0000-0000-0000-000000000002', 'Movimento de 10 Minutos',  'manha',    1, true),
  ('10000000-0000-0000-0000-000000000003', 'Hidratação Antes do Almoço','qualquer', 1, true),
  ('10000000-0000-0000-0000-000000000004', 'Almoço sem Distração',     'tarde',    2, true),
  ('10000000-0000-0000-0000-000000000005', 'Lanche Inteligente',       'tarde',    2, true),
  ('10000000-0000-0000-0000-000000000006', 'Jantar Leve',              'noite',    2, true),
  ('10000000-0000-0000-0000-000000000007', 'Ritual Noturno Anti-Sabotagem','noite',2, true);

-- ============================================================
-- VARIAÇÕES (3 por decisão = 21 total)
-- ============================================================
-- Decisão 1: Café da Manhã Proteico
INSERT INTO decision_variations (decision_id, texto_acao, ordem) VALUES
  ('10000000-0000-0000-0000-000000000001', 'Coma 2 ovos mexidos antes de sair de casa.', 1),
  ('10000000-0000-0000-0000-000000000001', 'Tome iogurte grego com castanhas no café.', 2),
  ('10000000-0000-0000-0000-000000000001', 'Faça um omelete rápido com 1 fatia de queijo.', 3);

-- Decisão 2: Movimento de 10 Minutos
INSERT INTO decision_variations (decision_id, texto_acao, ordem) VALUES
  ('10000000-0000-0000-0000-000000000002', 'Faça 10 minutos de caminhada antes das 9h.', 1),
  ('10000000-0000-0000-0000-000000000002', 'Suba e desça escadas por 10 minutos agora.', 2),
  ('10000000-0000-0000-0000-000000000002', 'Faça 20 agachamentos + 10 flexões ao acordar.', 3);

-- Decisão 3: Hidratação Antes do Almoço
INSERT INTO decision_variations (decision_id, texto_acao, ordem) VALUES
  ('10000000-0000-0000-0000-000000000003', 'Beba 500ml de água antes do almoço.', 1),
  ('10000000-0000-0000-0000-000000000003', 'Tome 2 copos de água ao acordar e 2 antes de almoçar.', 2),
  ('10000000-0000-0000-0000-000000000003', 'Configure alarme para beber água às 11h.', 3);

-- Decisão 4: Almoço sem Distração
INSERT INTO decision_variations (decision_id, texto_acao, ordem) VALUES
  ('10000000-0000-0000-0000-000000000004', 'Almoce sem celular e mastigue 20x cada garfada.', 1),
  ('10000000-0000-0000-0000-000000000004', 'Sirva o prato e não repita. Pare quando estiver satisfeita.', 2),
  ('10000000-0000-0000-0000-000000000004', 'Coloque metade da porção de carboidrato habitual hoje.', 3);

-- Decisão 5: Lanche Inteligente
INSERT INTO decision_variations (decision_id, texto_acao, ordem) VALUES
  ('10000000-0000-0000-0000-000000000005', 'Se tiver fome às 15h, coma fruta + castanhas.', 1),
  ('10000000-0000-0000-0000-000000000005', 'Troque o biscoito de hoje por iogurte grego.', 2),
  ('10000000-0000-0000-0000-000000000005', 'Beba chá gelado sem açúcar se a fome aparecer no lanche.', 3);

-- Decisão 6: Jantar Leve
INSERT INTO decision_variations (decision_id, texto_acao, ordem) VALUES
  ('10000000-0000-0000-0000-000000000006', 'Jante antes das 19h e escolha proteína + salada.', 1),
  ('10000000-0000-0000-0000-000000000006', 'Reduza a quantidade de arroz/pão e aumente as verduras no jantar.', 2),
  ('10000000-0000-0000-0000-000000000006', 'Sopa leve ou omelete de legumes no jantar de hoje.', 3);

-- Decisão 7: Ritual Noturno Anti-Sabotagem
INSERT INTO decision_variations (decision_id, texto_acao, ordem) VALUES
  ('10000000-0000-0000-0000-000000000007', 'Às 21h, feche a cozinha. Sem comida depois disso.', 1),
  ('10000000-0000-0000-0000-000000000007', 'Antes de dormir: separe o café da manhã proteico de amanhã.', 2),
  ('10000000-0000-0000-0000-000000000007', 'Se tiver vontade de beliscar, beba 1 copo de água e escove os dentes.', 3);

-- ============================================================
-- RECEITAS PREMIUM (amostra)
-- ============================================================
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil) VALUES
  ('Omelete Rápida',       ARRAY['2 ovos','1 fatia queijo','sal','pimenta'],             'manha', 5,  14.0, ARRAY['A','B','C','D']),
  ('Bowl de Iogurte',      ARRAY['iogurte grego','granola sem açúcar','morango'],         'manha', 3,  12.0, ARRAY['A','B']),
  ('Frango com Salada',    ARRAY['150g frango grelhado','alface','tomate','azeite'],      'tarde', 10, 32.0, ARRAY['A','B','C','D']),
  ('Sopa de Legumes',      ARRAY['abobrinha','cenoura','cebola','caldo de legumes'],      'noite', 10, 4.5,  ARRAY['C','D']),
  ('Shake de Proteína',    ARRAY['whey protein','leite desnatado','banana'],              'manha', 3,  28.0, ARRAY['A','B']),
  ('Wrap de Atum',         ARRAY['tortilha integral','atum','cream cheese light','alface'],'tarde',5, 24.0, ARRAY['A','C']),
  ('Tapioca com Cottage',  ARRAY['goma de tapioca','cottage cheese','tomate'],            'manha', 7,  18.0, ARRAY['B','D']);
