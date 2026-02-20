-- 007_seed_recipes.sql
-- Seed: 80 receitas completas — Modo Automático 80/20
-- Substitui as 7 receitas de amostra do seed.sql original
-- Executar APÓS 005_migration_novas_tabelas.sql

-- Limpar receitas de amostra do seed anterior
TRUNCATE TABLE recipes RESTART IDENTITY CASCADE;

-- ============================================================
-- CATEGORIA 1 — CAFÉ DA MANHÃ RÁPIDO (20 receitas)
-- ============================================================

-- 1.1 Sem Fogão — Só Monta (7)
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
('Iogurte Turbinado',             ARRAY['iogurte natural','aveia','banana','mel'],                           'manha', 2,  10.0, ARRAY['A','B','C','D'], true),
('Pão com Requeijão e Tomate',   ARRAY['pão de forma','requeijão','tomate'],                                'manha', 3,   6.0, ARRAY['A','B'],         true),
('Banana com Amendoim',          ARRAY['banana','pasta de amendoim'],                                        'manha', 2,   7.0, ARRAY['A','B','C','D'], true),
('Sanduíche de Queijo Frio',     ARRAY['pão de forma','queijo muçarela','manteiga'],                        'manha', 2,   9.0, ARRAY['A','B','C'],     true),
('Aveia com Leite e Maçã',       ARRAY['aveia','leite integral','maçã'],                                    'manha', 3,   8.0, ARRAY['A','B','C','D'], true),
('Tapioca Pronta com Requeijão', ARRAY['tapioca pronta (pacote)','requeijão'],                              'manha', 1,   5.0, ARRAY['A','B','C','D'], true),
('Frutas com Castanha',          ARRAY['banana','maçã','castanha-do-pará'],                                 'manha', 3,   3.0, ARRAY['A','B'],         true);

-- 1.2 Com Micro-ondas — Máx 3 min (7)
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
('Ovo de Caneca',                ARRAY['ovo','leite','manteiga'],                                            'manha', 2,  13.0, ARRAY['A','B','C','D'], true),
('Bolo de Caneca de Banana',     ARRAY['banana amassada','aveia','ovo','leite'],                             'manha', 3,   9.0, ARRAY['A','B'],         true),
('Mingau de Aveia Expresso',     ARRAY['aveia','leite','mel'],                                              'manha', 3,   8.0, ARRAY['A','B','C','D'], true),
('Pão de Queijo de Caneca',      ARRAY['polvilho','queijo muçarela ralado','ovo','leite'],                  'manha', 3,   9.0, ARRAY['A','B','C'],     true),
('Omelete de Caneca',            ARRAY['ovo','presunto picado','queijo','leite'],                            'manha', 3,  16.0, ARRAY['A','B','C','D'], true),
('Batata Doce no Micro-ondas',   ARRAY['batata doce pequena'],                                              'manha', 3,   2.0, ARRAY['A','B','C','D'], true),
('Tapioca de Micro-ondas',       ARRAY['goma de tapioca','água','sal'],                                     'manha', 3,   2.0, ARRAY['A','B','C','D'], true);

-- 1.3 Com Fogão — Máx 10 min (6)
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
('Ovo Mexido Turbinado',         ARRAY['ovo','requeijão','presunto picado'],                                 'manha', 5,  16.0, ARRAY['A','B','C','D'], true),
('Panqueca de Banana',           ARRAY['banana amassada','ovo','aveia'],                                     'manha', 8,  10.0, ARRAY['A','B'],         true),
('Tapioca na Frigideira',        ARRAY['goma de tapioca','manteiga','queijo'],                               'manha', 5,   9.0, ARRAY['A','B','C','D'], true),
('Ovo Frito com Pão',            ARRAY['ovo','manteiga','pão de forma'],                                    'manha', 5,  13.0, ARRAY['A','B','C','D'], true),
('Crepioca Rápida',              ARRAY['goma de tapioca','ovo','queijo'],                                    'manha', 7,  16.0, ARRAY['A','B','C'],     true),
('Pão na Chapa com Ovo',         ARRAY['pão francês (de ontem)','manteiga','ovo'],                           'manha', 6,  14.0, ARRAY['A','B','C','D'], true);

