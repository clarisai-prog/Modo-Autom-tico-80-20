-- 008_seed_situations_actions.sql
-- Seed: 7 situações + 224 entradas de conteúdo (105 variações + 35 emergências + 84 ações por perfil)
-- Executar APÓS 005_migration_novas_tabelas.sql

-- ============================================================
-- SITUAÇÕES (7)
-- ============================================================
INSERT INTO situations (id, nome, descricao, contexto, restricao, ordem) VALUES
('20000000-0000-0000-0000-000000000001','Fome Noturna','Após 20h, cansada, querendo algo gostoso',
 'Cansada, querendo algo gostoso, casa silenciosa.','Ação deve funcionar com geladeira semi-vazia.',1),
('20000000-0000-0000-0000-000000000002','Zero Energia para Cozinhar','Chegou destruída em casa',
 'Chegou destruída em casa, geladeira vazia ou sem vontade.','Máximo 5 minutos de preparo. Opções sem fogão incluídas.',2),
('20000000-0000-0000-0000-000000000003','Almoço Fora com Colegas','Self-service ou restaurante por quilo',
 'Self-service ou restaurante por quilo, pressão social, cardápio sem controle.','Ação deve funcionar sem chamar atenção dos colegas.',3),
('20000000-0000-0000-0000-000000000004','Fim de Semana sem Rotina','Sem horário fixo, família em casa',
 'Sem horário fixo, família em casa, tentação constante.','Ação não pode depender de preparo elaborado.',4),
('20000000-0000-0000-0000-000000000005','Fome Emocional / Ansiedade','Não está com fome real',
 'Não está com fome real, quer mastigar por estresse, tédio ou nervoso.','Metade das variações (8 de 15) é comportamental, não alimentar.',5),
('20000000-0000-0000-0000-000000000006','Café da Manhã Corrido','Acordou atrasada, zero tempo',
 'Acordou atrasada, zero tempo, pensa em pular refeição.','Ação em menos de 3 minutos, consumo possível em movimento.',6),
('20000000-0000-0000-0000-000000000007','Supermercado sem Planejamento','Foi ao mercado com fome ou sem lista',
 'Foi ao mercado com fome ou sem lista, risco de comprar errado.','Ação funciona dentro do próprio supermercado, antes de chegar em casa.',7);

-- ============================================================
-- SITUAÇÃO 1 — FOME NOTURNA
-- ============================================================

