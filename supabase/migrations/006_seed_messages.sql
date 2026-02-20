-- 006_seed_messages.sql
-- Seed: 173 mensagens da Ana — Modo Automático 80/20
-- Executar APÓS 005_migration_novas_tabelas.sql

-- ============================================================
-- TIPO 1 — ATIVAÇÃO DIÁRIA (35 mensagens)
-- ============================================================

-- Situação 1: Ambiente de Trabalho/Escola (5)
INSERT INTO messages (codigo, tipo, subtipo, situacao, texto, perfil, gatilho) VALUES
('ATIVA-001','ativacao_diaria','trabalho','trabalho',     'Café na correria? Pega uma fruta antes de sair. Feito? Manda FIZ.',                   ARRAY['A','B','C','D'],'automatico'),
('ATIVA-002','ativacao_diaria','trabalho','trabalho',     'Reunião que estica? Bebe um copo d''água antes do almoço. Feito? Manda FIZ.',          ARRAY['A','B','C','D'],'automatico'),
('ATIVA-003','ativacao_diaria','trabalho','trabalho',     'Pausa do café? Troca o biscoito por castanha de caju. Feito? Manda FIZ.',               ARRAY['A','B','C','D'],'automatico'),
('ATIVA-004','ativacao_diaria','trabalho','trabalho',     'Escritório o dia todo? Levanta a cada hora por 2 minutos. Feito? Manda FIZ.',           ARRAY['A','B','C','D'],'automatico'),
('ATIVA-005','ativacao_diaria','trabalho','trabalho',     'Almoço rápido? Começa com o prato de salada. Feito? Manda FIZ.',                       ARRAY['A','B','C','D'],'automatico');

-- Situação 2: Convívio Familiar (5)
INSERT INTO messages (codigo, tipo, subtipo, situacao, texto, perfil, gatilho) VALUES
('ATIVA-006','ativacao_diaria','familia','familia',       'Jantar em família? Serve vegetais primeiro no prato. Feito? Manda FIZ.',                ARRAY['A','B','C','D'],'automatico'),
('ATIVA-007','ativacao_diaria','familia','familia',       'Casa o dia todo? Prepara um pote de água com gengibre. Feito? Manda FIZ.',               ARRAY['A','B','C','D'],'automatico'),
('ATIVA-008','ativacao_diaria','familia','familia',       'Família reunida? Pega um prato menor para sobremesa. Feito? Manda FIZ.',                 ARRAY['A','B','C','D'],'automatico'),
('ATIVA-009','ativacao_diaria','familia','familia',       'Mesa com muitas opções? Escolhe 3 coisas que realmente quer. Feito? Manda FIZ.',         ARRAY['A','B','C','D'],'automatico'),
('ATIVA-010','ativacao_diaria','familia','familia',       'Domingo de preguiça? Faz uma refeição com atenção plena. Feito? Manda FIZ.',             ARRAY['A','B','C','D'],'automatico');

-- Situação 3: Eventos Sociais (5)
INSERT INTO messages (codigo, tipo, subtipo, situacao, texto, perfil, gatilho) VALUES
('ATIVA-011','ativacao_diaria','social','social',         'Festa hoje? Come algo leve antes de sair de casa. Feito? Manda FIZ.',                   ARRAY['A','B','C','D'],'automatico'),
('ATIVA-012','ativacao_diaria','social','social',         'Bar com amigos? Intercala cada drink com um copo d''água. Feito? Manda FIZ.',            ARRAY['A','B','C','D'],'automatico'),
('ATIVA-013','ativacao_diaria','social','social',         'Noite com as amigas? Come devagar e conversa entre garfadas. Feito? Manda FIZ.',         ARRAY['A','B','C','D'],'automatico'),
('ATIVA-014','ativacao_diaria','social','social',         'Happy hour? Escolhe um petisco proteico da mesa. Feito? Manda FIZ.',                     ARRAY['A','B','C','D'],'automatico'),
('ATIVA-015','ativacao_diaria','social','social',         'Sexta de descompressão? Dá uma caminhada antes de sair. Feito? Manda FIZ.',              ARRAY['A','B','C','D'],'automatico');