-- ============================================================
-- CATEGORIA 2 — ALMOÇO/JANTAR RÁPIDO (25 receitas)
-- ============================================================

-- 2.1 Sem Cozinhar — Monta, Aquece ou Come Frio (8)
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
('Salada de Atum com Arroz',     ARRAY['atum em lata','arroz pronto','tomate','cebola'],                    'tarde', 5,  22.0, ARRAY['A','B'],         true),
('Sanduíche de Sardinha',        ARRAY['pão de forma','sardinha em lata','tomate'],                         'tarde', 3,  18.0, ARRAY['A','B','C','D'], true),
('Arroz com Feijão e Ovo Cozido',ARRAY['arroz pronto','feijão pronto','ovo cozido'],                        'tarde', 4,  19.0, ARRAY['A','B','C','D'], true),
('Salada de Frango Desfiado',    ARRAY['frango desfiado','alface','tomate','cenoura ralada'],               'tarde', 5,  28.0, ARRAY['A','B'],         true),
('Wrap de Presunto e Queijo',    ARRAY['pão de forma grande','presunto','queijo','tomate'],                 'tarde', 3,  14.0, ARRAY['A','B','C'],     true),
('Cuscuz com Sardinha',          ARRAY['cuscuz pronto (pacote)','sardinha em lata','manteiga'],             'tarde', 4,  17.0, ARRAY['A','B','C','D'], true),
('Arroz com Linguiça Fria',      ARRAY['arroz pronto','linguiça calabresa cozida'],                         'tarde', 3,  16.0, ARRAY['A','B','C','D'], true),
('Salada de Macarrão com Atum',  ARRAY['macarrão cozido','atum em lata','tomate','azeite'],                 'tarde', 5,  18.0, ARRAY['A','B'],         true);

-- 2.2 Com Fogão — Até 10 min (10)
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
('Macarrão com Manteiga e Queijo',ARRAY['macarrão','manteiga','queijo muçarela ralado'],                   'tarde', 10,  9.0, ARRAY['A','B','C','D'], true),
('Arroz de Forno Rápido',        ARRAY['arroz pronto','queijo','presunto','ovo'],                           'tarde',  8, 18.0, ARRAY['A','B','C'],     true),
('Frango Grelhado Rápido',       ARRAY['filé de frango','alho','sal','manteiga'],                           'tarde', 10, 32.0, ARRAY['A','B','C','D'], true),
('Omelete de Queijo e Presunto', ARRAY['ovo','queijo','presunto','manteiga'],                               'tarde',  6, 16.0, ARRAY['A','B','C','D'], true),
('Carne Moída Refogada',         ARRAY['carne moída','cebola','alho','óleo'],                               'tarde', 10, 24.0, ARRAY['A','B','C','D'], true),
('Batata Frita na Frigideira',   ARRAY['batata','óleo','sal'],                                              'tarde', 10,  3.0, ARRAY['A','B'],         true),
('Linguiça Acebolada',           ARRAY['linguiça calabresa','cebola','óleo'],                               'tarde',  8, 14.0, ARRAY['A','B','C','D'], true),
('Peixe Frito Rápido',           ARRAY['filé de peixe','limão','sal','farinha de mandioca'],               'tarde',  8, 22.0, ARRAY['A','B','C'],     true),
('Couve Refogada com Alho',      ARRAY['couve','alho','óleo','sal'],                                        'tarde',  5,  3.0, ARRAY['A','B','C','D'], true),
('Arroz com Ovo e Cebolinha',    ARRAY['arroz pronto','ovo','cebolinha','óleo'],                            'tarde',  7, 14.0, ARRAY['A','B','C','D'], true);

