-- =====================================================
-- MIGRATION: Seed Completo - Modo Automático 80/20
-- =====================================================
-- Este arquivo adiciona todo o conteúdo ao banco existente
-- sem apagar dados anteriores.
-- =====================================================

-- =====================================================
-- 0. TABELA NOVA: whatsapp_messages
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

-- =====================================================
-- 1. DECISIONS - 7 Situações
-- =====================================================
INSERT INTO decisions (id, titulo, momento_do_dia, plano_minimo, ativo) VALUES
  ('dec10000-0000-0000-0000-000000000001', 'Fome Noturna', 'noite', 1, true),
  ('dec10000-0000-0000-0000-000000000002', 'Zero Energia para Cozinhar', 'qualquer', 1, true),
  ('dec10000-0000-0000-0000-000000000003', 'Almoço Fora com Colegas', 'tarde', 1, true),
  ('dec10000-0000-0000-0000-000000000004', 'Fim de Semana sem Rotina', 'qualquer', 1, true),
  ('dec10000-0000-0000-0000-000000000005', 'Fome Emocional / Ansiedade', 'qualquer', 1, true),
  ('dec10000-0000-0000-0000-000000000006', 'Café da Manhã Corrido', 'manha', 1, true),
  ('dec10000-0000-0000-0000-000000000007', 'Supermercado sem Planejamento', 'qualquer', 1, true)
ON CONFLICT DO NOTHING;

-- =====================================================
-- 2. DECISION_VARIATIONS - 105 variações (7x15)
-- =====================================================

-- Situação 1: Fome Noturna (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem) VALUES
  ('var10000-0000-0000-0000-000000000001', 'dec10000-0000-0000-0000-000000000001', 'Pega 1 banana, esmaga com garfo e polvilha canela em pó. Come com colher.', 1),
  ('var10000-0000-0000-0000-000000000002', 'dec10000-0000-0000-0000-000000000001', 'Fatia 1 maçã em rodelas, passa pasta de amendoim em cada uma.', 2),
  ('var10000-0000-0000-0000-000000000003', 'dec10000-0000-0000-0000-000000000001', 'Mistura 1 iogurte natural com 1 colher de mel e sementes de chia.', 3),
  ('var10000-0000-0000-0000-000000000004', 'dec10000-0000-0000-0000-000000000001', 'Tosta 1 fatia de pão integral, espalha requeijão light e cobre com tomate fatiado.', 4),
  ('var10000-0000-0000-0000-000000000005', 'dec10000-0000-0000-0000-000000000001', 'Abre 1 lata de atum, escorre e mistura com 1 colher de maionese. Come com palitos de cenoura.', 5),
  ('var10000-0000-0000-0000-000000000006', 'dec10000-0000-0000-0000-000000000001', 'Bebe 1 copo grande de água com gás e espera 10 minutos.', 6),
  ('var10000-0000-0000-0000-000000000007', 'dec10000-0000-0000-0000-000000000001', 'Pega 1 fruta qualquer que tiver na geladeira e come devagar.', 7),
  ('var10000-0000-0000-0000-000000000008', 'dec10000-0000-0000-0000-000000000001', 'Escova os dentes imediatamente.', 8),
  ('var10000-0000-0000-0000-000000000009', 'dec10000-0000-0000-0000-000000000001', 'Deita na cama e liga 1 vídeo curto no celular.', 9),
  ('var10000-0000-0000-0000-000000000010', 'dec10000-0000-0000-0000-000000000001', 'Faz 1 chá de camomila e toma morno.', 10),
  ('var10000-0000-0000-0000-000000000011', 'dec10000-0000-0000-0000-000000000001', 'Guarda 1 pacote de castanha na bolsa do trabalho para a noite.', 11),
  ('var10000-0000-0000-0000-000000000012', 'dec10000-0000-0000-0000-000000000001', 'Compra 1 iogurte na padaria próxima antes de chegar em casa.', 12),
  ('var10000-0000-0000-0000-000000000013', 'dec10000-0000-0000-0000-000000000001', 'Prepara 1 marmita com fruta já cortada de manhã.', 13),
  ('var10000-0000-0000-0000-000000000014', 'dec10000-0000-0000-0000-000000000001', 'Mantém potes com frutas já lavadas na prateleira da geladeira.', 14),
  ('var10000-0000-0000-0000-000000000015', 'dec10000-0000-0000-0000-000000000001', 'Deixa aveia e canela no balcão da cozinha sempre visível.', 15)
ON CONFLICT DO NOTHING;

-- Situação 2: Zero Energia para Cozinhar (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem) VALUES
  ('var10000-0000-0000-0000-000000000101', 'dec10000-0000-0000-0000-000000000002', 'Abre 1 lata de sopa de legumes, aquece no micro-ondas.', 1),
  ('var10000-0000-0000-0000-000000000102', 'dec10000-0000-0000-0000-000000000002', 'Mistura 1 lata de atum com arroz de panela de ontem.', 2),
  ('var10000-0000-0000-0000-000000000103', 'dec10000-0000-0000-0000-000000000002', 'Pega 1 pão sírio, espalha homus e enrola pepino em fatias.', 3),
  ('var10000-0000-0000-0000-000000000104', 'dec10000-0000-0000-0000-000000000002', 'Aquece 1 ovo no micro-ondas em 45 segundos, coloca em cima de torrada.', 4),
  ('var10000-0000-0000-0000-000000000105', 'dec10000-0000-0000-0000-000000000002', 'Abre 1 pacote de salada pronta, joga azeite e limão. Come com pão.', 5),
  ('var10000-0000-0000-0000-000000000106', 'dec10000-0000-0000-0000-000000000002', 'Pega 1 pote de iogurte natural e mistura 1 colher de granola.', 6),
  ('var10000-0000-0000-0000-000000000107', 'dec10000-0000-0000-0000-000000000002', 'Abre 1 pacote de castanhas e come 1 punhado.', 7),
  ('var10000-0000-0000-0000-000000000108', 'dec10000-0000-0000-0000-000000000002', 'Aquece 1 concha de sopa congelada no micro-ondas.', 8),
  ('var10000-0000-0000-0000-000000000109', 'dec10000-0000-0000-0000-000000000002', 'Mistura 1 lata de sardinha com arroz pronto.', 9),
  ('var10000-0000-0000-0000-000000000110', 'dec10000-0000-0000-0000-000000000002', 'Pega 2 fatias de queijo e come com 1 fruta.', 10),
  ('var10000-0000-0000-0000-000000000111', 'dec10000-0000-0000-0000-000000000002', 'Faz 1 tapioca com requeijão.', 11),
  ('var10000-0000-0000-0000-000000000112', 'dec10000-0000-0000-0000-000000000002', 'Aquece 1 ovo cozido pronto e come com salada pronta.', 12),
  ('var10000-0000-0000-0000-000000000113', 'dec10000-0000-0000-0000-000000000002', 'Mistura 1 pacote de sopa instantânea com água quente.', 13),
  ('var10000-0000-0000-0000-000000000114', 'dec10000-0000-0000-0000-000000000002', 'Pega 1 sanduíche natural pronto na padaria.', 14),
  ('var10000-0000-0000-0000-000000000115', 'dec10000-0000-0000-0000-000000000002', 'Abre 1 pacote de queijo cottage e come com tomate.', 15)
ON CONFLICT DO NOTHING;