-- Situação 4: Momento Solo em Casa (5)
INSERT INTO messages (codigo, tipo, subtipo, situacao, texto, perfil, gatilho) VALUES
('ATIVA-016','ativacao_diaria','solo','solo',             'Noite de sofá? Prepara um chá antes de abrir a geladeira. Feito? Manda FIZ.',            ARRAY['A','B','C','D'],'automatico'),
('ATIVA-017','ativacao_diaria','solo','solo',             'Maratona de série? Separa uma porção de pipoca num pote. Feito? Manda FIZ.',              ARRAY['A','B','C','D'],'automatico'),
('ATIVA-018','ativacao_diaria','solo','solo',             'Noite sem planos? Janta na mesa, sem tela. Feito? Manda FIZ.',                           ARRAY['A','B','C','D'],'automatico'),
('ATIVA-019','ativacao_diaria','solo','solo',             'Sozinha em casa? Pergunta se é fome ou tédio antes de comer. Feito? Manda FIZ.',          ARRAY['A','B','C','D'],'automatico'),
('ATIVA-020','ativacao_diaria','solo','solo',             'Fome fora de hora? Espera 10 minutos bebendo água. Feito? Manda FIZ.',                   ARRAY['A','B','C','D'],'automatico');

-- Situação 5: Estados Emocionais (5)
INSERT INTO messages (codigo, tipo, subtipo, situacao, texto, perfil, gatilho) VALUES
('ATIVA-021','ativacao_diaria','emocional','emocional',   'Dia difícil? Faz 5 respirações antes do almoço. Feito? Manda FIZ.',                     ARRAY['A','B','C','D'],'automatico'),
('ATIVA-022','ativacao_diaria','emocional','emocional',   'Cansada demais? Pede algo com vegetais, não só carboidrato. Feito? Manda FIZ.',          ARRAY['A','B','C','D'],'automatico'),
('ATIVA-023','ativacao_diaria','emocional','emocional',   'Stress acumulado? Sai para uma volta no quarteirão. Feito? Manda FIZ.',                  ARRAY['A','B','C','D'],'automatico'),
('ATIVA-024','ativacao_diaria','emocional','emocional',   'Ansiedade à tona? Come sentada, sem fazer outra coisa. Feito? Manda FIZ.',               ARRAY['A','B','C','D'],'automatico'),
('ATIVA-025','ativacao_diaria','emocional','emocional',   'Cabeça cheia? Prepara uma refeição simples, sem exigência. Feito? Manda FIZ.',           ARRAY['A','B','C','D'],'automatico');

-- Situação 6: Ocasiões Especiais (5)
INSERT INTO messages (codigo, tipo, subtipo, situacao, texto, perfil, gatilho) VALUES
('ATIVA-026','ativacao_diaria','especial','especial',     'Seu aniversário? Come o que quiser, com atenção plena. Feito? Manda FIZ.',               ARRAY['A','B','C','D'],'automatico'),
('ATIVA-027','ativacao_diaria','especial','especial',     'Feriado prolongado? Mantém uma refeição estruturada por dia. Feito? Manda FIZ.',         ARRAY['A','B','C','D'],'automatico'),
('ATIVA-028','ativacao_diaria','especial','especial',     'Carnaval? Hidrata entre uma festa e outra. Feito? Manda FIZ.',                           ARRAY['A','B','C','D'],'automatico'),
('ATIVA-029','ativacao_diaria','especial','especial',     'Natal ou Ano Novo? Escolhe o que vale a pena, ignora o resto. Feito? Manda FIZ.',        ARRAY['A','B','C','D'],'automatico'),
('ATIVA-030','ativacao_diaria','especial','especial',     'Comemoração especial? Saboreia cada garfada, sem culpa. Feito? Manda FIZ.',              ARRAY['A','B','C','D'],'automatico');

