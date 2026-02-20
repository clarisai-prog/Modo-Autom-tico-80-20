-- =====================================================
-- SEED COMPLETO - MODO AUTOMÁTICO 80/20
-- =====================================================
-- Arquivo gerado para popular o banco de dados completo
-- com decisions, variações, receitas e mensagens WhatsApp
-- =====================================================

-- Habilitar extensão UUID
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =====================================================
-- TABELA WHATSAPP_MESSAGES (se não existir)
-- =====================================================
CREATE TABLE IF NOT EXISTS whatsapp_messages (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  codigo text UNIQUE NOT NULL,
  tipo text NOT NULL,
  situacao text,
  texto text NOT NULL,
  perfil text[] NOT NULL DEFAULT ARRAY['A','B','C','D'],
  gatilho text,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Adicionar coluna perfil em decision_variations se não existir
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'decision_variations' AND column_name = 'perfil'
  ) THEN
    ALTER TABLE decision_variations ADD COLUMN perfil text[] NOT NULL DEFAULT ARRAY['A','B','C','D'];
  END IF;
END $$;

-- =====================================================
-- 1. PLANS (Planos disponíveis)
-- =====================================================
INSERT INTO plans (id, nome, preco, tipo, decisoes_liberadas, tem_receitas) VALUES
  ('00000000-0000-0000-0000-000000000001', 'Entrada',  27.00, 'one_time', 3, false),
  ('00000000-0000-0000-0000-000000000002', 'Completo',  67.00, 'one_time', 7, false),
  ('00000000-0000-0000-0000-000000000003', 'Premium',  147.00, 'one_time', 7, true)
ON CONFLICT (id) DO NOTHING;

-- =====================================================
-- 2. DECISIONS (7 situações)
-- =====================================================
INSERT INTO decisions (id, titulo, momento_do_dia, plano_minimo, ativo) VALUES
  ('aaaaaaaa-0000-0000-0000-000000000001', 'Fome Noturna', 'noite', 1, true),
  ('aaaaaaaa-0000-0000-0000-000000000002', 'Zero Energia para Cozinhar', 'qualquer', 1, true),
  ('aaaaaaaa-0000-0000-0000-000000000003', 'Almoço Fora com Colegas', 'tarde', 1, true),
  ('aaaaaaaa-0000-0000-0000-000000000004', 'Fim de Semana sem Rotina', 'qualquer', 1, true),
  ('aaaaaaaa-0000-0000-0000-000000000005', 'Fome Emocional / Ansiedade', 'qualquer', 1, true),
  ('aaaaaaaa-0000-0000-0000-000000000006', 'Café da Manhã Corrido', 'manha', 1, true),
  ('aaaaaaaa-0000-0000-0000-000000000007', 'Supermercado sem Planejamento', 'qualquer', 1, true)
ON CONFLICT (id) DO NOTHING;

-- =====================================================
-- 3. DECISION_VARIATIONS (105 variações = 7x15)
-- =====================================================