-- 15 variações principais
INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tempo_minutos, tipo) VALUES
('20000000-0000-0000-0000-000000000001', 1, 'Pega 1 banana, esmasa com garfo e polvilha canela em pó. Come com colher.',                       ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000001', 2, 'Fatia 1 maçã em rodelas, passa pasta de amendoim em cada uma.',                                    ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000001', 3, 'Mistura 1 iogurte natural com 1 colher de mel e sementes de chia.',                                 ARRAY['B','C'],         2, 'variacao'),
('20000000-0000-0000-0000-000000000001', 4, 'Tosta 1 fatia de pão integral, espalha requeijão light e cobre com tomate fatiado.',                ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000001', 5, 'Abre 1 lata de atum, escorre e mistura com 1 colher de maionese. Come com palitos de cenoura.',     ARRAY['A','B','C','D'], 4, 'variacao'),
('20000000-0000-0000-0000-000000000001', 6, 'Cozinha 1 ovo na água fervente enquanto pega 1 fatia de queijo. Come junto.',                       ARRAY['A','B','C','D'], 5, 'variacao'),
('20000000-0000-0000-0000-000000000001', 7, 'Pega 1 pera madura, corta ao meio e tira o miolo. Enche com queijo cottage.',                       ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000001', 8, 'Mistura 1 colher de aveia em flocos com leite até engrossar no micro-ondas.',                       ARRAY['B','C'],         3, 'variacao'),
('20000000-0000-0000-0000-000000000001', 9, 'Abre 1 pacote de queijo coalho, espete 3 palitos e tosta na frigideira seca.',                      ARRAY['A','B','C','D'], 4, 'variacao'),
('20000000-0000-0000-0000-000000000001',10, 'Pega 1 manga, corta em cubos e mistura com folhas de hortelã fresca.',                              ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000001',11, 'Tosta 1 pão de forma, espalha geleia de frutas vermelhas sem açúcar.',                              ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000001',12, 'Mistura 1 lata de grão-de-bico escorrido com azeite, sal e limão.',                                 ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000001',13, 'Pega 1 abacate, corta ao meio, tira o caroço e tempera com sal e limão. Come com colher.',           ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000001',14, 'Aquece 1 xícara de leite com 1 colher de chocolate em pó 50%.',                                     ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000001',15, 'Pega 1 punhado de amendoim torrado sem sal e 1 tangerina. Come alternando.',                        ARRAY['A','B','C','D'], 1, 'variacao');

-- 5 emergências
INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo) VALUES
('20000000-0000-0000-0000-000000000001', 1, 'Bebe 1 copo grande de água com gás e espera 10 minutos.',                ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000001', 2, 'Pega 1 fruta qualquer que tiver na geladeira e come devagar.',           ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000001', 3, 'Escova os dentes imediatamente.',                                        ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000001', 4, 'Deita na cama e liga 1 vídeo curto no celular.',                         ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000001', 5, 'Faz 1 chá de camomila e toma morno.',                                   ARRAY['A','B','C','D'], 'emergencia');

-- 12 ações por perfil (3 por perfil)
INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo, perfil_codigo, acao_ordem) VALUES
('20000000-0000-0000-0000-000000000001', 1, 'Guarda 1 pacote de castanha na bolsa do trabalho para a noite.',         ARRAY['A'], 'perfil_especifico', 'A', 1),
('20000000-0000-0000-0000-000000000001', 2, 'Compra 1 iogurte na padaria próxima antes de chegar em casa.',           ARRAY['A'], 'perfil_especifico', 'A', 2),
('20000000-0000-0000-0000-000000000001', 3, 'Prepara 1 marmita com fruta já cortada de manhã.',                       ARRAY['A'], 'perfil_especifico', 'A', 3),
('20000000-0000-0000-0000-000000000001', 4, 'Mantém potes com frutas já lavadas na prateleira da geladeira.',         ARRAY['B'], 'perfil_especifico', 'B', 1),
('20000000-0000-0000-0000-000000000001', 5, 'Deixa aveia e canela no balcão da cozinha sempre visível.',              ARRAY['B'], 'perfil_especifico', 'B', 2),
('20000000-0000-0000-0000-000000000001', 6, 'Prepara 1 jarra de água saborizada pela manhã.',                         ARRAY['B'], 'perfil_especifico', 'B', 3),
('20000000-0000-0000-0000-000000000001', 7, 'Corta frutas para os filhos e separa 1 porção para si mesma.',           ARRAY['C'], 'perfil_especifico', 'C', 1),
('20000000-0000-0000-0000-000000000001', 8, 'Faz 1 lote de geladinho de iogurte com fruta no fim de semana.',         ARRAY['C'], 'perfil_especifico', 'C', 2),
('20000000-0000-0000-0000-000000000001', 9, 'Combina com a família: horário do lanche da noite junto.',               ARRAY['C'], 'perfil_especifico', 'C', 3),
('20000000-0000-0000-0000-000000000001',10, 'Ajusta o "café da manhã" para o horário que acorda (após 20h).',         ARRAY['D'], 'perfil_especifico', 'D', 1),
('20000000-0000-0000-0000-000000000001',11, 'Mantém ovos e queijo sempre disponíveis para omelete rápida.',           ARRAY['D'], 'perfil_especifico', 'D', 2),
('20000000-0000-0000-0000-000000000001',12, 'Prepara 1 shake de banana e leite antes de dormir de dia.',              ARRAY['D'], 'perfil_especifico', 'D', 3);

-- ============================================================
-- SITUAÇÃO 2 — ZERO ENERGIA PARA COZINHAR
-- ============================================================

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tempo_minutos, tipo) VALUES
('20000000-0000-0000-0000-000000000002', 1, 'Abre 1 lata de sopa de legumes, aquece no micro-ondas.',                                           ARRAY['B','C'],         4, 'variacao'),
('20000000-0000-0000-0000-000000000002', 2, 'Mistura 1 lata de atum com arroz de panela de ontem.',                                             ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000002', 3, 'Pega 1 pão sírio, espalha homus e enrola pepino em fatias.',                                       ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000002', 4, 'Aquece 1 ovo no micro-ondas em 45 segundos, coloca em cima de torrada.',                           ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000002', 5, 'Abre 1 pacote de salada pronta, joga azeite e limão. Come com pão.',                               ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000002', 6, 'Mistura macarrão instantâneo com 1 ovo cru no caldo quente.',                                      ARRAY['A','B','C','D'], 5, 'variacao'),
('20000000-0000-0000-0000-000000000002', 7, 'Pega 1 batata doce cozida de ontem, corta e tosta na frigideira.',                                  ARRAY['B','C'],         4, 'variacao'),
('20000000-0000-0000-0000-000000000002', 8, 'Abre 1 lata de feijão, aquece e come com 1 colher de arroz.',                                      ARRAY['A','B','C','D'], 4, 'variacao'),
('20000000-0000-0000-0000-000000000002', 9, 'Espalha requeijão em 1 pão de forma, cobre com presunto e tosta.',                                 ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000002',10, 'Mistura 1 iogurte com aveia e deixa hidratando 5 minutos.',                                        ARRAY['A','B','C','D'], 5, 'variacao'),
('20000000-0000-0000-0000-000000000002',11, 'Pega 1 peito de frango assado de ontem, desfia e come com salada.',                                 ARRAY['B','C'],         3, 'variacao'),
('20000000-0000-0000-0000-000000000002',12, 'Aquece 1 sopa de feijão congelada caseira no micro-ondas.',                                        ARRAY['B','C'],         5, 'variacao'),
('20000000-0000-0000-0000-000000000002',13, 'Abre 1 pacote de queijo minas, corta em cubos e come com tomate.',                                 ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000002',14, 'Mistura 1 lata de milho com ervilha e atum. Tempera com limão.',                                   ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000002',15, 'Pega 1 wrap pronto, recheia com folhas e queijo. Tosta na frigideira.',                            ARRAY['A','B','C','D'], 4, 'variacao');

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo) VALUES
('20000000-0000-0000-0000-000000000002', 1, 'Pede 1 marmita fitness no app com entrega rápida.',                     ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000002', 2, 'Come 1 fruta + 1 punhado de nozes e deita.',                             ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000002', 3, 'Aquece 1 prato de comida de ontem no micro-ondas.',                      ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000002', 4, 'Faz 1 sanduíche de queijo com qualquer pão que tiver.',                  ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000002', 5, 'Bebe 1 copo de leite com achocolatado e dorme.',                         ARRAY['A','B','C','D'], 'emergencia');

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo, perfil_codigo, acao_ordem) VALUES
('20000000-0000-0000-0000-000000000002', 1, 'Identifica 1 restaurante por quilo próximo com opções leves.',           ARRAY['A'], 'perfil_especifico', 'A', 1),
('20000000-0000-0000-0000-000000000002', 2, 'Mantém 1 reserva de barrinhas de cereal na gaveta do trabalho.',         ARRAY['A'], 'perfil_especifico', 'A', 2),
('20000000-0000-0000-0000-000000000002', 3, 'Combina com colega: divide 1 delivery saudável.',                        ARRAY['A'], 'perfil_especifico', 'A', 3),
('20000000-0000-0000-0000-000000000002', 4, 'Congela porções individuais de sopa no fim de semana.',                  ARRAY['B'], 'perfil_especifico', 'B', 1),
('20000000-0000-0000-0000-000000000002', 5, 'Mantém ovos, pão e queijo sempre visíveis na bancada.',                  ARRAY['B'], 'perfil_especifico', 'B', 2),
('20000000-0000-0000-0000-000000000002', 6, 'Prepara 1 "kit sobrevivência" na geladeira: itens prontos.',             ARRAY['B'], 'perfil_especifico', 'B', 3),
('20000000-0000-0000-0000-000000000002', 7, 'Aproveita a janta da família: pega 1 porção menor.',                     ARRAY['C'], 'perfil_especifico', 'C', 1),
('20000000-0000-0000-0000-000000000002', 8, 'Pede ajuda para filho maior preparar 1 ovo ou sanduíche.',               ARRAY['C'], 'perfil_especifico', 'C', 2),
('20000000-0000-0000-0000-000000000002', 9, 'Mantém potes com legumes já cortados para montar prato rápido.',         ARRAY['C'], 'perfil_especifico', 'C', 3),
('20000000-0000-0000-0000-000000000002',10, 'Prepara 1 refeição principal ao acordar (horário invertido).',           ARRAY['D'], 'perfil_especifico', 'D', 1),
('20000000-0000-0000-0000-000000000002',11, 'Mantém marmitas congeladas próprias para o "jantar" da madrugada.',      ARRAY['D'], 'perfil_especifico', 'D', 2),
('20000000-0000-0000-0000-000000000002',12, 'Usa air fryer para aquecer alimentos sem ficar de olho.',                ARRAY['D'], 'perfil_especifico', 'D', 3);

