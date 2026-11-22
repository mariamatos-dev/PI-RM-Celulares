USE rm_celulares_bi;

-- =====================================
-- 1. SERVICOS
-- =====================================
INSERT INTO servico (servico_id, descricao)
VALUES
(1, 'Troca de tela'),
(2, 'Troca de bateria'),
(3, 'Reparo de conector de carga'),
(4, 'Limpeza interna'),
(5, 'Atualizacao de software');

-- =====================================
-- 2. PRODUTOS
-- =====================================
INSERT INTO produto
(produto_id, nome, categoria, custo_unitario, preco_venda, estoque_atual, estoque_minimo)
VALUES
(1, 'Tela Samsung A54', 'Tela', 180.00, 320.00, 8, 2),
(2, 'Bateria iPhone 12', 'Bateria', 95.00, 180.00, 10, 3),
(3, 'Conector USB-C', 'Conector', 18.00, 45.00, 20, 5),
(4, 'Pelicula de vidro', 'Acessorio', 5.00, 15.00, 50, 10),
(5, 'Capa protetora', 'Acessorio', 8.00, 25.00, 35, 8),
(6, 'Carregador USB-C', 'Carregador', 25.00, 55.00, 15, 5),
(7, 'Bateria Samsung S21', 'Bateria', 75.00, 150.00, 6, 2),
(8, 'Tela Redmi Note 12', 'Tela', 110.00, 230.00, 4, 2);

-- =====================================
-- 3. ORDENS DE SERVICO
-- =====================================
INSERT INTO ordem_servico
(ordem_id, cliente_id, aparelho_id, tecnico_id, data_abertura, data_conclusao, status, defeito_relatado)
VALUES
(1, 1, 1, 1, '2026-10-01', '2026-10-02', 'Concluida', 'Tela quebrada'),
(2, 2, 2, 2, '2026-10-03', '2026-10-04', 'Concluida', 'Bateria descarregando'),
(3, 3, 3, 1, '2026-10-05', '2026-10-05', 'Concluida', 'Falha no conector'),
(4, 4, 4, 3, '2026-10-06', NULL, 'Em andamento', 'Tela com falhas'),
(5, 5, 5, 2, '2026-10-07', NULL, 'Aguardando peca', 'Bateria com defeito');

-- =====================================
-- 4. ITENS DE ORDEM DE SERVICO
-- =====================================
INSERT INTO item_ordem_servico
(item_os_id, ordem_id, servico_id, quantidade, valor_mao_obra)
VALUES
(1, 1, 1, 1, 120.00),
(2, 2, 2, 1, 80.00),
(3, 3, 3, 1, 70.00),
(4, 4, 1, 1, 120.00),
(5, 5, 2, 1, 80.00);

-- =====================================
-- 5. PECAS UTILIZADAS
-- =====================================
INSERT INTO peca_ordem_servico
(peca_os_id, ordem_id, produto_id, quantidade, custo_unitario)
VALUES
(1, 1, 1, 1, 180.00),
(2, 2, 2, 1, 95.00),
(3, 3, 3, 1, 18.00),
(4, 4, 8, 1, 110.00),
(5, 5, 7, 1, 75.00);

-- =====================================
-- 6. VENDAS
-- =====================================
INSERT INTO venda
(venda_id, cliente_id, data_venda, status)
VALUES
(1, 1, '2026-10-02', 'Concluida'),
(2, 2, '2026-10-04', 'Concluida'),
(3, 3, '2026-10-05', 'Concluida'),
(4, 4, '2026-10-06', 'Concluida'),
(5, 5, '2026-10-07', 'Concluida');

-- =====================================
-- 7. ITENS DAS VENDAS
-- =====================================
INSERT INTO item_venda
(item_venda_id, venda_id, produto_id, quantidade, preco_unitario)
VALUES
(1, 1, 4, 2, 15.00),
(2, 1, 5, 1, 25.00),
(3, 2, 6, 1, 55.00),
(4, 3, 4, 1, 15.00),
(5, 3, 5, 1, 25.00),
(6, 4, 6, 1, 55.00),
(7, 5, 4, 2, 15.00),
(8, 5, 5, 1, 25.00);

-- =====================================
-- CONFERENCIA FINAL
-- =====================================
SELECT 'cliente' AS tabela, COUNT(*) AS total FROM cliente
UNION ALL SELECT 'tecnico', COUNT(*) FROM tecnico
UNION ALL SELECT 'aparelho', COUNT(*) FROM aparelho
UNION ALL SELECT 'servico', COUNT(*) FROM servico
UNION ALL SELECT 'produto', COUNT(*) FROM produto
UNION ALL SELECT 'ordem_servico', COUNT(*) FROM ordem_servico
UNION ALL SELECT 'item_ordem_servico', COUNT(*) FROM item_ordem_servico
UNION ALL SELECT 'peca_ordem_servico', COUNT(*) FROM peca_ordem_servico
UNION ALL SELECT 'venda', COUNT(*) FROM venda
UNION ALL SELECT 'item_venda', COUNT(*) FROM item_venda;