-- Situação 1: Fome Noturna (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem, perfil) VALUES
  ('bbbbbbbb-0001-0000-0000-000000000001', 'aaaaaaaa-0000-0000-0000-000000000001', 'Pega 1 banana, esmaga com garfo e polvilha canela em pó. Come com colher.', 1, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0001-0000-0000-000000000002', 'aaaaaaaa-0000-0000-0000-000000000001', 'Fatia 1 maçã em rodelas, passa pasta de amendoim em cada uma.', 2, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0001-0000-0000-000000000003', 'aaaaaaaa-0000-0000-0000-000000000001', 'Mistura 1 iogurte natural com 1 colher de mel e sementes de chia.', 3, ARRAY['B','C']),
  ('bbbbbbbb-0001-0000-0000-000000000004', 'aaaaaaaa-0000-0000-0000-000000000001', 'Tosta 1 fatia de pão integral, espalha requeijão light e cobre com tomate fatiado.', 4, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0001-0000-0000-000000000005', 'aaaaaaaa-0000-0000-0000-000000000001', 'Abre 1 lata de atum, escorre e mistura com 1 colher de maionese. Come com palitos de cenoura.', 5, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0001-0000-0000-000000000006', 'aaaaaaaa-0000-0000-0000-000000000001', 'Pega 1 ovo, cozinha por 8 minutos. Descasca e come com sal e pimenta.', 6, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0001-0000-0000-000000000007', 'aaaaaaaa-0000-0000-0000-000000000001', 'Prepara 1 chá de camomila, come 2 biscoitos de arroz com queijo cottage.', 7, ARRAY['C','D']),
  ('bbbbbbbb-0001-0000-0000-000000000008', 'aaaaaaaa-0000-0000-0000-000000000001', 'Pega 1 pera, corta em cubos, adiciona 1 colher de mel e canela.', 8, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0001-0000-0000-000000000009', 'aaaaaaaa-0000-0000-0000-000000000001', 'Mistura 1 colher de aveia em 1 copo de leite morno, adiciona canela.', 9, ARRAY['B','C','D']),
  ('bbbbbbbb-0001-0000-0000-000000000010', 'aaaaaaaa-0000-0000-0000-000000000001', 'Tosta 1 pão sírio, espalha cream cheese e enrola 1 fatia de peito de peru.', 10, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0001-0000-0000-000000000011', 'aaaaaaaa-0000-0000-0000-000000000001', 'Pega 1 punhado de castanhas-do-pará (3-4 unidades) e 1 tangerina.', 11, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0001-0000-0000-000000000012', 'aaaaaaaa-0000-0000-0000-000000000001', 'Abre 1 iogurte grego, adiciona 1 colher de semente de linhaça moída.', 12, ARRAY['B','C']),
  ('bbbbbbbb-0001-0000-0000-000000000013', 'aaaaaaaa-0000-0000-0000-000000000001', 'Corta 1 pepino em rodelas, espalha requeijão light e orégano.', 13, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0001-0000-0000-000000000014', 'aaaaaaaa-0000-0000-0000-000000000001', 'Pega 1 embalagem de sopa pronta de legumes, aquece no micro-ondas.', 14, ARRAY['B','C','D']),
  ('bbbbbbbb-0001-0000-0000-000000000015', 'aaaaaaaa-0000-0000-0000-000000000001', 'Mistura 1 colher de cacau em pó em 1 copo de leite morno. Sem açúcar.', 15, ARRAY['A','B','C'])
ON CONFLICT (id) DO NOTHING;

-- Situação 2: Zero Energia para Cozinhar (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem, perfil) VALUES
  ('bbbbbbbb-0002-0000-0000-000000000001', 'aaaaaaaa-0000-0000-0000-000000000002', 'Abre 1 lata de sopa de legumes, aquece no micro-ondas.', 1, ARRAY['B','C']),
  ('bbbbbbbb-0002-0000-0000-000000000002', 'aaaaaaaa-0000-0000-0000-000000000002', 'Mistura 1 lata de atum com arroz de panela de ontem.', 2, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0002-0000-0000-000000000003', 'aaaaaaaa-0000-0000-0000-000000000002', 'Pega 1 pão sírio, espalha homus e enrola pepino em fatias.', 3, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0002-0000-0000-000000000004', 'aaaaaaaa-0000-0000-0000-000000000002', 'Aquece 1 ovo no micro-ondas em 45 segundos, coloca em cima de torrada.', 4, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0002-0000-0000-000000000005', 'aaaaaaaa-0000-0000-0000-000000000002', 'Abre 1 pacote de salada pronta, joga azeite e limão. Come com pão.', 5, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0002-0000-0000-000000000006', 'aaaaaaaa-0000-0000-0000-000000000002', 'Pega 1 lata de sardinha, escorre e mistura com arroz de ontem.', 6, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0002-0000-0000-000000000007', 'aaaaaaaa-0000-0000-0000-000000000002', 'Abre 1 pacote de peito de peru fatiado, enrola em alface.', 7, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0002-0000-0000-000000000008', 'aaaaaaaa-0000-0000-0000-000000000002', 'Mistura 1 lata de milho com 1 lata de atum e azeite. Pronto.', 8, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0002-0000-0000-000000000009', 'aaaaaaaa-0000-0000-0000-000000000002', 'Pega 1 pão de forma, passa requeijão e cobre com tomate e queijo.', 9, ARRAY['A','B','C']),
  ('bbbbbbbb-0002-0000-0000-000000000010', 'aaaaaaaa-0000-0000-0000-000000000002', 'Abre 1 sopa de feijão pronta, aquece e joga azeite por cima.', 10, ARRAY['B','C','D']),
  ('bbbbbbbb-0002-0000-0000-000000000011', 'aaaaaaaa-0000-0000-0000-000000000002', 'Tosta 2 fatias de pão integral, passa pasta de amendoim em uma e mel na outra.', 11, ARRAY['A','B','C']),
  ('bbbbbbbb-0002-0000-0000-000000000012', 'aaaaaaaa-0000-0000-0000-000000000002', 'Pega 1 iogurte natural grande, mistura com granola e come.', 12, ARRAY['B','C']),
  ('bbbbbbbb-0002-0000-0000-000000000013', 'aaaaaaaa-0000-0000-0000-000000000002', 'Abre 1 pacote de polenguinho, come com palitos de cenoura prontos.', 13, ARRAY['A','B','C']),
  ('bbbbbbbb-0002-0000-0000-000000000014', 'aaaaaaaa-0000-0000-0000-000000000002', 'Mistura 1 ovo cozido picado com 1 colher de maionese e come com torrada.', 14, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0002-0000-0000-000000000015', 'aaaaaaaa-0000-0000-0000-000000000002', 'Pega 1 banana, corta em rodelas, adiciona aveia e mel. Refeição pronta.', 15, ARRAY['A','B','C'])
ON CONFLICT (id) DO NOTHING;

-- Situação 3: Almoço Fora com Colegas (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem, perfil) VALUES
  ('bbbbbbbb-0003-0000-0000-000000000001', 'aaaaaaaa-0000-0000-0000-000000000003', 'Pega 1 prato, enche metade com salada crua primeiro.', 1, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000002', 'aaaaaaaa-0000-0000-0000-000000000003', 'Escolhe 1 proteína grelhada, pede sem molho à parte.', 2, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000003', 'aaaaaaaa-0000-0000-0000-000000000003', 'Pega 1 concha de arroz, 1 de feijão, monta prato pequeno.', 3, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000004', 'aaaaaaaa-0000-0000-0000-000000000003', 'Evita o buffet de frituras, passa direto para as grelhas.', 4, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000005', 'aaaaaaaa-0000-0000-0000-000000000003', 'Pega 1 prato de sopa de legumes como entrada.', 5, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000006', 'aaaaaaaa-0000-0000-0000-000000000003', 'Escolhe 1 opção de peixe grelhado, limão ao invés de molho.', 6, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000007', 'aaaaaaaa-0000-0000-0000-000000000003', 'Pede 1 copo de água antes de começar a comer.', 7, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000008', 'aaaaaaaa-0000-0000-0000-000000000003', 'Pega só 1 fatia de pão, não repete.', 8, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000009', 'aaaaaaaa-0000-0000-0000-000000000003', 'Divide o prato: metade vegetais, quarto proteína, quarto carboidrato.', 9, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000010', 'aaaaaaaa-0000-0000-0000-000000000003', 'Pede para tirar o acompanhamento frito, troca por salada.', 10, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000011', 'aaaaaaaa-0000-0000-0000-000000000003', 'Evita refrigerante, pede água com limão ou chá gelado sem açúcar.', 11, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000012', 'aaaaaaaa-0000-0000-0000-000000000003', 'Come devagar, mastiga 20 vezes cada garfada.', 12, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000013', 'aaaaaaaa-0000-0000-0000-000000000003', 'Pega 1 prato só, não volta ao buffet.', 13, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000014', 'aaaaaaaa-0000-0000-0000-000000000003', 'Escolhe frango ou carne grelhada, evita ensopados com molho.', 14, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0003-0000-0000-000000000015', 'aaaaaaaa-0000-0000-0000-000000000003', 'Sobremesa: escolhe 1 fruta ao invés de doce.', 15, ARRAY['A','B','C','D'])
ON CONFLICT (id) DO NOTHING;

-- Situação 4: Fim de Semana sem Rotina (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem, perfil) VALUES
  ('bbbbbbbb-0004-0000-0000-000000000001', 'aaaaaaaa-0000-0000-0000-000000000004', 'Prepara 1 pote de frutas cortadas de manhã, disponível o dia todo.', 1, ARRAY['C']),
  ('bbbbbbbb-0004-0000-0000-000000000002', 'aaaaaaaa-0000-0000-0000-000000000004', 'Mantém 1 garrafa de água na mesa de centro, bebe antes de pegar lanche.', 2, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0004-0000-0000-000000000003', 'aaaaaaaa-0000-0000-0000-000000000004', 'Pega 1 prato fundo para qualquer refeição, nunca come na embalagem.', 3, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0004-0000-0000-000000000004', 'aaaaaaaa-0000-0000-0000-000000000004', 'Prepara 1 bandeja com vegetais crus e pasta de amendoim para beliscar.', 4, ARRAY['C']),
  ('bbbbbbbb-0004-0000-0000-000000000005', 'aaaaaaaa-0000-0000-0000-000000000004', 'Define 1 horário para "café da tarde", respeita como compromisso.', 5, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0004-0000-0000-000000000006', 'aaaaaaaa-0000-0000-0000-000000000004', 'Acorda, bebe 1 copo de água antes de qualquer coisa.', 6, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0004-0000-0000-000000000007', 'aaaaaaaa-0000-0000-0000-000000000004', 'Prepara café da manhã até 1h após acordar, mesmo que seja simples.', 7, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0004-0000-0000-000000000008', 'aaaaaaaa-0000-0000-0000-000000000004', 'Almoça em horário definido, evita comer "quando der".', 8, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0004-0000-0000-000000000009', 'aaaaaaaa-0000-0000-0000-000000000004', 'Prepara 1 jarra de água saborizada com limão e hortelã.', 9, ARRAY['B','C','D']),
  ('bbbbbbbb-0004-0000-0000-000000000010', 'aaaaaaaa-0000-0000-0000-000000000004', 'Come fora da cozinha/acabou, escova os dentes imediatamente.', 10, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0004-0000-0000-000000000011', 'aaaaaaaa-0000-0000-0000-000000000004', 'Define 1 horário de fechamento da cozinha à noite.', 11, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0004-0000-0000-000000000012', 'aaaaaaaa-0000-0000-0000-000000000004', 'Prepara 1 lancheira para o passeio do dia, evita comprar por impulso.', 12, ARRAY['A','B']),
  ('bbbbbbbb-0004-0000-0000-000000000013', 'aaaaaaaa-0000-0000-0000-000000000004', 'Corta legumes na véspera, deixa na geladeira prontos.', 13, ARRAY['B','C']),
  ('bbbbbbbb-0004-0000-0000-000000000014', 'aaaaaaaa-0000-0000-0000-000000000004', 'Faz 1 lista de compras antes de ir ao mercado, não compra por impulso.', 14, ARRAY['A','B']),
  ('bbbbbbbb-0004-0000-0000-000000000015', 'aaaaaaaa-0000-0000-0000-000000000004', 'Organiza 1 refeição principal do dia em família, sentados à mesa.', 15, ARRAY['C','D'])
ON CONFLICT (id) DO NOTHING;

-- Situação 5: Fome Emocional / Ansiedade (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem, perfil) VALUES
  ('bbbbbbbb-0005-0000-0000-000000000001', 'aaaaaaaa-0000-0000-0000-000000000005', 'Bebe 1 copo de água grande, espera 10 minutos antes de decidir.', 1, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0005-0000-0000-000000000002', 'aaaaaaaa-0000-0000-0000-000000000005', 'Escova os dentes e passa fio dental imediatamente.', 2, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0005-0000-0000-000000000003', 'aaaaaaaa-0000-0000-0000-000000000005', 'Sai para 1 caminhada de 10 minutos ao redor do quarteirão.', 3, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0005-0000-0000-000000000004', 'aaaaaaaa-0000-0000-0000-000000000005', 'Liga para 1 amiga e conversa por 5 minutos.', 4, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0005-0000-0000-000000000005', 'aaaaaaaa-0000-0000-0000-000000000005', 'Pinta as unhas ou faz 1 skincare rápido.', 5, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0005-0000-0000-000000000006', 'aaaaaaaa-0000-0000-0000-000000000005', 'Fecha os olhos, faz 10 respirações profundas contando até 4.', 6, ARRAY['B','C','D']),
  ('bbbbbbbb-0005-0000-0000-000000000007', 'aaaaaaaa-0000-0000-0000-000000000005', 'Escreve no celular: "O que estou sentindo agora?" Responde com 3 palavras.', 7, ARRAY['B','C','D']),
  ('bbbbbbbb-0005-0000-0000-000000000008', 'aaaaaaaa-0000-0000-0000-000000000005', 'Pega 1 chá de camomila, bebe devagar sentada.', 8, ARRAY['C','D']),
  ('bbbbbbbb-0005-0000-0000-000000000009', 'aaaaaaaa-0000-0000-0000-000000000005', 'Coloca 1 música alta e dança sozinha por 1 música.', 9, ARRAY['A','B','C']),
  ('bbbbbbbb-0005-0000-0000-000000000010', 'aaaaaaaa-0000-0000-0000-000000000005', 'Sai do ambiente, vai para outro cômodo da casa.', 10, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0005-0000-0000-000000000011', 'aaaaaaaa-0000-0000-0000-000000000005', 'Lava o rosto com água fria, troca de roupa.', 11, ARRAY['B','C','D']),
  ('bbbbbbbb-0005-0000-0000-000000000012', 'aaaaaaaa-0000-0000-0000-000000000005', 'Abre o app de meditação, faz 3 minutos de respiração guiada.', 12, ARRAY['C','D']),
  ('bbbbbbbb-0005-0000-0000-000000000013', 'aaaaaaaa-0000-0000-0000-000000000005', 'Liga para a mãe/familiar, conversa sobre o dia.', 13, ARRAY['C','D']),
  ('bbbbbbbb-0005-0000-0000-000000000014', 'aaaaaaaa-0000-0000-0000-000000000005', 'Faz 1 alongamento rápido, 5 minutos.', 14, ARRAY['A','B','C']),
  ('bbbbbbbb-0005-0000-0000-000000000015', 'aaaaaaaa-0000-0000-0000-000000000005', 'Escreve 1 mensagem para si mesma: "Isso vai passar."', 15, ARRAY['B','C','D'])
ON CONFLICT (id) DO NOTHING;

-- Situação 6: Café da Manhã Corrido (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem, perfil) VALUES
  ('bbbbbbbb-0006-0000-0000-000000000001', 'aaaaaaaa-0000-0000-0000-000000000006', 'Pega 1 banana e 1 caixinha de leite, toma no caminho.', 1, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000002', 'aaaaaaaa-0000-0000-0000-000000000006', 'Mistura 1 iogurte com granola em pote, come no elevador.', 2, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000003', 'aaaaaaaa-0000-0000-0000-000000000006', 'Tosta 1 pão de forma, passa requeijão, come andando.', 3, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000004', 'aaaaaaaa-0000-0000-0000-000000000006', 'Pega 1 fruta + 1 punhado de castanha, guarda no bolso.', 4, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000005', 'aaaaaaaa-0000-0000-0000-000000000006', 'Prepara 1 shake de banana e leite na garrafa, toma no ônibus.', 5, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000006', 'aaaaaaaa-0000-0000-0000-000000000006', 'Pega 1 barrinha de cereal, come no primeiro sinal de trânsito.', 6, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000007', 'aaaaaaaa-0000-0000-0000-000000000006', 'Abre 1 iogurte drink, toma enquanto organiza a bolsa.', 7, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000008', 'aaaaaaaa-0000-0000-0000-000000000006', 'Pega 1 fatia de queijo e 1 maçã, come no carro.', 8, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000009', 'aaaaaaaa-0000-0000-0000-000000000006', 'Prepara 1 sanduíche de peito de peru na véspera, come na fila.', 9, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000010', 'aaaaaaaa-0000-0000-0000-000000000006', 'Mistura aveia com leite em potinho na geladeira desde ontem.', 10, ARRAY['B']),
  ('bbbbbbbb-0006-0000-0000-000000000011', 'aaaaaaaa-0000-0000-0000-000000000006', 'Pega 1 pão de queijo congelado, aquece 30s, come saindo.', 11, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000012', 'aaaaaaaa-0000-0000-0000-000000000006', 'Toma 1 copo de leite com 1 colher de mel antes de sair.', 12, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000013', 'aaaaaaaa-0000-0000-0000-000000000006', 'Pega 1 tangerina + 1 ovo cozido pronto, descasca no elevador.', 13, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000014', 'aaaaaaaa-0000-0000-0000-000000000006', 'Abre 1 iogurte grego, adiciona mel, come na parada de ônibus.', 14, ARRAY['A']),
  ('bbbbbbbb-0006-0000-0000-000000000015', 'aaaaaaaa-0000-0000-0000-000000000006', 'Pega 1 wrap de queijo cottage enrolado, come andando.', 15, ARRAY['A'])
ON CONFLICT (id) DO NOTHING;

-- Situação 7: Supermercado sem Planejamento (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem, perfil) VALUES
  ('bbbbbbbb-0007-0000-0000-000000000001', 'aaaaaaaa-0000-0000-0000-000000000007', 'Pega 1 cesta pequena, nunca carrinho grande.', 1, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000002', 'aaaaaaaa-0000-0000-0000-000000000007', 'Vai direto ao caixa, compra só 1 item: 1 fruta ou 1 água.', 2, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000003', 'aaaaaaaa-0000-0000-0000-000000000007', 'Liga para 1 amiga enquanto anda, não deixa olhar prateleiras.', 3, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000004', 'aaaaaaaa-0000-0000-0000-000000000007', 'Pega 1 lista no celular, mesmo que mental: 3 itens máximo.', 4, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000005', 'aaaaaaaa-0000-0000-0000-000000000007', 'Entra pela porta dos fundos, vai direto ao hortifruti.', 5, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000006', 'aaaaaaaa-0000-0000-0000-000000000007', 'Compra 1 pacote de frutas já lavadas, prontas para consumo.', 6, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000007', 'aaaaaaaa-0000-0000-0000-000000000007', 'Evita corredores centrais, onde estão os industrializados.', 7, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000008', 'aaaaaaaa-0000-0000-0000-000000000007', 'Pega 1 galão de água mineral, é seu único item.', 8, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000009', 'aaaaaaaa-0000-0000-0000-000000000007', 'Compra só o que está na promoção de verdura/legume.', 9, ARRAY['B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000010', 'aaaaaaaa-0000-0000-0000-000000000007', 'Pega 1 bandeja de ovos e 1 dúzia de bananas, pronto.', 10, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000011', 'aaaaaaaa-0000-0000-0000-000000000007', 'Usa fone de ouvido, ouve podcast, não se distrai com prateleiras.', 11, ARRAY['A','B','C']),
  ('bbbbbbbb-0007-0000-0000-000000000012', 'aaaaaaaa-0000-0000-0000-000000000007', 'Compra 1 pacote de castanhas e 1 fruta, paga e sai.', 12, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000013', 'aaaaaaaa-0000-0000-0000-000000000007', 'Evita o setor de congelados, passa direto.', 13, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000014', 'aaaaaaaa-0000-0000-0000-000000000007', 'Compra 1 pão integral fatiado e 1 queijo, só isso.', 14, ARRAY['A','B','C','D']),
  ('bbbbbbbb-0007-0000-0000-000000000015', 'aaaaaaaa-0000-0000-0000-000000000007', 'Pega 1 iogurte natural para tomar na fila do caixa.', 15, ARRAY['A','B','C'])
ON CONFLICT (id) DO NOTHING;