-- ============================================================
-- SITUAÇÃO 3 — ALMOÇO FORA COM COLEGAS
-- ============================================================

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tempo_minutos, tipo) VALUES
('20000000-0000-0000-0000-000000000003', 1, 'Pega 1 prato, enche metade com salada crua primeiro.',                                             ARRAY['A','B','C','D'], 1, 'variacao'),
('20000000-0000-0000-0000-000000000003', 2, 'Escolhe 1 proteína grelhada, pede sem molho à parte.',                                             ARRAY['A','B','C','D'], 1, 'variacao'),
('20000000-0000-0000-0000-000000000003', 3, 'Pega 1 concha de arroz, 1 de feijão, monta prato pequeno.',                                        ARRAY['A','B','C','D'], 1, 'variacao'),
('20000000-0000-0000-0000-000000000003', 4, 'Evita o buffet de frituras, passa direto para as grelhas.',                                        ARRAY['A','B','C','D'], 0, 'variacao'),
('20000000-0000-0000-0000-000000000003', 5, 'Pega 1 prato de sopa de legumes como entrada.',                                                    ARRAY['A','B','C','D'], 1, 'variacao'),
('20000000-0000-0000-0000-000000000003', 6, 'Escolhe 1 fruta da sobremesa, deixa o doce de lado.',                                              ARRAY['A','B','C','D'], 1, 'variacao'),
('20000000-0000-0000-0000-000000000003', 7, 'Pede 1 copo de água com gás junto com o prato.',                                                   ARRAY['A','B','C','D'], 0, 'variacao'),
('20000000-0000-0000-0000-000000000003', 8, 'Pega 1 porção de legumes cozidos no vapor, sem manteiga.',                                         ARRAY['A','B','C','D'], 1, 'variacao'),
('20000000-0000-0000-0000-000000000003', 9, 'Monta 1 salada com folhas, tomate, cenoura e grão-de-bico.',                                       ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000003',10, 'Escolhe 1 peixe assado em vez de carne vermelha.',                                                 ARRAY['A','B','C','D'], 1, 'variacao'),
('20000000-0000-0000-0000-000000000003',11, 'Pega 1 colher de farofa, não enche o prato.',                                                      ARRAY['A','B','C','D'], 0, 'variacao'),
('20000000-0000-0000-0000-000000000003',12, 'Evita refrigerante, pede 1 suco natural sem açúcar.',                                              ARRAY['A','B','C','D'], 0, 'variacao'),
('20000000-0000-0000-0000-000000000003',13, 'Pega 1 omelete na hora, pede pouco queijo.',                                                       ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000003',14, 'Escolhe 1 creme de legumes como prato principal.',                                                 ARRAY['A','B','C','D'], 1, 'variacao'),
('20000000-0000-0000-0000-000000000003',15, 'Pega 1 tapioca recheada com frango desfiado.',                                                     ARRAY['A','B','C','D'], 2, 'variacao');

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo) VALUES
('20000000-0000-0000-0000-000000000003', 1, 'Pega só 1 prato de salada e 1 proteína, ignora o resto.',               ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000003', 2, 'Come devagar e bebe muita água durante a refeição.',                     ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000003', 3, 'Pede para embalar metade para viagem antes de começar.',                 ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000003', 4, 'Escolhe 1 sopa e 1 fruta, chama de almoço.',                             ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000003', 5, 'Diz que está de dieta do médico e pega pouco.',                          ARRAY['A','B','C','D'], 'emergencia');

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo, perfil_codigo, acao_ordem) VALUES
('20000000-0000-0000-0000-000000000003', 1, 'Leva 1 marmita e come no carro antes de entrar no restaurante.',         ARRAY['A'], 'perfil_especifico', 'A', 1),
('20000000-0000-0000-0000-000000000003', 2, 'Escolhe 1 item do buffet e repete só ele, sem variar.',                  ARRAY['A'], 'perfil_especifico', 'A', 2),
('20000000-0000-0000-0000-000000000003', 3, 'Marca almoço em restaurante à quilo com mais opções de salada.',         ARRAY['A'], 'perfil_especifico', 'A', 3),
('20000000-0000-0000-0000-000000000003', 4, 'Almoça antes de sair, vai ao encontro só pelo café.',                    ARRAY['B'], 'perfil_especifico', 'B', 1),
('20000000-0000-0000-0000-000000000003', 5, 'Sugere restaurante com opções saudáveis próximo ao escritório.',         ARRAY['B'], 'perfil_especifico', 'B', 2),
('20000000-0000-0000-0000-000000000003', 6, 'Mantém 1 lista no celular: "restaurantes aprovados" da região.',         ARRAY['B'], 'perfil_especifico', 'B', 3),
('20000000-0000-0000-0000-000000000003', 7, 'Pega 1 prato infantil ou meia porção se disponível.',                    ARRAY['C'], 'perfil_especifico', 'C', 1),
('20000000-0000-0000-0000-000000000003', 8, 'Divide 1 prato com filho ou cônjuge se estiver junto.',                  ARRAY['C'], 'perfil_especifico', 'C', 2),
('20000000-0000-0000-0000-000000000003', 9, 'Escolhe 1 restaurante com playground: criança distraída, você focada.',  ARRAY['C'], 'perfil_especifico', 'C', 3),
('20000000-0000-0000-0000-000000000003',10, 'Ajusta horário: almoça sozinha antes do turno, evita grupo.',            ARRAY['D'], 'perfil_especifico', 'D', 1),
('20000000-0000-0000-0000-000000000003',11, 'Pede 1 marmita para levar e come no horário de descanso.',               ARRAY['D'], 'perfil_especifico', 'D', 2),
('20000000-0000-0000-0000-000000000003',12, 'Combina com 1 colega de turno: avisa quando for dia de "descontrole".',  ARRAY['D'], 'perfil_especifico', 'D', 3);