-- Situação 3: Almoço Fora com Colegas (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem) VALUES
  ('var10000-0000-0000-0000-000000000201', 'dec10000-0000-0000-0000-000000000003', 'Pega 1 prato, enche metade com salada crua primeiro.', 1),
  ('var10000-0000-0000-0000-000000000202', 'dec10000-0000-0000-0000-000000000003', 'Escolhe 1 proteína grelhada, pede sem molho à parte.', 2),
  ('var10000-0000-0000-0000-000000000203', 'dec10000-0000-0000-0000-000000000003', 'Pega 1 concha de arroz, 1 de feijão, monta prato pequeno.', 3),
  ('var10000-0000-0000-0000-000000000204', 'dec10000-0000-0000-0000-000000000003', 'Evita o buffet de frituras, passa direto para as grelhas.', 4),
  ('var10000-0000-0000-0000-000000000205', 'dec10000-0000-0000-0000-000000000003', 'Pega 1 prato de sopa de legumes como entrada.', 5),
  ('var10000-0000-0000-0000-000000000206', 'dec10000-0000-0000-0000-000000000003', 'Bebe 1 copo de água antes de começar a comer.', 6),
  ('var10000-0000-0000-0000-000000000207', 'dec10000-0000-0000-0000-000000000003', 'Come devagar, mastiga bem cada garfada.', 7),
  ('var10000-0000-0000-0000-000000000208', 'dec10000-0000-0000-0000-000000000003', 'Pega só 1 porção de cada item, não repete.', 8),
  ('var10000-0000-0000-0000-000000000209', 'dec10000-0000-0000-0000-000000000003', 'Evita refrigerante, pede água com limão.', 9),
  ('var10000-0000-0000-0000-000000000210', 'dec10000-0000-0000-0000-000000000003', 'Diz não à sobremesa, pede 1 café.', 10),
  ('var10000-0000-0000-0000-000000000211', 'dec10000-0000-0000-0000-000000000003', 'Escolhe frango ou peixe grelhado no lugar de fritura.', 11),
  ('var10000-0000-0000-0000-000000000212', 'dec10000-0000-0000-0000-000000000003', 'Pega vegetais no vapor se tiver disponível.', 12),
  ('var10000-0000-0000-0000-000000000213', 'dec10000-0000-0000-0000-000000000003', 'Evita o pão da cesta, foca no prato principal.', 13),
  ('var10000-0000-0000-0000-000000000214', 'dec10000-0000-0000-0000-000000000003', 'Para de comer quando sentir saciedade, não quando acabar o prato.', 14),
  ('var10000-0000-0000-0000-000000000215', 'dec10000-0000-0000-0000-000000000003', 'Pede para levar metade para viagem se o prato for grande.', 15)
ON CONFLICT DO NOTHING;

-- Situação 4: Fim de Semana sem Rotina (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem) VALUES
  ('var10000-0000-0000-0000-000000000301', 'dec10000-0000-0000-0000-000000000004', 'Prepara 1 pote de frutas cortadas de manhã, disponível o dia todo.', 1),
  ('var10000-0000-0000-0000-000000000302', 'dec10000-0000-0000-0000-000000000004', 'Mantém 1 garrafa de água na mesa de centro, bebe antes de pegar lanche.', 2),
  ('var10000-0000-0000-0000-000000000303', 'dec10000-0000-0000-0000-000000000004', 'Pega 1 prato fundo para qualquer refeição, nunca come na embalagem.', 3),
  ('var10000-0000-0000-0000-000000000304', 'dec10000-0000-0000-0000-000000000004', 'Prepara 1 bandeja com vegetais crus e pasta de amendoim para beliscar.', 4),
  ('var10000-0000-0000-0000-000000000305', 'dec10000-0000-0000-0000-000000000004', 'Define 1 horário para "café da tarde", respeita como compromisso.', 5),
  ('var10000-0000-0000-0000-000000000306', 'dec10000-0000-0000-0000-000000000004', 'Faz 1 refeição principal no horário certo, não fica beliscando o dia todo.', 6),
  ('var10000-0000-0000-0000-000000000307', 'dec10000-0000-0000-0000-000000000004', 'Organiza a geladeira deixando frutas e vegetais na frente.', 7),
  ('var10000-0000-0000-0000-000000000308', 'dec10000-0000-0000-0000-000000000004', 'Evita comprar "guloseimas" no mercado, não tem em casa.', 8),
  ('var10000-0000-0000-0000-000000000309', 'dec10000-0000-0000-0000-000000000004', 'Faz 1 caminhada de 15 minutos após o almoço.', 9),
  ('var10000-0000-0000-0000-000000000310', 'dec10000-0000-0000-0000-000000000004', 'Prepara 1 jantar leve, não fica até tarde na mesa.', 10),
  ('var10000-0000-0000-0000-000000000311', 'dec10000-0000-0000-0000-000000000004', 'Lava a louça logo após a refeição, não deixa acumular.', 11),
  ('var10000-0000-0000-0000-000000000312', 'dec10000-0000-0000-0000-000000000004', 'Convida a família para ajudar no preparo da refeição.', 12),
  ('var10000-0000-0000-0000-000000000313', 'dec10000-0000-0000-0000-000000000004', 'Faz 1 lista de compras saudáveis para a semana.', 13),
  ('var10000-0000-0000-0000-000000000314', 'dec10000-0000-0000-0000-000000000004', 'Dorme 1 hora a mais, descanso ajuda na alimentação.', 14),
  ('var10000-0000-0000-0000-000000000315', 'dec10000-0000-0000-0000-000000000004', 'Planeja 1 atividade divertida que não envolva comida.', 15)
ON CONFLICT DO NOTHING;

-- Situação 5: Fome Emocional / Ansiedade (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem) VALUES
  ('var10000-0000-0000-0000-000000000401', 'dec10000-0000-0000-0000-000000000005', 'Bebe 1 copo de água grande, espera 10 minutos antes de decidir.', 1),
  ('var10000-0000-0000-0000-000000000402', 'dec10000-0000-0000-0000-000000000005', 'Escova os dentes e passa fio dental imediatamente.', 2),
  ('var10000-0000-0000-0000-000000000403', 'dec10000-0000-0000-0000-000000000005', 'Sai para 1 caminhada de 10 minutos ao redor do quarteirão.', 3),
  ('var10000-0000-0000-0000-000000000404', 'dec10000-0000-0000-0000-000000000005', 'Liga para 1 amiga e conversa por 5 minutos.', 4),
  ('var10000-0000-0000-0000-000000000405', 'dec10000-0000-0000-0000-000000000005', 'Pinta as unhas ou faz 1 skincare rápido.', 5),
  ('var10000-0000-0000-0000-000000000406', 'dec10000-0000-0000-0000-000000000005', 'Faz 5 respirações profundas, conta até 10.', 6),
  ('var10000-0000-0000-0000-000000000407', 'dec10000-0000-0000-0000-000000000005', 'Escreve 3 coisas pelas quais você é grata.', 7),
  ('var10000-0000-0000-0000-000000000408', 'dec10000-0000-0000-0000-000000000005', 'Toma 1 banho morno para relaxar.', 8),
  ('var10000-0000-0000-0000-000000000409', 'dec10000-0000-0000-0000-000000000005', 'Liga 1 música favorita e dança sozinha.', 9),
  ('var10000-0000-0000-0000-000000000410', 'dec10000-0000-0000-0000-000000000005', 'Organiza 1 gaveta ou armário para distrair a mente.', 10),
  ('var10000-0000-0000-0000-000000000411', 'dec10000-0000-0000-0000-000000000005', 'Faz 1 chá de camomila sem açúcar.', 11),
  ('var10000-0000-0000-0000-000000000412', 'dec10000-0000-0000-0000-000000000005', 'Assiste 1 episódio de série favorita.', 12),
  ('var10000-0000-0000-0000-000000000413', 'dec10000-0000-0000-0000-000000000005', 'Pergunta para si mesma: "Estou com fome física ou emocional?"', 13),
  ('var10000-0000-0000-0000-000000000414', 'dec10000-0000-0000-0000-000000000005', 'Espera 20 minutos, a vontade geralmente passa.', 14),
  ('var10000-0000-0000-0000-000000000415', 'dec10000-0000-0000-0000-000000000005', 'Faz 1 meditação guiada de 5 minutos no celular.', 15)