-- 2.3 Com Micro-ondas — Até 5 min (7)
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
('Arroz de Micro-ondas',         ARRAY['arroz cru','água','sal'],                                           'tarde',  3,  3.0, ARRAY['A','B','C','D'], true),
('Batata Assada no Micro-ondas', ARRAY['batata','manteiga','sal'],                                          'tarde',  6,  3.0, ARRAY['A','B','C','D'], true),
('Brócolis no Micro-ondas',      ARRAY['brócolis','água','sal'],                                            'tarde',  5,  4.0, ARRAY['A','B','C','D'], true),
('Ovo Pochê no Micro-ondas',     ARRAY['ovo','água','vinagre (opcional)'],                                  'tarde',  2, 13.0, ARRAY['A','B'],         true),
('Cenoura Cozida no Micro-ondas',ARRAY['cenoura','água','manteiga'],                                        'tarde',  5,  1.5, ARRAY['A','B','C','D'], true),
('Sopa de Legumes Instantânea',  ARRAY['legumes congelados','água','caldo de galinha (tablete)'],           'tarde',  6,  3.0, ARRAY['A','B','C'],     true),
('Peixe no Micro-ondas',         ARRAY['filé de peixe','limão','sal','manteiga'],                           'tarde',  5, 22.0, ARRAY['A','B'],         true);

-- ============================================================
-- CATEGORIA 3 — LANCHE ANTI-FOME NOTURNA (20 receitas)
-- ============================================================

-- 3.1 Doces Naturais (7)
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
('Banana com Mel',               ARRAY['banana','mel'],                                                     'noite',  1,  1.5, ARRAY['A','B','C','D'], true),
('Iogurte com Mel e Canela',     ARRAY['iogurte natural','mel','canela em pó'],                             'noite',  2,  9.0, ARRAY['A','B'],         true),
('Maçã Assada no Micro-ondas',   ARRAY['maçã','mel','canela'],                                              'noite',  4,  0.5, ARRAY['A','B'],         true),
('Abacaxi com Iogurte',          ARRAY['abacaxi em calda (escorrido)','iogurte natural'],                   'noite',  2,  5.0, ARRAY['A','B','C'],     true),
('Pera com Mel',                 ARRAY['pera','mel'],                                                       'noite',  2,  0.5, ARRAY['A','B','C','D'], true),
('Smoothie de Banana',           ARRAY['banana','leite','mel (opcional)'],                                  'noite',  3,  7.0, ARRAY['A','B'],         true),
('Laranja com Mel',              ARRAY['laranja','mel'],                                                     'noite',  2,  1.5, ARRAY['A','B','C','D'], true);

-- 3.2 Salgados Leves (7)
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
('Ovo Cozido com Sal',           ARRAY['ovo','sal'],                                                        'noite',  1, 13.0, ARRAY['A','B','C','D'], true),
('Queijo com Pão Tostado',       ARRAY['queijo muçarela','pão de forma','manteiga'],                        'noite',  5,  9.0, ARRAY['A','B','C'],     true),
('Requeijão com Pão',            ARRAY['requeijão','pão de forma'],                                         'noite',  1,  4.0, ARRAY['A','B','C','D'], true),
('Ovo Frito Pequeno',            ARRAY['ovo','manteiga','sal'],                                             'noite',  4, 13.0, ARRAY['A','B','C','D'], true),
('Tapioca com Queijo',           ARRAY['goma de tapioca','queijo muçarela'],                                'noite',  5,  9.0, ARRAY['A','B','C','D'], true),
('Pão com Manteiga e Alho (Torrada)',ARRAY['pão','manteiga','alho amassado'],                              'noite',  5,  4.0, ARRAY['A','B'],         true),
('Queijo Quente na Frigideira',  ARRAY['queijo muçarela em fatias'],                                        'noite',  3,  9.0, ARRAY['A','B','C','D'], true);