-- Situação 7: Decisões de Saúde Ativas (5)
INSERT INTO messages (codigo, tipo, subtipo, situacao, texto, perfil, gatilho) VALUES
('ATIVA-031','ativacao_diaria','saude','saude',           'Ida ao mercado? Não vai com fome. Feito? Manda FIZ.',                                    ARRAY['A','B','C','D'],'automatico'),
('ATIVA-032','ativacao_diaria','saude','saude',           'Momento na cozinha? Prepara um vegetal de formas diferentes. Feito? Manda FIZ.',         ARRAY['A','B','C','D'],'automatico'),
('ATIVA-033','ativacao_diaria','saude','saude',           'Preparo de marmita? Inclui uma fonte de proteína. Feito? Manda FIZ.',                    ARRAY['A','B','C','D'],'automatico'),
('ATIVA-034','ativacao_diaria','saude','saude',           'Lembrete de água? Bebe um copo agora, antes de qualquer coisa. Feito? Manda FIZ.',       ARRAY['A','B','C','D'],'automatico'),
('ATIVA-035','ativacao_diaria','saude','saude',           'Oportunidade de caminhada? Vai até o lugar a pé, se der. Feito? Manda FIZ.',             ARRAY['A','B','C','D'],'automatico');

-- ============================================================
-- TIPO 2 — RESPOSTA "FIZ" (30 mensagens)
-- ============================================================

-- Categoria A: Neutras (10)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, keywords) VALUES
('FIZ-001','resposta_fiz','neutra',    'Anotado. Até amanhã.',                             ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-002','resposta_fiz','neutra',    'Visto. Seguimos.',                                 ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-003','resposta_fiz','neutra',    'Ok. Próxima decisão vem amanhã.',                  ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-004','resposta_fiz','neutra',    'Registrado.',                                      ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-005','resposta_fiz','neutra',    'Entendido.',                                       ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-006','resposta_fiz','neutra',    'Certo.',                                           ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-007','resposta_fiz','neutra',    'Feito.',                                           ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-008','resposta_fiz','neutra',    'Check.',                                           ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-009','resposta_fiz','neutra',    'Salvo.',                                           ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-010','resposta_fiz','neutra',    'Anotei.',                                          ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']);

-- Categoria B: Reforço de Identidade (10)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, keywords) VALUES
('FIZ-011','resposta_fiz','identidade','Você é do tipo que faz. Isso é raro.',             ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-012','resposta_fiz','identidade','Sua consistência está construindo algo.',          ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-013','resposta_fiz','identidade','Quem faz uma vez, faz de novo.',                  ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-014','resposta_fiz','identidade','Mulher que decide, mulher que executa.',           ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-015','resposta_fiz','identidade','Tipo de pessoa que não depende de motivação.',    ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-016','resposta_fiz','identidade','Característica sua: transforma decisão em ação.', ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-017','resposta_fiz','identidade','Jeito seu de ser: prática, direta.',              ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-018','resposta_fiz','identidade','Padrão seu: escolhe e faz.',                      ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-019','resposta_fiz','identidade','Modo automático ativado em você.',                ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-020','resposta_fiz','identidade','Essência: quem faz sem drama.',                   ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']);