-- ============================================================
-- SITUAÇÃO 4 — FIM DE SEMANA SEM ROTINA
-- ============================================================

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tempo_minutos, tipo) VALUES
('20000000-0000-0000-0000-000000000004', 1, 'Prepara 1 pote de frutas cortadas de manhã, disponível o dia todo.',                               ARRAY['C'],             5, 'variacao'),
('20000000-0000-0000-0000-000000000004', 2, 'Mantém 1 garrafa de água na mesa de centro, bebe antes de pegar lanche.',                          ARRAY['A','B','C','D'], 0, 'variacao'),
('20000000-0000-0000-0000-000000000004', 3, 'Pega 1 prato fundo para qualquer refeição, nunca come na embalagem.',                              ARRAY['A','B','C','D'], 0, 'variacao'),
('20000000-0000-0000-0000-000000000004', 4, 'Prepara 1 bandeja com vegetais crus e pasta de amendoim para beliscar.',                           ARRAY['C'],             5, 'variacao'),
('20000000-0000-0000-0000-000000000004', 5, 'Define 1 horário para "café da tarde", respeita como compromisso.',                                ARRAY['A','B','C','D'], 0, 'variacao'),
('20000000-0000-0000-0000-000000000004', 6, 'Pega 1 porção de pipoca caseira sem óleo para acompanhar filme.',                                  ARRAY['C'],             5, 'variacao'),
('20000000-0000-0000-0000-000000000004', 7, 'Mantém doces fora da vista, dentro de pote opaco no armário alto.',                                ARRAY['A','B','C','D'], 0, 'variacao'),
('20000000-0000-0000-0000-000000000004', 8, 'Prepara 1 jarra de suco natural pela manhã, serve em copo pequeno.',                               ARRAY['C'],             5, 'variacao'),
('20000000-0000-0000-0000-000000000004', 9, 'Pega 1 fruta antes de sair para qualquer compromisso externo.',                                    ARRAY['A','B','C','D'], 1, 'variacao'),
('20000000-0000-0000-0000-000000000004',10, 'Monta 1 "mesa de frios" leve: queijo, presunto, azeitona, tomate.',                                ARRAY['C'],             5, 'variacao'),
('20000000-0000-0000-0000-000000000004',11, 'Define 1 refeição principal do dia, as outras são leves.',                                         ARRAY['A','B','C','D'], 0, 'variacao'),
('20000000-0000-0000-0000-000000000004',12, 'Pega 1 iogurte congelado em vez de sorvete.',                                                      ARRAY['A','B','C','D'], 0, 'variacao'),
('20000000-0000-0000-0000-000000000004',13, 'Prepara 1 omelete com legumes para dividir com a família.',                                        ARRAY['C'],            10, 'variacao'),
('20000000-0000-0000-0000-000000000004',14, 'Mantém 1 bala ou chiclete sem açúcar na bolsa para momentos de tédio.',                            ARRAY['A','B','C','D'], 0, 'variacao'),
('20000000-0000-0000-0000-000000000004',15, 'Pega 1 prato de sopa leve antes do almoço principal.',                                             ARRAY['A','B','C','D'], 5, 'variacao');

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo) VALUES
('20000000-0000-0000-0000-000000000004', 1, 'Sai de casa para 1 passeio curto, longe da geladeira.',                 ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000004', 2, 'Liga para 1 amiga e conversa até a vontade passar.',                    ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000004', 3, 'Deita 20 minutos, define alarme para não prolongar.',                   ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000004', 4, 'Bebe 1 copo grande de água com limão.',                                 ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000004', 5, 'Pega 1 fruta e come sentada na mesa, sem celular.',                     ARRAY['A','B','C','D'], 'emergencia');

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo, perfil_codigo, acao_ordem) VALUES
('20000000-0000-0000-0000-000000000004', 1, 'Programa 1 atividade externa de manhã: feira, parque, shopping.',        ARRAY['A'], 'perfil_especifico', 'A', 1),
('20000000-0000-0000-0000-000000000004', 2, 'Prepara 1 marmita de sábado na sexta à noite.',                          ARRAY['A'], 'perfil_especifico', 'A', 2),
('20000000-0000-0000-0000-000000000004', 3, 'Define 1 horário fixo para almoço, mesmo sem trabalho.',                 ARRAY['A'], 'perfil_especifico', 'A', 3),
('20000000-0000-0000-0000-000000000004', 4, 'Separa 1 área da cozinha só para refeições, não come no escritório.',    ARRAY['B'], 'perfil_especifico', 'B', 1),
('20000000-0000-0000-0000-000000000004', 5, 'Prepara 1 lote de snacks saudáveis na sexta para o fim de semana.',      ARRAY['B'], 'perfil_especifico', 'B', 2),
('20000000-0000-0000-0000-000000000004', 6, 'Agenda 1 vídeo-chamada com amiga no horário do almoço.',                 ARRAY['B'], 'perfil_especifico', 'B', 3),
('20000000-0000-0000-0000-000000000004', 7, 'Envolva crianças no preparo: montam pratos juntas.',                     ARRAY['C'], 'perfil_especifico', 'C', 1),
('20000000-0000-0000-0000-000000000004', 8, 'Cria 1 "regra da casa": só lanche na mesa, nunca na frente da TV.',      ARRAY['C'], 'perfil_especifico', 'C', 2),
('20000000-0000-0000-0000-000000000004', 9, 'Prepara 1 cardápio leve de fim de semana com opções que agradem todos.', ARRAY['C'], 'perfil_especifico', 'C', 3),
('20000000-0000-0000-0000-000000000004',10, 'Ajusta 1 "café da manhã" fixo ao acordar, independente do dia.',         ARRAY['D'], 'perfil_especifico', 'D', 1),
('20000000-0000-0000-0000-000000000004',11, 'Prepara 1 refeição principal antes do turno, deixa pronta para família.',ARRAY['D'], 'perfil_especifico', 'D', 2),
('20000000-0000-0000-0000-000000000004',12, 'Usa slow cooker ou panela elétrica para comida pronta ao acordar.',      ARRAY['D'], 'perfil_especifico', 'D', 3);

