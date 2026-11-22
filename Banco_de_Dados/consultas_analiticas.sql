-- CONSULTAS PARA VALIDAR DADOS E ALIMENTAR O POWER BI

-- 1. Receita de serviços por mês (somente ordens concluídas)
SELECT DATE_FORMAT(os.data_conclusao,'%Y-%m') AS mes,
       SUM(ios.quantidade * ios.valor_mao_obra) AS receita_servicos
FROM ordem_servico os
JOIN item_ordem_servico ios ON ios.ordem_id=os.ordem_id
WHERE os.status='Concluída'
GROUP BY DATE_FORMAT(os.data_conclusao,'%Y-%m')
ORDER BY mes;

-- 2. Receita de vendas por mês
SELECT DATE_FORMAT(v.data_venda,'%Y-%m') AS mes,
       SUM(iv.quantidade * iv.preco_unitario) AS receita_vendas
FROM venda v JOIN item_venda iv ON iv.venda_id=v.venda_id
WHERE v.status='Concluída'
GROUP BY DATE_FORMAT(v.data_venda,'%Y-%m')
ORDER BY mes;

-- 3. Ordens por status
SELECT status, COUNT(*) AS quantidade
FROM ordem_servico GROUP BY status ORDER BY quantidade DESC;

-- 4. Serviços mais realizados
SELECT s.descricao, SUM(ios.quantidade) AS quantidade
FROM item_ordem_servico ios
JOIN servico s ON s.servico_id=ios.servico_id
GROUP BY s.descricao ORDER BY quantidade DESC;

-- 5. Produtos mais vendidos
SELECT p.nome, SUM(iv.quantidade) AS unidades_vendidas,
       SUM(iv.quantidade*iv.preco_unitario) AS faturamento
FROM item_venda iv JOIN produto p ON p.produto_id=iv.produto_id
JOIN venda v ON v.venda_id=iv.venda_id
WHERE v.status='Concluída'
GROUP BY p.nome ORDER BY unidades_vendidas DESC;

-- 6. Produtos abaixo do estoque mínimo
SELECT produto_id,nome,estoque_atual,estoque_minimo
FROM produto WHERE estoque_atual <= estoque_minimo
ORDER BY estoque_atual;