-- Categoria C: Micro-Dica (10)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, keywords) VALUES
('FIZ-021','resposta_fiz','microdica', 'Amanhã: se for dia corrido, prepara algo na véspera.',         ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-022','resposta_fiz','microdica', 'Próximo desafio: mantém o copo d''água na mesa o dia todo.',   ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-023','resposta_fiz','microdica', 'Depois: quando sentir vontade de beliscar, respira primeiro.', ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-024','resposta_fiz','microdica', 'Seguinte: anota o que te ajudou hoje.',                        ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-025','resposta_fiz','microdica', 'Futuro próximo: experimenta um vegetal novo essa semana.',     ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-026','resposta_fiz','microdica', 'Prepara: deixa a fruta na bolsa para amanhã.',                 ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-027','resposta_fiz','microdica', 'Adianta: escolhe o que vai almoçar antes da fome bater.',     ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-028','resposta_fiz','microdica', 'Pensa: qual decisão de hoje você pode repetir amanhã?',        ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-029','resposta_fiz','microdica', 'Olha: seu corpo responde à consistência, não à perfeição.',    ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']),
('FIZ-030','resposta_fiz','microdica', 'Dica: a próxima escolha é sempre nova.',                       ARRAY['A','B','C','D'],'keyword',ARRAY['FIZ']);

-- ============================================================
-- TIPO 3 — RESPOSTA "NÃO CONSEGUI" (30 mensagens)
-- ============================================================

-- Categoria A: Acolhimento sem Drama (10)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, keywords) VALUES
('NAO-001','resposta_nao_consegui','acolhimento', 'Acontece. Amanhã tem outra decisão.',                       ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-002','resposta_nao_consegui','acolhimento', 'Anotado. Nenhuma decisão é definitiva.',                    ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-003','resposta_nao_consegui','acolhimento', 'Entendido. O sistema é para os dias bons e ruins.',         ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-004','resposta_nao_consegui','acolhimento', 'Visto. Você está aqui, isso já conta.',                     ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-005','resposta_nao_consegui','acolhimento', 'Registrado. Uma decisão não define nada.',                  ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-006','resposta_nao_consegui','acolhimento', 'Ok. Amanhã a gente tenta de novo, se quiser.',              ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-007','resposta_nao_consegui','acolhimento', 'Feito. Dizer que não conseguiu também é participar.',       ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-008','resposta_nao_consegui','acolhimento', 'Check. Estamos juntas nos dois cenários.',                  ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-009','resposta_nao_consegui','acolhimento', 'Salvo. Não precisa explicar.',                              ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-010','resposta_nao_consegui','acolhimento', 'Anotei. Seguimos.',                                         ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']);

-- Categoria B: Alternativa Imediata (10)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, keywords) VALUES
('NAO-011','resposta_nao_consegui','alternativa', 'Então faz isso: bebe um copo d''água agora.',               ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-012','resposta_nao_consegui','alternativa', 'Reduz: em vez de tudo, só respira 3 vezes.',               ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-013','resposta_nao_consegui','alternativa', 'Troca: não precisa fazer, só notar o que sente.',          ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-014','resposta_nao_consegui','alternativa', 'Simplifica: próxima refeição, come mais devagar.',         ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-015','resposta_nao_consegui','alternativa', 'Diminui: metade do que foi proposto já vale.',             ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-016','resposta_nao_consegui','alternativa', 'Adia: faz quando der, não precisa ser agora.',             ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-017','resposta_nao_consegui','alternativa', 'Fragmenta: divide em duas partes, faz uma.',               ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-018','resposta_nao_consegui','alternativa', 'Substitui: troca a ação por uma pergunta para si mesma.',  ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-019','resposta_nao_consegui','alternativa', 'Minimiza: só observa, sem julgar.',                        ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-020','resposta_nao_consegui','alternativa', 'Adapta: faz do seu jeito, não do jeito certo.',            ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']);

-- Categoria C: Ressignificação (10)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, keywords) VALUES
('NAO-021','resposta_nao_consegui','ressignificacao','Não conseguir é dado: o que te impediu hoje?',           ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-022','resposta_nao_consegui','ressignificacao','Informação valiosa: essa decisão não cabia no seu dia.', ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-023','resposta_nao_consegui','ressignificacao','Dado anotado: você aprendeu algo sobre sua rotina.',     ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-024','resposta_nao_consegui','ressignificacao','Útil saber: em que momento a coisa desandou?',          ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-025','resposta_nao_consegui','ressignificacao','Registro importante: o que estava acontecendo ao redor?',ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-026','resposta_nao_consegui','ressignificacao','Observação: a dificuldade aparece em qual contexto?',   ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-027','resposta_nao_consegui','ressignificacao','Aprendizado: não conseguir mapeia seu terreno.',         ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-028','resposta_nao_consegui','ressignificacao','Insight: padrões se revelam nos dois lados.',            ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-029','resposta_nao_consegui','ressignificacao','Dado novo: seu limite de hoje é informação para amanhã.',ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']),
('NAO-030','resposta_nao_consegui','ressignificacao','Conhecimento: cada não-consecução ensina algo.',         ARRAY['A','B','C','D'],'keyword',ARRAY['NÃO CONSEGUI','NAO CONSEGUI']);

-- ============================================================
-- TIPO 4 — REENGAJAMENTO POR INATIVIDADE (21 mensagens)
-- ============================================================

-- Dia 1 sem resposta (7)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, dia_inativo) VALUES
('REAT-001','reengajamento','dia1','Ontem não rolou. Hoje tem decisão nova.',                   ARRAY['A','B','C','D'],'automatico',1),
('REAT-002','reengajamento','dia1','Passei aqui. Quando quiser, estou por perto.',             ARRAY['A','B','C','D'],'automatico',1),
('REAT-003','reengajamento','dia1','Sua decisão de ontem ficou no ar. Sem problema.',          ARRAY['A','B','C','D'],'automatico',1),
('REAT-004','reengajamento','dia1','Dia corrido? Acontece. Amanhã tem mais.',                  ARRAY['A','B','C','D'],'automatico',1),
('REAT-005','reengajamento','dia1','Anotado: um dia sem resposta. Sistema continua.',          ARRAY['A','B','C','D'],'automatico',1),
('REAT-006','reengajamento','dia1','Às vezes a gente esquece. Amanhã é outro dia.',            ARRAY['A','B','C','D'],'automatico',1),
('REAT-007','reengajamento','dia1','Sem pressão. Quando der, você responde.',                  ARRAY['A','B','C','D'],'automatico',1);