-- ============================================================
-- SITUAÇÃO 5 — FOME EMOCIONAL / ANSIEDADE
-- ============================================================

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tempo_minutos, tipo) VALUES
('20000000-0000-0000-0000-000000000005', 1, 'Bebe 1 copo de água grande, espera 10 minutos antes de decidir.',                                  ARRAY['A','B','C','D'],10, 'variacao'),
('20000000-0000-0000-0000-000000000005', 2, 'Escova os dentes e passa fio dental imediatamente.',                                               ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000005', 3, 'Sai para 1 caminhada de 10 minutos ao redor do quarteirão.',                                       ARRAY['A','B','C','D'],10, 'variacao'),
('20000000-0000-0000-0000-000000000005', 4, 'Liga para 1 amiga e conversa por 5 minutos.',                                                      ARRAY['A','B','C','D'], 5, 'variacao'),
('20000000-0000-0000-0000-000000000005', 5, 'Pinta as unhas ou faz 1 skincare rápido.',                                                         ARRAY['A','B','C','D'],10, 'variacao'),
('20000000-0000-0000-0000-000000000005', 6, 'Abre 1 jogo no celular que exija concentração.',                                                   ARRAY['A','B','C','D'], 5, 'variacao'),
('20000000-0000-0000-0000-000000000005', 7, 'Organiza 1 gaveta ou prateleira próxima.',                                                         ARRAY['A','B','C','D'],10, 'variacao'),
('20000000-0000-0000-0000-000000000005', 8, 'Faz 10 respirações fundas, contando até 4 em cada etapa.',                                         ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000005', 9, 'Pega 1 chiclete sem açúcar e mastiga devagar.',                                                    ARRAY['A','B','C','D'], 5, 'variacao'),
('20000000-0000-0000-0000-000000000005',10, 'Escreve 3 linhas no caderno sobre o que está sentindo.',                                           ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000005',11, 'Toma 1 chá de camomila morno, sem açúcar.',                                                        ARRAY['A','B','C','D'], 5, 'variacao'),
('20000000-0000-0000-0000-000000000005',12, 'Deita no sofá e liga 1 meditação guiada de 5 minutos.',                                            ARRAY['A','B','C','D'], 5, 'variacao'),
('20000000-0000-0000-0000-000000000005',13, 'Pega 1 bala de gengibre ou hortelã para chupar.',                                                  ARRAY['A','B','C','D'], 5, 'variacao'),
('20000000-0000-0000-0000-000000000005',14, 'Faz 1 alongamento de pescoço e ombros por 3 minutos.',                                             ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000005',15, 'Olha 5 fotos de viagem ou momento feliz no celular.',                                              ARRAY['A','B','C','D'], 3, 'variacao');

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo) VALUES
('20000000-0000-0000-0000-000000000005', 1, 'Chora 2 minutos se precisar, depois bebe água.',                        ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000005', 2, 'Abraça 1 travesseiro bem apertado por 1 minuto.',                        ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000005', 3, 'Grita no travesseiro 3 vezes, respira fundo.',                           ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000005', 4, 'Desenha rabiscos em 1 papel sem parar por 2 minutos.',                   ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000005', 5, 'Coloca 1 música alta e dança sozinha por 1 música.',                    ARRAY['A','B','C','D'], 'emergencia');

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo, perfil_codigo, acao_ordem) VALUES
('20000000-0000-0000-0000-000000000005', 1, 'Vai até 1 praça próxima do trabalho, senta 10 minutos.',                 ARRAY['A'], 'perfil_especifico', 'A', 1),
('20000000-0000-0000-0000-000000000005', 2, 'Entra em 1 loja de conveniência, compra só 1 água com gás.',             ARRAY['A'], 'perfil_especifico', 'A', 2),
('20000000-0000-0000-0000-000000000005', 3, 'Liga para casa durante o trajeto de ônibus.',                            ARRAY['A'], 'perfil_especifico', 'A', 3),
('20000000-0000-0000-0000-000000000005', 4, 'Sai da cadeira, faz 1 volta pela casa a cada hora.',                     ARRAY['B'], 'perfil_especifico', 'B', 1),
('20000000-0000-0000-0000-000000000005', 5, 'Abre a janela, respira ar fresco 2 minutos.',                            ARRAY['B'], 'perfil_especifico', 'B', 2),
('20000000-0000-0000-0000-000000000005', 6, 'Liga para 1 amiga em vídeo no horário de pico de ansiedade.',            ARRAY['B'], 'perfil_especifico', 'B', 3),
('20000000-0000-0000-0000-000000000005', 7, 'Pede para criança escolher 1 música e dança junto.',                     ARRAY['C'], 'perfil_especifico', 'C', 1),
('20000000-0000-0000-0000-000000000005', 8, 'Sai para o quintal ou calçada com os filhos por 10 minutos.',            ARRAY['C'], 'perfil_especifico', 'C', 2),
('20000000-0000-0000-0000-000000000005', 9, 'Faz 1 "pausa de mãe": tranca no banheiro, respira 5 minutos.',           ARRAY['C'], 'perfil_especifico', 'C', 3),
('20000000-0000-0000-0000-000000000005',10, 'Faz 1 caminhada noturna de 15 minutos antes do turno.',                  ARRAY['D'], 'perfil_especifico', 'D', 1),
('20000000-0000-0000-0000-000000000005',11, 'Escreve 1 mensagem para amiga que responde à noite.',                    ARRAY['D'], 'perfil_especifico', 'D', 2),
('20000000-0000-0000-0000-000000000005',12, 'Prepara 1 playlist de músicas calmas para o horário de pico.',           ARRAY['D'], 'perfil_especifico', 'D', 3);

-- ============================================================
-- SITUAÇÃO 6 — CAFÉ DA MANHÃ CORRIDO
-- ============================================================

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tempo_minutos, tipo) VALUES
('20000000-0000-0000-0000-000000000006', 1, 'Pega 1 banana e 1 caixinha de leite, toma no caminho.',                                            ARRAY['A'],             1, 'variacao'),
('20000000-0000-0000-0000-000000000006', 2, 'Mistura 1 iogurte com granola em pote, come no elevador.',                                         ARRAY['A'],             2, 'variacao'),
('20000000-0000-0000-0000-000000000006', 3, 'Tosta 1 pão de forma, passa requeijão, come andando.',                                             ARRAY['A'],             2, 'variacao'),
('20000000-0000-0000-0000-000000000006', 4, 'Pega 1 fruta + 1 punhado de castanha, guarda no bolso.',                                           ARRAY['A'],             1, 'variacao'),
('20000000-0000-0000-0000-000000000006', 5, 'Prepara 1 shake de banana e leite na garrafa, toma no ônibus.',                                    ARRAY['A'],             2, 'variacao'),
('20000000-0000-0000-0000-000000000006', 6, 'Pega 1 pão de queijo congelado, aquece 1 minuto, sai comendo.',                                    ARRAY['A'],             2, 'variacao'),
('20000000-0000-0000-0000-000000000006', 7, 'Mistura aveia com leite na véspera, pega na geladeira e sai.',                                     ARRAY['A'],             1, 'variacao'),
('20000000-0000-0000-0000-000000000006', 8, 'Pega 1 queijo minas e 1 fatia de presunto, enrola e come.',                                        ARRAY['A'],             1, 'variacao'),
('20000000-0000-0000-0000-000000000006', 9, 'Toma 1 copo de leite com achocolatado e 1 biscoito integral.',                                     ARRAY['A'],             2, 'variacao'),
('20000000-0000-0000-0000-000000000006',10, 'Pega 1 tapioca pronta, recheia com queijo, dobra e sai.',                                          ARRAY['A'],             2, 'variacao'),
('20000000-0000-0000-0000-000000000006',11, 'Prepara 1 sanduíche de queijo na véspera, pega na geladeira.',                                     ARRAY['A'],             1, 'variacao'),
('20000000-0000-0000-0000-000000000006',12, 'Pega 1 caixinha de suco natural e 1 pacote de biscoito de arroz.',                                 ARRAY['A'],             1, 'variacao'),
('20000000-0000-0000-0000-000000000006',13, 'Mistura 1 iogurte com 1 colher de mel, toma no carro.',                                            ARRAY['A'],             2, 'variacao'),
('20000000-0000-0000-0000-000000000006',14, 'Pega 1 ovo cozido de ontem e 1 fatia de pão, come no caminho.',                                    ARRAY['A'],             1, 'variacao'),
('20000000-0000-0000-0000-000000000006',15, 'Tosta 1 panqueca de ontem, passa geleia, enrola e sai.',                                           ARRAY['A'],             2, 'variacao');

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo) VALUES
('20000000-0000-0000-0000-000000000006', 1, 'Pega 1 fruta qualquer e come no primeiro sinal vermelho.',               ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000006', 2, 'Compra 1 pão na padaria mais próxima, come sem recheio.',                ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000006', 3, 'Toma 1 café preto forte e segura até o lanche da manhã.',               ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000006', 4, 'Pega 1 bala de goma para "enganar" a fome temporariamente.',            ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000006', 5, 'Bebe 1 copo grande de água e define alarme para lanche às 10h.',        ARRAY['A','B','C','D'], 'emergencia');

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo, perfil_codigo, acao_ordem) VALUES
('20000000-0000-0000-0000-000000000006', 1, 'Mantém 1 caixa de barrinhas de cereal na gaveta do trabalho.',           ARRAY['A'], 'perfil_especifico', 'A', 1),
('20000000-0000-0000-0000-000000000006', 2, 'Compra 1 café com leite e 1 pão na padaria do caminho.',                 ARRAY['A'], 'perfil_especifico', 'A', 2),
('20000000-0000-0000-0000-000000000006', 3, 'Prepara 1 "kit café da manhã" no domingo: potes prontos.',               ARRAY['A'], 'perfil_especifico', 'A', 3),
('20000000-0000-0000-0000-000000000006', 4, 'Prepara 1 jarra de smoothie na véspera, toma ao acordar.',               ARRAY['B'], 'perfil_especifico', 'B', 1),
('20000000-0000-0000-0000-000000000006', 5, 'Mantém pão, queijo e fruta na bancada: visível ao passar.',              ARRAY['B'], 'perfil_especifico', 'B', 2),
('20000000-0000-0000-0000-000000000006', 6, 'Agenda 15 minutos antes da reunião matinal só para café.',               ARRAY['B'], 'perfil_especifico', 'B', 3),
('20000000-0000-0000-0000-000000000006', 7, 'Prepara 1 lote de panquecas no fim de semana, congela.',                 ARRAY['C'], 'perfil_especifico', 'C', 1),
('20000000-0000-0000-0000-000000000006', 8, 'Acorda 10 minutos antes para montar prato com crianças.',                ARRAY['C'], 'perfil_especifico', 'C', 2),
('20000000-0000-0000-0000-000000000006', 9, 'Pega 1 porção do café dos filhos: leite com biscoito.',                  ARRAY['C'], 'perfil_especifico', 'C', 3),
('20000000-0000-0000-0000-000000000006',10, 'Prepara 1 refeição completa ao acordar (café da "noite").',              ARRAY['D'], 'perfil_especifico', 'D', 1),
('20000000-0000-0000-0000-000000000006',11, 'Mantém ovos e pão sempre prontos para omelete rápida.',                  ARRAY['D'], 'perfil_especifico', 'D', 2),
('20000000-0000-0000-0000-000000000006',12, 'Programa 1 alarme para "café da manhã" no meio do turno.',               ARRAY['D'], 'perfil_especifico', 'D', 3);