-- 3.3 Neutros (6)
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
('Água com Limão',               ARRAY['água','limão'],                                                     'noite',  1,  0.0, ARRAY['A','B','C','D'], true),
('Chá de Camomila com Torrada',  ARRAY['chá de camomila (sachê)','torrada (pronta)'],                      'noite',  3,  2.0, ARRAY['A','B'],         true),
('Caldo de Legumes (Pronto)',    ARRAY['caldo de legumes (caixinha ou tablete)','água'],                    'noite',  3,  1.5, ARRAY['A','B','C','D'], true),
('Pepino com Sal',               ARRAY['pepino','sal'],                                                     'noite',  2,  0.5, ARRAY['A','B','C'],     true),
('Cenoura Crua Ralada',          ARRAY['cenoura','limão','sal'],                                            'noite',  4,  1.0, ARRAY['A','B','C','D'], true),
('Água de Coco Natural',         ARRAY['água de coco (pronta, caixinha ou coco verde)'],                   'noite',  1,  0.0, ARRAY['A','B','C','D'], true);

-- ============================================================
-- CATEGORIA 4 — OPÇÕES DE EMERGÊNCIA (15 receitas)
-- ============================================================

-- 4.1 Com Só 1 Ingrediente (5)
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
('Leite Quente com Película',    ARRAY['leite integral'],                                                   'manha',  5,  8.0, ARRAY['A','B','C','D'], true),
('Banana Inteira',               ARRAY['banana'],                                                           'manha',  1,  1.5, ARRAY['A','B','C','D'], true),
('Ovo Cozido (Pronto)',          ARRAY['ovo cozido (comprado ou deixado pronto)'],                          'manha',  1, 13.0, ARRAY['A','B','C','D'], true),
('Queijo em Fatia',              ARRAY['queijo muçarela em fatia'],                                         'manha',  0,  9.0, ARRAY['A','B','C','D'], true),
('Pão Seco',                     ARRAY['pão de forma ou francês'],                                          'manha',  0,  3.0, ARRAY['A','B','C','D'], true);

-- 4.2 Em Menos de 2 Minutos (5)
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
('Requeijão no Pão',             ARRAY['pão','requeijão'],                                                  'manha',  1,  4.0, ARRAY['A','B','C','D'], true),
('Atum na Lata (Escorrido)',     ARRAY['atum em lata'],                                                     'manha',  1, 22.0, ARRAY['A','B','C','D'], true),
('Iogurte Natural',              ARRAY['iogurte natural (copinho)'],                                        'manha',  0,  9.0, ARRAY['A','B','C','D'], true),
('Aveia com Água',               ARRAY['aveia','água'],                                                     'manha',  2,  5.0, ARRAY['A','B','C','D'], true),
('Sardinha no Pão',              ARRAY['pão','sardinha em lata'],                                           'manha',  2, 17.0, ARRAY['A','B','C','D'], true);

-- 4.3 Zero Habilidade (5)
INSERT INTO recipes (nome, ingredientes, momento_do_dia, tempo_preparo, proteina_g, perfil, ativo) VALUES
('Manteiga no Pão',              ARRAY['pão','manteiga'],                                                   'manha',  1,  3.0, ARRAY['A','B','C','D'], true),
('Arroz com Manteiga',           ARRAY['arroz pronto (de ontem ou pacote)','manteiga'],                     'manha',  3,  3.0, ARRAY['A','B','C','D'], true),
('Macarrão com Manteiga',        ARRAY['macarrão cozido (de ontem)','manteiga'],                            'manha',  3,  5.0, ARRAY['A','B','C','D'], true),
('Ovo Mexido no Micro-ondas',    ARRAY['ovo','leite (opcional)'],                                           'manha',  2, 13.0, ARRAY['A','B','C','D'], true),
('Queijo Derretido no Micro-ondas',ARRAY['queijo muçarela ralado ou fatiado'],                              'manha',  2,  9.0, ARRAY['A','B','C','D'], true);