-- Dia 2 sem resposta (7)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, dia_inativo) VALUES
('REAT-008','reengajamento','dia2','Dois dias sem notícias. Tudo certo por aí?',               ARRAY['A','B','C','D'],'automatico',2),
('REAT-009','reengajamento','dia2','Sumida. Espero que seja coisa boa.',                       ARRAY['A','B','C','D'],'automatico',2),
('REAT-010','reengajamento','dia2','Sua rotina mudou? Posso ajustar o horário.',               ARRAY['A','B','C','D'],'automatico',2),
('REAT-011','reengajamento','dia2','Estou aqui, mas entendo se a vida pediu atenção.',         ARRAY['A','B','C','D'],'automatico',2),
('REAT-012','reengajamento','dia2','Dois dias. Curiosa para saber como você está.',            ARRAY['A','B','C','D'],'automatico',2),
('REAT-013','reengajamento','dia2','O sistema não desiste, mas respeita seu tempo.',           ARRAY['A','B','C','D'],'automatico',2),
('REAT-014','reengajamento','dia2','Quando voltar, começamos de onde parou.',                  ARRAY['A','B','C','D'],'automatico',2);

-- Dia 3 sem resposta (7)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, dia_inativo) VALUES
('REAT-015','reengajamento','dia3','Três dias. Talvez esse não seja o momento ideal.',        ARRAY['A','B','C','D'],'automatico',3),
('REAT-016','reengajamento','dia3','Vou dar um tempo. Quando quiser voltar, é só mandar "OI".',ARRAY['A','B','C','D'],'automatico',3),
('REAT-017','reengajamento','dia3','Sem cobrança. Seu ritmo é o certo, não o meu.',           ARRAY['A','B','C','D'],'automatico',3),
('REAT-018','reengajamento','dia3','Pausa aqui. A porta fica aberta quando você quiser.',     ARRAY['A','B','C','D'],'automatico',3),
('REAT-019','reengajamento','dia3','Talvez precise de outra coisa agora. Tudo bem.',          ARRAY['A','B','C','D'],'automatico',3),
('REAT-020','reengajamento','dia3','Última mensagem por enquanto. Te espero quando for hora.',ARRAY['A','B','C','D'],'automatico',3),
('REAT-021','reengajamento','dia3','Foi bom enquanto durou. Volta quando quiser.',            ARRAY['A','B','C','D'],'automatico',3);

-- ============================================================
-- TIPO 5 — MARCOS DE STREAK (20 mensagens)
-- ============================================================

-- 3 dias (4)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, streak_dias) VALUES
('STREAK-001','streak_marco','3dias', 'Três dias. Começou um padrão.',             ARRAY['A','B','C','D'],'automatico',3),
('STREAK-002','streak_marco','3dias', 'Três seguidos. Você está criando algo.',    ARRAY['A','B','C','D'],'automatico',3),
('STREAK-003','streak_marco','3dias', 'Terceiro dia. Isso já é diferente de antes.',ARRAY['A','B','C','D'],'automatico',3),
('STREAK-004','streak_marco','3dias', 'Três. Pequeno começo, grande potencial.',   ARRAY['A','B','C','D'],'automatico',3);