ON CONFLICT DO NOTHING;

-- Situação 6: Café da Manhã Corrido (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem) VALUES
  ('var10000-0000-0000-0000-000000000501', 'dec10000-0000-0000-0000-000000000006', 'Pega 1 banana e 1 caixinha de leite, toma no caminho.', 1),
  ('var10000-0000-0000-0000-000000000502', 'dec10000-0000-0000-0000-000000000006', 'Mistura 1 iogurte com granola em pote, come no elevador.', 2),
  ('var10000-0000-0000-0000-000000000503', 'dec10000-0000-0000-0000-000000000006', 'Tosta 1 pão de forma, passa requeijão, come andando.', 3),
  ('var10000-0000-0000-0000-000000000504', 'dec10000-0000-0000-0000-000000000006', 'Pega 1 fruta + 1 punhado de castanha, guarda no bolso.', 4),
  ('var10000-0000-0000-0000-000000000505', 'dec10000-0000-0000-0000-000000000006', 'Prepara 1 shake de banana e leite na garrafa, toma no ônibus.', 5),
  ('var10000-0000-0000-0000-000000000506', 'dec10000-0000-0000-0000-000000000006', 'Come 1 maçã inteira no caminho.', 6),
  ('var10000-0000-0000-0000-000000000507', 'dec10000-0000-0000-0000-000000000006', 'Pega 1 pão de queijo na padaria.', 7),
  ('var10000-0000-0000-0000-000000000508', 'dec10000-0000-0000-0000-000000000006', 'Prepara 1 tapioca de ontem, aquece no micro-ondas.', 8),
  ('var10000-0000-0000-0000-000000000509', 'dec10000-0000-0000-0000-000000000006', 'Toma 1 copo de suco natural + 1 torrada.', 9),
  ('var10000-0000-0000-0000-000000000510', 'dec10000-0000-0000-0000-000000000006', 'Come 1 mamão já cortado que deixou pronto.', 10),
  ('var10000-0000-0000-0000-000000000511', 'dec10000-0000-0000-0000-000000000006', 'Pega 1 barrinha de cereal e 1 fruta.', 11),
  ('var10000-0000-0000-0000-000000000512', 'dec10000-0000-0000-0000-000000000006', 'Faz 1 ovo de caneca em 2 minutos.', 12),
  ('var10000-0000-0000-0000-000000000513', 'dec10000-0000-0000-0000-000000000006', 'Mistura aveia com iogurte no pote.', 13),
  ('var10000-0000-0000-0000-000000000514', 'dec10000-0000-0000-0000-000000000006', 'Come 1 sanduíche natural pronto.', 14),
  ('var10000-0000-0000-0000-000000000515', 'dec10000-0000-0000-0000-000000000006', 'Toma 1 vitamina de banana com leite.', 15)
ON CONFLICT DO NOTHING;

-- Situação 7: Supermercado sem Planejamento (15 variações)
INSERT INTO decision_variations (id, decision_id, texto_acao, ordem) VALUES
  ('var10000-0000-0000-0000-000000000601', 'dec10000-0000-0000-0000-000000000007', 'Pega 1 cesta pequena, nunca carrinho grande.', 1),
  ('var10000-0000-0000-0000-000000000602', 'dec10000-0000-0000-0000-000000000007', 'Vai direto ao caixa, compra só 1 item: 1 fruta ou 1 água.', 2),
  ('var10000-0000-0000-0000-000000000603', 'dec10000-0000-0000-0000-000000000007', 'Liga para 1 amiga enquanto anda, não deixa olhar prateleiras.', 3),
  ('var10000-0000-0000-0000-000000000604', 'dec10000-0000-0000-0000-000000000007', 'Pega 1 lista no celular, mesmo que mental: 3 itens máximo.', 4),
  ('var10000-0000-0000-0000-000000000605', 'dec10000-0000-0000-0000-000000000007', 'Entra pela porta dos fundos, vai direto ao hortifruti.', 5),
  ('var10000-0000-0000-0000-000000000606', 'dec10000-0000-0000-0000-000000000007', 'Evita os corredores do meio, só periferia.', 6),
  ('var10000-0000-0000-0000-000000000607', 'dec10000-0000-0000-0000-000000000007', 'Não vai ao mercado com fome, come algo antes.', 7),
  ('var10000-0000-0000-0000-000000000608', 'dec10000-0000-0000-0000-000000000007', 'Pega só itens da lista, nada de impulso.', 8),
  ('var10000-0000-0000-0000-000000000609', 'dec10000-0000-0000-0000-000000000007', 'Evita prateleiras de doces e salgadinhos.', 9),
  ('var10000-0000-0000-0000-000000000610', 'dec10000-0000-0000-0000-000000000007', 'Compra frutas e vegetais primeiro.', 10),
  ('var10000-0000-0000-0000-000000000611', 'dec10000-0000-0000-0000-000000000007', 'Evita produtos com marketing agressivo.', 11),
  ('var10000-0000-0000-0000-000000000612', 'dec10000-0000-0000-0000-000000000007', 'Não compra nada que não esteja na lista.', 12),
  ('var10000-0000-0000-0000-000000000613', 'dec10000-0000-0000-0000-000000000007', 'Pega água em vez de refrigerante.', 13),
  ('var10000-0000-0000-0000-000000000614', 'dec10000-0000-0000-0000-000000000007', 'Sai pela saída mais próxima do caixa.', 14),
  ('var10000-0000-0000-0000-000000000615', 'dec10000-0000-0000-0000-000000000007', 'Faz as contas antes de ir, leva só o dinheiro necessário.', 15)
ON CONFLICT DO NOTHING;

-- =====================================================
-- 3. RECIPES - 80 Receitas
-- =====================================================