-- ============================================================
-- SITUAÇÃO 7 — SUPERMERCADO SEM PLANEJAMENTO
-- ============================================================

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tempo_minutos, tipo) VALUES
('20000000-0000-0000-0000-000000000007', 1, 'Pega 1 cesta pequena, nunca carrinho grande.',                                                     ARRAY['A','B','C','D'], 0, 'variacao'),
('20000000-0000-0000-0000-000000000007', 2, 'Vai direto ao caixa, compra só 1 item: 1 fruta ou 1 água.',                                        ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000007', 3, 'Liga para 1 amiga enquanto anda, não deixa olhar prateleiras.',                                    ARRAY['A','B','C','D'], 5, 'variacao'),
('20000000-0000-0000-0000-000000000007', 4, 'Pega 1 lista no celular, mesmo que mental: 3 itens máximo.',                                       ARRAY['A','B','C','D'], 1, 'variacao'),
('20000000-0000-0000-0000-000000000007', 5, 'Entra pela porta dos fundos, vai direto ao hortifruti.',                                           ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000007', 6, 'Pega 1 sacola de legumes congelados, 1 de frango, sai.',                                           ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000007', 7, 'Compra 1 marmita pronta do açougue, não passa por corredores.',                                    ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000007', 8, 'Pega 1 pão integral, 1 queijo, 1 presunto: monta lanche.',                                         ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000007', 9, 'Vai ao caixa rápido, não passa por gôndolas de doces.',                                            ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000007',10, 'Pega 1 garrafa de água grande, bebe metade antes de comprar.',                                     ARRAY['A','B','C','D'], 1, 'variacao'),
('20000000-0000-0000-0000-000000000007',11, 'Compra 1 sopa pronta, 1 pão, sai sem olhar mais nada.',                                            ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000007',12, 'Pega 1 bandeja de ovos, 1 maço de espinafre, sai.',                                                ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000007',13, 'Vai ao setor de congelados, pega 1 lasanha de berinjela, sai.',                                    ARRAY['A','B','C','D'], 3, 'variacao'),
('20000000-0000-0000-0000-000000000007',14, 'Compra 1 iogurte natural, 1 pacote de aveia: mistura no carro.',                                   ARRAY['A','B','C','D'], 2, 'variacao'),
('20000000-0000-0000-0000-000000000007',15, 'Pega 1 pacote de tapioca pronta, 1 queijo coalho, sai.',                                           ARRAY['A','B','C','D'], 2, 'variacao');

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo) VALUES
('20000000-0000-0000-0000-000000000007', 1, 'Sai do mercado sem comprar nada, vai beber 1 água na fonte.',            ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000007', 2, 'Pede para embalar 1 única maçã no caixa rápido.',                        ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000007', 3, 'Liga para alguém e pede para te buscar, sem entrar.',                    ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000007', 4, 'Vai ao banheiro, respira 5 minutos, reavalia.',                          ARRAY['A','B','C','D'], 'emergencia'),
('20000000-0000-0000-0000-000000000007', 5, 'Compra só 1 item não perecível: arroz, feijão, água.',                   ARRAY['A','B','C','D'], 'emergencia');

INSERT INTO situation_actions (situation_id, numero, texto_acao, perfil, tipo, perfil_codigo, acao_ordem) VALUES
('20000000-0000-0000-0000-000000000007', 1, 'Vai ao mercado só no sábado de manhã, com lista pronta.',                ARRAY['A'], 'perfil_especifico', 'A', 1),
('20000000-0000-0000-0000-000000000007', 2, 'Mantém 1 app de delivery com "último pedido" salvo para repetir.',       ARRAY['A'], 'perfil_especifico', 'A', 2),
('20000000-0000-0000-0000-000000000007', 3, 'Pede para entregar em 1 hora, sai do mercado físico.',                   ARRAY['A'], 'perfil_especifico', 'A', 3),
('20000000-0000-0000-0000-000000000007', 4, 'Faz compras online com retirada: não entra no mercado.',                 ARRAY['B'], 'perfil_especifico', 'B', 1),
('20000000-0000-0000-0000-000000000007', 5, 'Mantém 1 despensa organizada: sabe exatamente o que falta.',             ARRAY['B'], 'perfil_especifico', 'B', 2),
('20000000-0000-0000-0000-000000000007', 6, 'Prepara 1 lista padrão no celular, segue à risca.',                      ARRAY['B'], 'perfil_especifico', 'B', 3),
('20000000-0000-0000-0000-000000000007', 7, 'Vai ao mercado sozinha, sem crianças, para focar.',                      ARRAY['C'], 'perfil_especifico', 'C', 1),
('20000000-0000-0000-0000-000000000007', 8, 'Prepara 1 cardápio semanal fixo, compra sempre os mesmos itens.',        ARRAY['C'], 'perfil_especifico', 'C', 2),
('20000000-0000-0000-0000-000000000007', 9, 'Divide lista com cônjuge: um vai ao mercado, outro cuida das crianças.', ARRAY['C'], 'perfil_especifico', 'C', 3),
('20000000-0000-0000-0000-000000000007',10, 'Vai ao mercado no horário de menor movimento (madrugada).',              ARRAY['D'], 'perfil_especifico', 'D', 1),
('20000000-0000-0000-0000-000000000007',11, 'Mantém 1 estoque de itens não perecíveis para 2 semanas.',               ARRAY['D'], 'perfil_especifico', 'D', 2),
('20000000-0000-0000-0000-000000000007',12, 'Pede para família fazer compras, evita ir pessoalmente.',                ARRAY['D'], 'perfil_especifico', 'D', 3);