-- 7 dias (4)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, streak_dias) VALUES
('STREAK-005','streak_marco','7dias', 'Uma semana. Primeira linha cruzada. ✅',       ARRAY['A','B','C','D'],'automatico',7),
('STREAK-006','streak_marco','7dias', 'Sete dias. Seu novo normal está nascendo.',   ARRAY['A','B','C','D'],'automatico',7),
('STREAK-007','streak_marco','7dias', 'Uma semana inteira. Você provou que pode.',  ARRAY['A','B','C','D'],'automatico',7),
('STREAK-008','streak_marco','7dias', 'Sete. A consistência está virando hábito.',  ARRAY['A','B','C','D'],'automatico',7);

-- 14 dias (4)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, streak_dias) VALUES
('STREAK-009','streak_marco','14dias','Duas semanas. Isso já é diferente das outras vezes.',ARRAY['A','B','C','D'],'automatico',14),
('STREAK-010','streak_marco','14dias','Quatorze dias. Você está construindo de verdade.',   ARRAY['A','B','C','D'],'automatico',14),
('STREAK-011','streak_marco','14dias','Duas semanas seguidas. Seu ritmo próprio.',          ARRAY['A','B','C','D'],'automatico',14),
('STREAK-012','streak_marco','14dias','Quatorze. O automático está se instalando.',         ARRAY['A','B','C','D'],'automatico',14);

-- 21 dias (4)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, streak_dias) VALUES
('STREAK-013','streak_marco','21dias','Três semanas. Transformação em andamento.',          ARRAY['A','B','C','D'],'automatico',21),
('STREAK-014','streak_marco','21dias','Vinte e um dias. Você virou a página.',              ARRAY['A','B','C','D'],'automatico',21),
('STREAK-015','streak_marco','21dias','Três semanas. O novo já parece normal.',             ARRAY['A','B','C','D'],'automatico',21),
('STREAK-016','streak_marco','21dias','Vinte e um. O que era esforço virou rotina.',        ARRAY['A','B','C','D'],'automatico',21);

-- 30 dias (4)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, streak_dias) VALUES
('STREAK-017','streak_marco','30dias','Um mês. Nova realidade estabelecida. 🎯',            ARRAY['A','B','C','D'],'automatico',30),
('STREAK-018','streak_marco','30dias','Trinta dias. Você cruzou uma linha real.',           ARRAY['A','B','C','D'],'automatico',30),
('STREAK-019','streak_marco','30dias','Um mês inteiro. O modo automático é seu.',           ARRAY['A','B','C','D'],'automatico',30),
('STREAK-020','streak_marco','30dias','Trinta. Você provou que pode manter.',               ARRAY['A','B','C','D'],'automatico',30);

-- ============================================================
-- TIPO 6 — UPSELL CONTEXTUAL (12 mensagens)
-- ============================================================

-- Após 10 FIZ — Plano Completo (4)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, fiz_count) VALUES
('UPSELL-001','upsell','10fiz','Dez decisões seguidas. Você está pronta para mais?',                      ARRAY['A','B','C','D'],'manual',10),
('UPSELL-002','upsell','10fiz','Sua consistência pede mais. Que tal 7 decisões por dia?',                ARRAY['A','B','C','D'],'manual',10),
('UPSELL-003','upsell','10fiz','Dez vezes você escolheu. Agora pode escolher mais vezes.',               ARRAY['A','B','C','D'],'manual',10),
('UPSELL-004','upsell','10fiz','Plano completo: café, almoço, lanche, jantar, mais três. Interessada?', ARRAY['A','B','C','D'],'manual',10);