-- CAFÉ DA MANHÃ (20 receitas)
INSERT INTO recipes (id, nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
  ('rcp00000-0000-0000-0000-000000000001', 'Iogurte Turbinado', ARRAY['iogurte natural', 'aveia', 'banana', 'mel'], 'manha', 2, 15.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000002', 'Pão com Requeijão e Tomate', ARRAY['pão de forma', 'requeijão', 'tomate'], 'manha', 3, 5.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000003', 'Banana com Amendoim', ARRAY['banana', 'pasta de amendoim'], 'manha', 2, 15.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000004', 'Sanduíche de Queijo Frio', ARRAY['pão de forma', 'queijo muçarela', 'manteiga'], 'manha', 2, 15.0, ARRAY['A','B','C'], true),
  ('rcp00000-0000-0000-0000-000000000005', 'Aveia com Leite e Maçã', ARRAY['aveia', 'leite integral', 'maçã'], 'manha', 3, 15.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000006', 'Tapioca Pronta com Requeijão', ARRAY['tapioca pronta (pacote)', 'requeijão'], 'manha', 1, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000007', 'Frutas com Castanha', ARRAY['banana', 'maçã', 'castanha-do-pará'], 'manha', 3, 5.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000008', 'Ovo de Caneca', ARRAY['ovo', 'leite', 'manteiga'], 'manha', 2, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000009', 'Bolo de Caneca de Banana', ARRAY['banana amassada', 'aveia', 'ovo', 'leite'], 'manha', 3, 15.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000010', 'Mingau de Aveia Expresso', ARRAY['aveia', 'leite', 'mel'], 'manha', 3, 15.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000011', 'Pão de Queijo de Caneca', ARRAY['polvilho', 'queijo ralado', 'ovo', 'leite'], 'manha', 3, 15.0, ARRAY['A','B','C'], true),
  ('rcp00000-0000-0000-0000-000000000012', 'Omelete de Caneca', ARRAY['ovo', 'presunto picado', 'queijo', 'leite'], 'manha', 3, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000013', 'Batata Doce no Micro-ondas', ARRAY['batata doce pequena'], 'manha', 3, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000014', 'Tapioca de Micro-ondas', ARRAY['goma de tapioca', 'água', 'sal'], 'manha', 3, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000015', 'Ovo Mexido Turbinado', ARRAY['ovo', 'requeijão', 'presunto picado'], 'manha', 5, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000016', 'Panqueca de Banana', ARRAY['banana amassada', 'ovo', 'aveia'], 'manha', 8, 15.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000017', 'Tapioca na Frigideira', ARRAY['goma de tapioca', 'manteiga', 'queijo'], 'manha', 5, 15.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000018', 'Ovo Frito com Pão', ARRAY['ovo', 'manteiga', 'pão de forma'], 'manha', 5, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000019', 'Crepioca Rápida', ARRAY['tapioca', 'ovo', 'queijo'], 'manha', 7, 25.0, ARRAY['A','B','C'], true),
  ('rcp00000-0000-0000-0000-000000000020', 'Pão na Chapa com Ovo', ARRAY['pão francês', 'manteiga', 'ovo'], 'manha', 6, 25.0, ARRAY['A','B','C','D'], true)
ON CONFLICT DO NOTHING;

-- ALMOÇO/JANTAR (25 receitas)
INSERT INTO recipes (id, nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
  ('rcp00000-0000-0000-0000-000000000021', 'Salada de Atum com Arroz', ARRAY['atum em lata', 'arroz pronto', 'tomate', 'cebola'], 'tarde', 5, 25.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000022', 'Sanduíche de Sardinha', ARRAY['pão de forma', 'sardinha em lata', 'tomate'], 'tarde', 3, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000023', 'Arroz com Feijão e Ovo Cozido', ARRAY['arroz pronto', 'feijão pronto', 'ovo cozido'], 'tarde', 4, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000024', 'Salada de Frango Desfiado', ARRAY['frango desfiado', 'alface', 'tomate', 'cenoura ralada'], 'tarde', 5, 25.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000025', 'Wrap de Presunto e Queijo', ARRAY['pão de forma grande', 'presunto', 'queijo', 'tomate'], 'tarde', 3, 15.0, ARRAY['A','B','C'], true),
  ('rcp00000-0000-0000-0000-000000000026', 'Cuscuz com Sardinha', ARRAY['cuscuz pronto', 'sardinha em lata', 'manteiga'], 'tarde', 4, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000027', 'Arroz com Linguiça Fria', ARRAY['arroz pronto', 'linguiça calabresa cozida'], 'tarde', 3, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000028', 'Salada de Macarrão com Atum', ARRAY['macarrão cozido', 'atum em lata', 'tomate', 'azeite'], 'tarde', 5, 25.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000029', 'Macarrão com Manteiga e Queijo', ARRAY['macarrão', 'manteiga', 'queijo muçarela ralado'], 'tarde', 10, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000030', 'Arroz de Forno Rápido', ARRAY['arroz pronto', 'queijo', 'presunto', 'ovo'], 'tarde', 8, 25.0, ARRAY['A','B','C'], true),
  ('rcp00000-0000-0000-0000-000000000031', 'Frango Grelhado Rápido', ARRAY['filé de frango', 'alho', 'sal', 'manteiga'], 'tarde', 10, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000032', 'Omelete de Queijo e Presunto', ARRAY['ovo', 'queijo', 'presunto', 'manteiga'], 'tarde', 6, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000033', 'Carne Moída Refogada', ARRAY['carne moída', 'cebola', 'alho', 'óleo'], 'tarde', 10, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000034', 'Batata Frita na Frigideira', ARRAY['batata', 'óleo', 'sal'], 'tarde', 10, 5.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000035', 'Linguiça Acebolada', ARRAY['linguiça calabresa', 'cebola', 'óleo'], 'tarde', 8, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000036', 'Peixe Frito Rápido', ARRAY['filé de peixe', 'limão', 'sal', 'farinha de mandioca'], 'tarde', 8, 25.0, ARRAY['A','B','C'], true),
  ('rcp00000-0000-0000-0000-000000000037', 'Couve Refogada com Alho', ARRAY['couve', 'alho', 'óleo', 'sal'], 'tarde', 5, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000038', 'Arroz com Ovo e Cebolinha', ARRAY['arroz pronto', 'ovo', 'cebolinha', 'óleo'], 'tarde', 7, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000039', 'Arroz de Micro-ondas', ARRAY['arroz cru', 'água', 'sal'], 'tarde', 3, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000040', 'Batata Assada no Micro-ondas', ARRAY['batata', 'manteiga', 'sal'], 'tarde', 6, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000041', 'Brócolis no Micro-ondas', ARRAY['brócolis', 'água', 'sal'], 'tarde', 5, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000042', 'Ovo Pochê no Micro-ondas', ARRAY['ovo', 'água', 'vinagre'], 'tarde', 2, 25.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000043', 'Cenoura Cozida no Micro-ondas', ARRAY['cenoura', 'água', 'manteiga'], 'tarde', 5, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000044', 'Sopa de Legumes Instantânea', ARRAY['legumes congelados', 'água', 'caldo de galinha'], 'tarde', 6, 5.0, ARRAY['A','B','C'], true),
  ('rcp00000-0000-0000-0000-000000000045', 'Peixe no Micro-ondas', ARRAY['filé de peixe', 'limão', 'sal', 'manteiga'], 'tarde', 5, 25.0, ARRAY['A','B'], true)
ON CONFLICT DO NOTHING;

-- LANCHE NOTURNO (20 receitas)
INSERT INTO recipes (id, nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
  ('rcp00000-0000-0000-0000-000000000046', 'Banana com Mel', ARRAY['banana', 'mel'], 'noite', 1, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000047', 'Iogurte com Mel e Canela', ARRAY['iogurte natural', 'mel', 'canela em pó'], 'noite', 2, 15.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000048', 'Maçã Assada no Micro-ondas', ARRAY['maçã', 'mel', 'canela'], 'noite', 4, 5.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000049', 'Abacaxi com Iogurte', ARRAY['abacaxi em calda', 'iogurte natural'], 'noite', 2, 5.0, ARRAY['A','B','C'], true),
  ('rcp00000-0000-0000-0000-000000000050', 'Pera com Mel', ARRAY['pera', 'mel'], 'noite', 2, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000051', 'Smoothie de Banana', ARRAY['banana', 'leite', 'mel'], 'noite', 3, 15.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000052', 'Laranja com Mel', ARRAY['laranja', 'mel'], 'noite', 2, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000053', 'Ovo Cozido com Sal', ARRAY['ovo', 'sal'], 'noite', 1, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000054', 'Queijo com Pão Tostado', ARRAY['queijo muçarela', 'pão de forma', 'manteiga'], 'noite', 5, 15.0, ARRAY['A','B','C'], true),
  ('rcp00000-0000-0000-0000-000000000055', 'Requeijão com Pão', ARRAY['requeijão', 'pão de forma'], 'noite', 1, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000056', 'Ovo Frito Pequeno', ARRAY['ovo', 'manteiga', 'sal'], 'noite', 4, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000057', 'Tapioca com Queijo', ARRAY['goma de tapioca', 'queijo muçarela'], 'noite', 5, 15.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000058', 'Pão com Manteiga e Alho', ARRAY['pão', 'manteiga', 'alho amassado'], 'noite', 5, 5.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000059', 'Queijo Quente na Frigideira', ARRAY['queijo muçarela em fatias'], 'noite', 3, 15.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000060', 'Água com Limão', ARRAY['água', 'limão'], 'noite', 1, 0.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000061', 'Chá de Camomila com Torrada', ARRAY['chá de camomila', 'torrada'], 'noite', 3, 5.0, ARRAY['A','B'], true),
  ('rcp00000-0000-0000-0000-000000000062', 'Caldo de Legumes Pronto', ARRAY['caldo de legumes', 'água'], 'noite', 3, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000063', 'Pepino com Sal', ARRAY['pepino', 'sal'], 'noite', 2, 0.0, ARRAY['A','B','C'], true),
  ('rcp00000-0000-0000-0000-000000000064', 'Cenoura Crua Ralada', ARRAY['cenoura', 'limão', 'sal'], 'noite', 4, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000065', 'Água de Coco Natural', ARRAY['água de coco'], 'noite', 1, 0.0, ARRAY['A','B','C','D'], true)
ON CONFLICT DO NOTHING;

-- EMERGÊNCIA (15 receitas - usam 'tarde' como momento_do_dia)
INSERT INTO recipes (id, nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
  ('rcp00000-0000-0000-0000-000000000066', 'Leite Quente com Película', ARRAY['leite integral'], 'tarde', 5, 15.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000067', 'Banana Inteira', ARRAY['banana'], 'tarde', 1, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000068', 'Ovo Cozido Pronto', ARRAY['ovo cozido'], 'tarde', 1, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000069', 'Queijo em Fatia', ARRAY['queijo muçarela em fatia'], 'tarde', 0, 15.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000070', 'Pão Seco', ARRAY['pão de forma ou francês'], 'tarde', 0, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000071', 'Requeijão no Pão', ARRAY['pão', 'requeijão'], 'tarde', 1, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000072', 'Atum na Lata Escorrido', ARRAY['atum em lata'], 'tarde', 1, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000073', 'Iogurte Natural', ARRAY['iogurte natural'], 'tarde', 0, 15.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000074', 'Aveia com Água', ARRAY['aveia', 'água'], 'tarde', 2, 15.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000075', 'Sardinha no Pão', ARRAY['pão', 'sardinha em lata'], 'tarde', 2, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000076', 'Manteiga no Pão', ARRAY['pão', 'manteiga'], 'tarde', 1, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000077', 'Arroz com Manteiga', ARRAY['arroz pronto', 'manteiga'], 'tarde', 3, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000078', 'Macarrão com Manteiga', ARRAY['macarrão cozido', 'manteiga'], 'tarde', 3, 5.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000079', 'Ovo Mexido no Micro-ondas', ARRAY['ovo', 'leite'], 'tarde', 2, 25.0, ARRAY['A','B','C','D'], true),
  ('rcp00000-0000-0000-0000-000000000080', 'Queijo Derretido no Micro-ondas', ARRAY['queijo muçarela'], 'tarde', 2, 15.0, ARRAY['A','B','C','D'], true)
ON CONFLICT DO NOTHING;

-- =====================================================
-- 4. WHATSAPP_MESSAGES - 173 Mensagens
-- =====================================================

-- TIPO 1: Ativação Diária (35 mensagens)
INSERT INTO whatsapp_messages (id, codigo, tipo, situacao, texto, perfil, gatilho) VALUES
  ('msg00000-0000-0000-0000-000000000001', 'ATIVA-001', 'ativacao', 'Café na correria', 'Café na correria? Pega uma fruta antes de sair. Feito? Manda FIZ.', ARRAY['A'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000002', 'ATIVA-002', 'ativacao', 'Reunião que estica', 'Reunião que estica? Bebe um copo d''água antes do almoço. Feito? Manda FIZ.', ARRAY['A'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000003', 'ATIVA-003', 'ativacao', 'Trabalho em casa', 'Dia de home office? Levanta a cada hora e bebe água. Feito? Manda FIZ.', ARRAY['B'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000004', 'ATIVA-004', 'ativacao', 'Almoço corrido', 'Almoço corrido? Mastiga 20 vezes cada garfada. Feito? Manda FIZ.', ARRAY['A','B'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000005', 'ATIVA-005', 'ativacao', 'Lanche da tarde', 'Hora do lanche? Troca o doce por uma fruta. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000006', 'ATIVA-006', 'ativacao', 'Jantar em família', 'Jantar em família? Serve vegetais primeiro no prato. Feito? Manda FIZ.', ARRAY['C'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000007', 'ATIVA-007', 'ativacao', 'Criança com fome', 'Criança pedindo lanche? Oferece fruta primeiro. Feito? Manda FIZ.', ARRAY['C'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000008', 'ATIVA-008', 'ativacao', 'Turno noturno', 'Trabalhando à noite? Prepara um lanche saudável antes. Feito? Manda FIZ.', ARRAY['D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000009', 'ATIVA-009', 'ativacao', 'Fome noturna', 'Fome à noite? Bebe água e espera 10 min. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000010', 'ATIVA-010', 'ativacao', 'Domingo de preguiça', 'Domingo de preguiça? Faz uma refeição com atenção plena. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000011', 'ATIVA-011', 'ativacao', 'Festa hoje', 'Festa hoje? Come algo leve antes de sair de casa. Feito? Manda FIZ.', ARRAY['A','B'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000012', 'ATIVA-012', 'ativacao', 'Happy hour', 'Happy hour? Define quantos drinks vai tomar antes. Feito? Manda FIZ.', ARRAY['A','B'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000013', 'ATIVA-013', 'ativacao', 'Noite com amigas', 'Noite com as amigas? Come devagar e conversa entre garfadas. Feito? Manda FIZ.', ARRAY['A','B'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000014', 'ATIVA-014', 'ativacao', 'Almoço de negócios', 'Almoço de negócios? Escolhe proteína e salada. Feito? Manda FIZ.', ARRAY['A'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000015', 'ATIVA-015', 'ativacao', 'Viagem', 'Viajando? Pega água em vez de refrigerante. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000016', 'ATIVA-016', 'ativacao', 'Noite de sofá', 'Noite de sofá? Prepara um chá antes de abrir a geladeira. Feito? Manda FIZ.', ARRAY['B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000017', 'ATIVA-017', 'ativacao', 'Série maratona', 'Maratonando série? Sem comida na mão, só água. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000018', 'ATIVA-018', 'ativacao', 'Estudando', 'Estudando? Pausa a cada 45 min, não a cada lanche. Feito? Manda FIZ.', ARRAY['A','B'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000019', 'ATIVA-019', 'ativacao', 'Sozinha em casa', 'Sozinha em casa? Pergunta se é fome ou tédio antes de comer. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000020', 'ATIVA-020', 'ativacao', 'Teletrabalho', 'Teletrabalho? Almoça longe do computador. Feito? Manda FIZ.', ARRAY['B'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000021', 'ATIVA-021', 'ativacao', 'Dia difícil', 'Dia difícil? Faz 5 respirações antes do almoço. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000022', 'ATIVA-022', 'ativacao', 'Estresse no trabalho', 'Estressada no trabalho? Não compensa com comida. Feito? Manda FIZ.', ARRAY['A'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000023', 'ATIVA-023', 'ativacao', ' TPM', 'Sensível hoje? Escolhe comida que te faz bem, não pior. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000024', 'ATIVA-024', 'ativacao', 'Ansiedade', 'Ansiedade à tona? Come sentada, sem fazer outra coisa. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000025', 'ATIVA-025', 'ativacao', 'Triste', 'Triste? Liga para alguém antes de abrir a geladeira. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000026', 'ATIVA-026', 'ativacao', 'Cansaço', 'Cansada? Descansa 20 min antes de decidir o que comer. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000027', 'ATIVA-027', 'ativacao', 'Entediada', 'Entediada? Sai para caminhar 15 min. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000028', 'ATIVA-028', 'ativacao', 'Gripe', 'Gripe? Sopa e descanso, sem culpa. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000029', 'ATIVA-029', 'ativacao', 'Insônia', 'Acordada de madrugada? Água morna, não comida. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000030', 'ATIVA-030', 'ativacao', 'Má digestão', 'Digestão ruim? Próxima refeição mais leve. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000031', 'ATIVA-031', 'ativacao', 'Ida ao mercado', 'Ida ao mercado? Não vai com fome. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000032', 'ATIVA-032', 'ativacao', 'Compras online', 'Comprando comida online? Lista antes, carrinho depois. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000033', 'ATIVA-033', 'ativacao', 'Padaria', 'Na padaria? Pega pão integral ou integral com aveia. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000034', 'ATIVA-034', 'ativacao', 'Lembrete de água', 'Lembrete de água? Bebe um copo agora, antes de qualquer coisa. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico'),
  ('msg00000-0000-0000-0000-000000000035', 'ATIVA-035', 'ativacao', 'Fim do dia', 'Fim do dia? Revisa o que funcionou hoje. Feito? Manda FIZ.', ARRAY['A','B','C','D'], 'automatico')
ON CONFLICT (codigo) DO NOTHING;

-- TIPO 2: Resposta FIZ (30 mensagens)
INSERT INTO whatsapp_messages (id, codigo, tipo, situacao, texto, gatilho) VALUES
  ('msg00000-0000-0000-0000-000000000101', 'FIZ-001', 'resposta_fiz', 'Neutro', 'Anotado. Até amanhã.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000102', 'FIZ-002', 'resposta_fiz', 'Neutro', 'Visto. Seguimos.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000103', 'FIZ-003', 'resposta_fiz', 'Neutro', 'Ok. Próxima decisão vem amanhã.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000104', 'FIZ-004', 'resposta_fiz', 'Neutro', 'Registrado.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000105', 'FIZ-005', 'resposta_fiz', 'Neutro', 'Recebido.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000106', 'FIZ-006', 'resposta_fiz', 'Neutro', 'Confirmado.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000107', 'FIZ-007', 'resposta_fiz', 'Neutro', 'Anotado aqui.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000108', 'FIZ-008', 'resposta_fiz', 'Neutro', 'Ok.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000109', 'FIZ-009', 'resposta_fiz', 'Neutro', 'Certo.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000110', 'FIZ-010', 'resposta_fiz', 'Neutro', 'Entendido.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000111', 'FIZ-011', 'resposta_fiz', 'Identidade', 'Você é do tipo que faz. Isso é raro.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000112', 'FIZ-012', 'resposta_fiz', 'Identidade', 'Mulher que decide, mulher que executa.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000113', 'FIZ-013', 'resposta_fiz', 'Identidade', 'Padrão seu: escolhe e faz.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000114', 'FIZ-014', 'resposta_fiz', 'Identidade', 'Quem faz uma vez, faz de novo.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000115', 'FIZ-015', 'resposta_fiz', 'Identidade', 'Você está construindo algo.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000116', 'FIZ-016', 'resposta_fiz', 'Identidade', 'Isso é disciplina. E disciplina é liberdade.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000117', 'FIZ-017', 'resposta_fiz', 'Identidade', 'Sua palavra vale. Você disse que ia fazer e fez.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000118', 'FIZ-018', 'resposta_fiz', 'Identidade', 'Pequenas escolhas, grandes resultados.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000119', 'FIZ-019', 'resposta_fiz', 'Identidade', 'Você está do lado da consistência.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000120', 'FIZ-020', 'resposta_fiz', 'Identidade', 'Uma decisão de cada vez. Você está no caminho.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000121', 'FIZ-021', 'resposta_fiz', 'Micro-dica', 'Amanhã: se for dia corrido, prepara algo na véspera.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000122', 'FIZ-022', 'resposta_fiz', 'Micro-dica', 'Prepara: deixa a fruta na bolsa para amanhã.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000123', 'FIZ-023', 'resposta_fiz', 'Micro-dica', 'Olha: seu corpo responde à consistência, não à perfeição.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000124', 'FIZ-024', 'resposta_fiz', 'Micro-dica', 'Dica: o próximo passo é sempre o mais importante.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000125', 'FIZ-025', 'resposta_fiz', 'Micro-dica', 'Lembrete: 80% atenção, 20% flexibilidade.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000126', 'FIZ-026', 'resposta_fiz', 'Micro-dica', 'Amanhã é outro dia. Uma decisão por vez.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000127', 'FIZ-027', 'resposta_fiz', 'Micro-dica', 'Dica: durma bem. O sono afeta a fome.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000128', 'FIZ-028', 'resposta_fiz', 'Micro-dica', 'Lembrete: água antes de cada refeição.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000129', 'FIZ-029', 'resposta_fiz', 'Micro-dica', 'Prepara o ambiente: fruta na mesa, guloseimas fora do alcance.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000130', 'FIZ-030', 'resposta_fiz', 'Micro-dica', 'Amanhã começa hoje: o que você pode preparar agora?', 'keyword')
ON CONFLICT (codigo) DO NOTHING;

-- TIPO 3: Resposta NÃO CONSEGUI (30 mensagens)
INSERT INTO whatsapp_messages (id, codigo, tipo, situacao, texto, gatilho) VALUES
  ('msg00000-0000-0000-0000-000000000201', 'NAO-001', 'resposta_nao', 'Acolhimento', 'Acontece. Amanhã tem outra decisão.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000202', 'NAO-002', 'resposta_nao', 'Acolhimento', 'Tudo bem não conseguir às vezes.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000203', 'NAO-003', 'resposta_nao', 'Acolhimento', 'Entendido. O sistema é para os dias bons e ruins.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000204', 'NAO-004', 'resposta_nao', 'Acolhimento', 'Recebido. Amanhã é novo dia.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000205', 'NAO-005', 'resposta_nao', 'Acolhimento', 'Ok. Sem julgamento aqui.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000206', 'NAO-006', 'resposta_nao', 'Acolhimento', 'Anotado. Seguimos juntas.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000207', 'NAO-007', 'resposta_nao', 'Acolhimento', 'Feito. Dizer que não conseguiu também é participar.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000208', 'NAO-008', 'resposta_nao', 'Acolhimento', 'Entendido. O importante é continuar tentando.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000209', 'NAO-009', 'resposta_nao', 'Acolhimento', 'Tudo certo. Amanhã tem mais.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000210', 'NAO-010', 'resposta_nao', 'Acolhimento', 'Sem problema. Cada dia é diferente.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000211', 'NAO-011', 'resposta_nao', 'Alternativa', 'Então faz isso: bebe um copo d''água agora.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000212', 'NAO-012', 'resposta_nao', 'Alternativa', 'Simplifica: próxima refeição, come mais devagar.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000213', 'NAO-013', 'resposta_nao', 'Alternativa', 'Reduz: metade do que você ia comer.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000214', 'NAO-014', 'resposta_nao', 'Alternativa', 'Substitui: troca a ação por uma pergunta para si mesma.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000215', 'NAO-015', 'resposta_nao', 'Alternativa', 'Agora: levanta e bebe água.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000216', 'NAO-016', 'resposta_nao', 'Alternativa', 'Mini-ação: 3 respirações profundas.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000217', 'NAO-017', 'resposta_nao', 'Alternativa', 'Plano B: come 1 fruta.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000218', 'NAO-018', 'resposta_nao', 'Alternativa', 'Alternativa: escova os dentes agora.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000219', 'NAO-019', 'resposta_nao', 'Alternativa', 'Faz diferente: sai para caminhar 5 min.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000220', 'NAO-020', 'resposta_nao', 'Alternativa', 'Micro-ação: estica o corpo por 1 min.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000221', 'NAO-021', 'resposta_nao', 'Ressignificação', 'Não conseguir é dado: o que te impediu hoje?', 'keyword'),
  ('msg00000-0000-0000-0000-000000000222', 'NAO-022', 'resposta_nao', 'Ressignificação', 'Informação valiosa: quando a coisa desandou?', 'keyword'),
  ('msg00000-0000-0000-0000-000000000223', 'NAO-023', 'resposta_nao', 'Ressignificação', 'Insight: padrões se revelam nos dois lados.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000224', 'NAO-024', 'resposta_nao', 'Ressignificação', 'Útil saber: em que momento a coisa desandou?', 'keyword'),
  ('msg00000-0000-0000-0000-000000000225', 'NAO-025', 'resposta_nao', 'Ressignificação', 'Aprendizado: o que você descobriu sobre você?', 'keyword'),
  ('msg00000-0000-0000-0000-000000000226', 'NAO-026', 'resposta_nao', 'Ressignificação', 'Observação: o que estava acontecendo ao redor?', 'keyword'),
  ('msg00000-0000-0000-0000-000000000227', 'NAO-027', 'resposta_nao', 'Ressignificação', 'Dado importante: fome física ou emocional?', 'keyword'),
  ('msg00000-0000-0000-0000-000000000228', 'NAO-028', 'resposta_nao', 'Ressignificação', 'Reflexão: o que você faria diferente?', 'keyword'),
  ('msg00000-0000-0000-0000-000000000229', 'NAO-029', 'resposta_nao', 'Ressignificação', 'Consciência: só de perceber já é progresso.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000230', 'NAO-030', 'resposta_nao', 'Ressignificação', 'Transformação: cada "não" te ensina sobre você.', 'keyword')
ON CONFLICT (codigo) DO NOTHING;

-- TIPO 4: Reengajamento (21 mensagens)
INSERT INTO whatsapp_messages (id, codigo, tipo, situacao, texto, gatilho) VALUES
  ('msg00000-0000-0000-0000-000000000301', 'REAT-001', 'reengajamento', 'Dia 1', 'Ontem não rolou. Hoje tem decisão nova.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000302', 'REAT-002', 'reengajamento', 'Dia 1', 'Sua decisão de ontem ficou no ar. Sem problema.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000303', 'REAT-003', 'reengajamento', 'Dia 1', 'Sem pressão. Quando der, você responde.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000304', 'REAT-004', 'reengajamento', 'Dia 1', 'Aqui não tem cobrança. Só convite.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000305', 'REAT-005', 'reengajamento', 'Dia 1', 'Hoje é novo dia. Nova decisão.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000306', 'REAT-006', 'reengajamento', 'Dia 1', 'Ontem foi ontem. Hoje é hoje.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000307', 'REAT-007', 'reengajamento', 'Dia 1', 'Recomeçar é permitido.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000308', 'REAT-008', 'reengajamento', 'Dia 2', 'Dois dias sem notícias. Tudo certo por aí?', 'automatico'),
  ('msg00000-0000-0000-0000-000000000309', 'REAT-009', 'reengajamento', 'Dia 2', 'Sua rotina mudou? Posso ajustar o horário.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000310', 'REAT-010', 'reengajamento', 'Dia 2', 'Dois dias. Curiosa para saber como você está.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000311', 'REAT-011', 'reengajamento', 'Dia 2', 'Sentiu falta da decisão de ontem?', 'automatico'),
  ('msg00000-0000-0000-0000-000000000312', 'REAT-012', 'reengajamento', 'Dia 2', 'Ainda por aí? Posso mandar a decisão de hoje?', 'automatico'),
  ('msg00000-0000-0000-0000-000000000313', 'REAT-013', 'reengajamento', 'Dia 2', 'Está tudo bem? Estou aqui quando precisar.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000314', 'REAT-014', 'reengajamento', 'Dia 2', 'Dois dias. Posso ajudar em algo?', 'automatico'),
  ('msg00000-0000-0000-0000-000000000315', 'REAT-015', 'reengajamento', 'Dia 3', 'Três dias. Talvez esse não seja o momento ideal.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000316', 'REAT-016', 'reengajamento', 'Dia 3', 'Pausa aqui. A porta fica aberta quando você quiser.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000317', 'REAT-017', 'reengajamento', 'Dia 3', 'Última mensagem por enquanto. Te espero quando for hora.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000318', 'REAT-018', 'reengajamento', 'Dia 3', 'Vou dar um tempo. Quando quiser voltar, é só mandar VOLTAR.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000319', 'REAT-019', 'reengajamento', 'Dia 3', 'Respeito seu espaço. Estarei aqui quando precisar.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000320', 'REAT-020', 'reengajamento', 'Dia 3', 'Te espero. Sem pressa.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000321', 'REAT-021', 'reengajamento', 'Dia 3', 'A decisão de voltar é só sua. Até logo.', 'automatico')
ON CONFLICT (codigo) DO NOTHING;

-- TIPO 5: Marcos de Streak (20 mensagens)
INSERT INTO whatsapp_messages (id, codigo, tipo, situacao, texto, gatilho) VALUES
  ('msg00000-0000-0000-0000-000000000401', 'STREAK-001', 'streak', '3 dias', 'Três dias. Começou um padrão.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000402', 'STREAK-002', 'streak', '3 dias', 'Terceiro dia. Isso já é diferente.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000403', 'STREAK-003', 'streak', '3 dias', 'Três decisões seguidas. Você está criando hábito.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000404', 'STREAK-004', 'streak', '3 dias', 'Três dias de consistência. Continue assim.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000405', 'STREAK-005', 'streak', '7 dias', 'Uma semana. Primeira linha cruzada. ✓', 'automatico'),
  ('msg00000-0000-0000-0000-000000000406', 'STREAK-006', 'streak', '7 dias', 'Sete dias. Seu novo normal está nascendo.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000407', 'STREAK-007', 'streak', '7 dias', 'Uma semana! Você está no caminho certo.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000408', 'STREAK-008', 'streak', '7 dias', 'Sete dias de escolhas conscientes. Parabéns!', 'automatico'),
  ('msg00000-0000-0000-0000-000000000409', 'STREAK-009', 'streak', '14 dias', 'Duas semanas. Isso já é diferente das outras vezes.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000410', 'STREAK-010', 'streak', '14 dias', 'Quatorze dias. Você está construindo de verdade.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000411', 'STREAK-011', 'streak', '14 dias', 'Duas semanas! Você provou que consegue.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000412', 'STREAK-012', 'streak', '14 dias', '14 dias de consistência. Você é forte.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000413', 'STREAK-013', 'streak', '21 dias', 'Três semanas. Transformação em andamento.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000414', 'STREAK-014', 'streak', '21 dias', 'Vinte e um dias. Você virou a página.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000415', 'STREAK-015', 'streak', '21 dias', '21 dias! Hábito formado. Você mudou.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000416', 'STREAK-016', 'streak', '21 dias', 'Três semanas de escolhas certas. Orgulho!', 'automatico'),
  ('msg00000-0000-0000-0000-000000000417', 'STREAK-017', 'streak', '30 dias', 'Um mês. Nova realidade estabelecida. 🎯', 'automatico'),
  ('msg00000-0000-0000-0000-000000000418', 'STREAK-018', 'streak', '30 dias', 'Trinta dias. Você cruzou uma linha real.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000419', 'STREAK-019', 'streak', '30 dias', 'Um mês de transformação. Você é outra pessoa.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000420', 'STREAK-020', 'streak', '30 dias', '30 dias! Você provou que pode mudar. 🎯', 'automatico')
ON CONFLICT (codigo) DO NOTHING;

-- TIPO 6: Upsell Contextual (12 mensagens)
INSERT INTO whatsapp_messages (id, codigo, tipo, situacao, texto, gatilho) VALUES
  ('msg00000-0000-0000-0000-000000000501', 'UPSELL-001', 'upsell', '10 FIZ', 'Dez decisões seguidas. Você está pronta para mais?', 'manual'),
  ('msg00000-0000-0000-0000-000000000502', 'UPSELL-002', 'upsell', '10 FIZ', 'Dez vezes você mostrou compromisso. Que tal mais decisões?', 'manual'),
  ('msg00000-0000-0000-0000-000000000503', 'UPSELL-003', 'upsell', '10 FIZ', 'Você está indo bem. Quer acesso a mais situações?', 'manual'),
  ('msg00000-0000-0000-0000-000000000504', 'UPSELL-004', 'upsell', '10 FIZ', 'Plano completo: café, almoço, lanche, jantar, mais três. Interessada?', 'manual'),
  ('msg00000-0000-0000-0000-000000000505', 'UPSELL-005', 'upsell', '20 FIZ', 'Vinte decisões. Você evoluiu para o próximo nível.', 'manual'),
  ('msg00000-0000-0000-0000-000000000506', 'UPSELL-006', 'upsell', '20 FIZ', 'Vinte vezes você mostrou compromisso. Que tal a versão completa?', 'manual'),
  ('msg00000-0000-0000-0000-000000000507', 'UPSELL-007', 'upsell', '20 FIZ', 'Parabéns pelos 20 dias! Quer acesso ao plano premium?', 'manual'),
  ('msg00000-0000-0000-0000-000000000508', 'UPSELL-008', 'upsell', '20 FIZ', '20 decisões! Você merece mais ferramentas.', 'manual'),
  ('msg00000-0000-0000-0000-000000000509', 'UPSELL-009', 'upsell', '25 FIZ', 'Vinte e cinco. Seu hábito está formado. Vamos manter juntas?', 'manual'),
  ('msg00000-0000-0000-0000-000000000510', 'UPSELL-010', 'upsell', '25 FIZ', '25 dias! Que tal garantir continuidade?', 'manual'),
  ('msg00000-0000-0000-0000-000000000511', 'UPSELL-011', 'upsell', '25 FIZ', 'Você está consistente. Vamos para recorrência?', 'manual'),
  ('msg00000-0000-0000-0000-000000000512', 'UPSELL-012', 'upsell', '25 FIZ', 'Recorrência: menos preocupação, mais consistência. Topa?', 'manual')
ON CONFLICT (codigo) DO NOTHING;

-- TIPO 7: Onboarding (10 mensagens)
INSERT INTO whatsapp_messages (id, codigo, tipo, situacao, texto, gatilho) VALUES
  ('msg00000-0000-0000-0000-000000000601', 'ONB-001', 'onboarding', 'Boas-vindas', 'Bem-vinda ao Modo Automático 80/20. Uma decisão por dia, sem dieta radical. Vamos começar?', 'automatico'),
  ('msg00000-0000-0000-0000-000000000602', 'ONB-002', 'onboarding', 'Boas-vindas', 'Oi! Aqui a gente faz diferente: 80% atenção, 20% flexibilidade. Uma decisão de cada vez. Pronta?', 'automatico'),
  ('msg00000-0000-0000-0000-000000000603', 'ONB-003', 'onboarding', 'Pergunta 1', 'Como é sua rotina? (A) Previsível, (B) Variável, (C) Caótica, (D) Estruturada. Responde com a letra.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000604', 'ONB-004', 'onboarding', 'Pergunta 2', 'O que mais te atrapalha? (A) Falta de tempo, (B) Ansiedade, (C) Família/social, (D) Não sei por onde começar.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000605', 'ONB-005', 'onboarding', 'Pergunta 3', 'Já tentou dieta antes? (A) Nunca, (B) Algumas vezes, (C) Muitas vezes, (D) Perdi as contas.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000606', 'ONB-006', 'onboarding', 'Pergunta 4', 'O que te move agora? (A) Saúde, (B) Estética, (C) Bem-estar, (D) Controle.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000607', 'ONB-007', 'onboarding', 'Pergunta 5', 'Que horário funciona? (A) Manhã, (B) Meio-dia, (C) Noite, (D) Varia.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000608', 'ONB-008', 'onboarding', 'Perfil A', 'Perfil A: sua rotina é aliada. Vou mandar decisões no horário que você escolheu.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000609', 'ONB-009', 'onboarding', 'Perfil B', 'Perfil B: flexibilidade é sua palavra. Ajusto as decisões conforme seu dia.', 'automatico'),
  ('msg00000-0000-0000-0000-000000000610', 'ONB-010', 'onboarding', 'Perfil C', 'Perfil C: sem pressão, sem culpa. Aqui você pode errar que é parte do processo.', 'automatico')
ON CONFLICT (codigo) DO NOTHING;

-- TIPO 8: Situações Especiais (15 mensagens)
INSERT INTO whatsapp_messages (id, codigo, tipo, situacao, texto, gatilho) VALUES
  ('msg00000-0000-0000-0000-000000000701', 'ESP-001', 'especial', 'Texto não reconhecido', 'Não entendi direito. Pode mandar ''FIZ'' se fez, ou ''NÃO CONSEGUI'' se não rolou?', 'keyword'),
  ('msg00000-0000-0000-0000-000000000702', 'ESP-002', 'especial', 'Texto não reconhecido', 'Sistema simples: recebe decisão, faz, manda ''FIZ''. Não fez, manda ''NÃO CONSEGUI''.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000703', 'ESP-003', 'especial', 'Texto não reconhecido', 'Não entendi. Manda ''FIZ'' ou ''NÃO CONSEGUI'' para eu registrar.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000704', 'ESP-004', 'especial', 'Pausa', 'Entendido. Pausa aqui. Quando quiser voltar, é só mandar ''VOLTEI''.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000705', 'ESP-005', 'especial', 'Pausa', 'Ok, pausado. Sua decisão de voltar é só sua.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000706', 'ESP-006', 'especial', 'Pausa', 'Pausa confirmada. Te espero quando quiser.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000707', 'ESP-007', 'especial', 'Cancelamento', 'Entendido. Cancelamento anotado. Quer me dizer o que não funcionou? (Opcional)', 'keyword'),
  ('msg00000-0000-0000-0000-000000000708', 'ESP-008', 'especial', 'Cancelamento', 'Ok, você saiu. Obrigada por tentar. 💭', 'keyword'),
  ('msg00000-0000-0000-0000-000000000709', 'ESP-009', 'especial', 'Cancelamento', 'Cancelado. Boa sorte na sua jornada.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000710', 'ESP-010', 'especial', 'Retorno', 'Voltou! Sem perguntas sobre onde estava. Vamos continuar de onde parou?', 'keyword'),
  ('msg00000-0000-0000-0000-000000000711', 'ESP-011', 'especial', 'Retorno', 'De volta. Não importa quanto tempo passou. Importa o que vem agora.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000712', 'ESP-012', 'especial', 'Retorno', 'Bom te ver de novo! Vamos seguir?', 'keyword'),
  ('msg00000-0000-0000-0000-000000000713', 'ESP-013', 'especial', 'Dúvida', 'Como funciona? Uma decisão por dia, no seu horário. Você faz, manda ''FIZ''.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000714', 'ESP-014', 'especial', 'Dúvida', 'Posso mudar horário? Claro. Manda ''MUDAR HORÁRIO'' e escolhe: manhã, meio-dia, noite ou varia.', 'keyword'),
  ('msg00000-0000-0000-0000-000000000715', 'ESP-015', 'especial', 'Dúvida', 'Quanto tempo até ver resultado? Depende do corpo, da consistência, da vida. O foco é o processo, não a balança.', 'keyword')
ON CONFLICT (codigo) DO NOTHING;

-- =====================================================
-- 5. RESUMO
-- =====================================================
DO $$
BEGIN
  RAISE NOTICE '========================================';
  RAISE NOTICE 'SEED COMPLETO EXECUTADO COM SUCESSO';
  RAISE NOTICE '========================================';
  RAISE NOTICE 'Tabela whatsapp_messages criada';
  RAISE NOTICE '7 decisions inseridas';
  RAISE NOTICE '105 decision_variations inseridas';
  RAISE NOTICE '80 recipes inseridas';
  RAISE NOTICE '173 whatsapp_messages inseridas';
  RAISE NOTICE '========================================';
END $$;