-- Após 20 FIZ — Plano Premium/PWA (4)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, fiz_count) VALUES
('UPSELL-005','upsell','20fiz','Vinte decisões. Você evoluiu para o próximo nível.',                     ARRAY['A','B','C','D'],'manual',20),
('UPSELL-006','upsell','20fiz','Sua consistência merece mais ferramentas. Conhece o app?',              ARRAY['A','B','C','D'],'manual',20),
('UPSELL-007','upsell','20fiz','Vinte vezes você mostrou compromisso. Que tal a versão completa?',      ARRAY['A','B','C','D'],'manual',20),
('UPSELL-008','upsell','20fiz','Plano premium: mais decisões, mais recursos, mesmo ritmo.',             ARRAY['A','B','C','D'],'manual',20);

-- Após 25 FIZ — Recorrência Mensal (4)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, fiz_count) VALUES
('UPSELL-009','upsell','25fiz','Vinte e cinco. Seu hábito está formado. Vamos manter juntas?',          ARRAY['A','B','C','D'],'manual',25),
('UPSELL-010','upsell','25fiz','Você provou que funciona. Assinatura mensal para continuar?',           ARRAY['A','B','C','D'],'manual',25),
('UPSELL-011','upsell','25fiz','Vinte e cinco decisões. Membro de longo prazo agora.',                  ARRAY['A','B','C','D'],'manual',25),
('UPSELL-012','upsell','25fiz','Recorrência: menos preocupação, mais consistência. Topa?',              ARRAY['A','B','C','D'],'manual',25);

-- ============================================================
-- TIPO 7 — ONBOARDING (10 mensagens)
-- ============================================================

-- Boas-vindas (2)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho) VALUES
('ONB-001','onboarding','boasvindas','Bem-vinda ao Modo Automático 80/20. Uma decisão por dia, sem dieta radical. Vamos começar?',         ARRAY['A','B','C','D'],'automatico'),
('ONB-002','onboarding','boasvindas','Oi! Aqui a gente faz diferente: 80% atenção, 20% flexibilidade. Uma decisão de cada vez. Pronta?',  ARRAY['A','B','C','D'],'automatico');

-- Perguntas de onboarding (5)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho) VALUES
('ONB-003','onboarding','pergunta','Como é sua rotina? (A) Previsível, (B) Variável, (C) Caótica, (D) Estruturada. Responde com a letra.',                              ARRAY['A','B','C','D'],'automatico'),
('ONB-004','onboarding','pergunta','O que mais te atrapalha? (A) Falta de tempo, (B) Ansiedade, (C) Família/social, (D) Não sei por onde começar.',                     ARRAY['A','B','C','D'],'keyword'),
('ONB-005','onboarding','pergunta','Já tentou dieta antes? (A) Nunca, (B) Algumas vezes, (C) Muitas vezes, (D) Perdi as contas.',                                       ARRAY['A','B','C','D'],'keyword'),
('ONB-006','onboarding','pergunta','O que te move agora? (A) Saúde, (B) Estética, (C) Bem-estar, (D) Controle.',                                                        ARRAY['A','B','C','D'],'keyword'),
('ONB-007','onboarding','pergunta','Que horário funciona? (A) Manhã, (B) Meio-dia, (C) Noite, (D) Varia.',                                                              ARRAY['A','B','C','D'],'keyword');

-- Confirmações de perfil (4)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho) VALUES
('ONB-008','onboarding','confirmacao','Perfil A: sua rotina é aliada. Vou mandar decisões no horário que você escolheu.',         ARRAY['A'],'automatico'),
('ONB-009','onboarding','confirmacao','Perfil B: flexibilidade é sua palavra. Ajusto as decisões conforme seu dia.',              ARRAY['B'],'automatico'),
('ONB-010','onboarding','confirmacao','Perfil C: sem pressão, sem culpa. Aqui você pode errar que é parte do processo.',         ARRAY['C'],'automatico'),
('ONB-011','onboarding','confirmacao','Perfil D: você gosta de entender o porquê. Explico o método por trás de cada decisão.',   ARRAY['D'],'automatico');

-- ============================================================
-- TIPO 8 — SITUAÇÕES ESPECIAIS (15 mensagens)
-- ============================================================

-- Texto não reconhecido (3)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, keywords) VALUES
('ESP-001','especial','nao_reconhecido','Não entendi direito. Pode mandar "FIZ" se fez, ou "NÃO CONSEGUI" se não rolou?',   ARRAY['A','B','C','D'],'keyword',ARRAY['*']),
('ESP-002','especial','nao_reconhecido','Mensagem fora do padrão aqui. Quando fizer a decisão do dia, manda "FIZ".',         ARRAY['A','B','C','D'],'keyword',ARRAY['*']),
('ESP-003','especial','nao_reconhecido','Sistema simples: recebe decisão, faz, manda "FIZ". Não fez, manda "NÃO CONSEGUI".',ARRAY['A','B','C','D'],'keyword',ARRAY['*']);

-- Pedido de pausa (3)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, keywords) VALUES
('ESP-004','especial','pausa','Entendido. Pausa aqui. Quando quiser voltar, é só mandar "VOLTEI".',            ARRAY['A','B','C','D'],'keyword',ARRAY['pausar','parar','pausa','PAUSA','PAUSAR','PARAR']),
('ESP-005','especial','pausa','Pausa anotada. Sem cobrança, sem pergunta. Te espero quando for hora.',         ARRAY['A','B','C','D'],'keyword',ARRAY['pausar','parar','pausa','PAUSA','PAUSAR','PARAR']),
('ESP-006','especial','pausa','Ok, pausado. Sua decisão de voltar é só sua.',                                 ARRAY['A','B','C','D'],'keyword',ARRAY['pausar','parar','pausa','PAUSA','PAUSAR','PARAR']);

-- Cancelamento (3)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, keywords) VALUES
('ESP-007','especial','cancelamento','Entendido. Cancelamento anotado. Quer me dizer o que não funcionou? (Opcional)',          ARRAY['A','B','C','D'],'keyword',ARRAY['cancelar','sair','não quero mais','CANCELAR','SAIR']),
('ESP-008','especial','cancelamento','Cancelado. Foi bom enquanto durou. Se mudar de ideia, a porta está aberta.',             ARRAY['A','B','C','D'],'keyword',ARRAY['cancelar','sair','não quero mais','CANCELAR','SAIR']),
('ESP-009','especial','cancelamento','Ok, você saiu. Obrigada por tentar. 💭',                                                 ARRAY['A','B','C','D'],'keyword',ARRAY['cancelar','sair','não quero mais','CANCELAR','SAIR']);

-- Retorno após pausa (3)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, keywords) VALUES
('ESP-010','especial','retorno','Voltou! Sem perguntas sobre onde estava. Vamos continuar de onde parou?',    ARRAY['A','B','C','D'],'keyword',ARRAY['voltei','oi','olá','VOLTEI','OI']),
('ESP-011','especial','retorno','Oi de novo. Pausa foi o que precisava. Agora é outro momento.',              ARRAY['A','B','C','D'],'keyword',ARRAY['voltei','oi','olá','VOLTEI','OI']),
('ESP-012','especial','retorno','De volta. Não importa quanto tempo passou. Importa o que vem agora.',       ARRAY['A','B','C','D'],'keyword',ARRAY['voltei','oi','olá','VOLTEI','OI']);

-- Dúvidas frequentes (3)
INSERT INTO messages (codigo, tipo, subtipo, texto, perfil, gatilho, keywords) VALUES
('ESP-013','especial','duvida','Uma decisão por dia, no seu horário. Você faz, manda "FIZ". Não faz, manda "NÃO CONSEGUI". Simples assim.',                     ARRAY['A','B','C','D'],'keyword',ARRAY['como funciona','o que é','explica','COMO FUNCIONA']),
('ESP-014','especial','duvida','Claro. Manda "MUDAR HORÁRIO" e escolhe: manhã, meio-dia, noite ou varia.',                                                       ARRAY['A','B','C','D'],'keyword',ARRAY['mudar horário','trocar hora','outro horário','MUDAR HORARIO']),
('ESP-015','especial','duvida','Depende do corpo, da consistência, da vida. Algumas sentem em semanas, outras em meses. O foco é o processo, não a balança.',    ARRAY['A','B','C','D'],'keyword',ARRAY['quanto tempo','quando vou ver','resultado','RESULTADO']);
