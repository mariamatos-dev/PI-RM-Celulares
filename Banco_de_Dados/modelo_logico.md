# Modelo lógico (PK sublinhada conceitualmente; FK indicada)

- CLIENTE(**cliente_id**, nome, telefone, email, cidade)
- TECNICO(**tecnico_id**, nome)
- APARELHO(**aparelho_id**, cliente_id FK -> CLIENTE, marca, modelo, identificacao_modelo, ano_modelo)
- SERVICO(**servico_id**, descricao)
- PRODUTO(**produto_id**, nome, categoria, custo_unitario, preco_venda, estoque_atual, estoque_minimo)
- ORDEM_SERVICO(**ordem_id**, cliente_id FK -> CLIENTE, aparelho_id FK -> APARELHO,
  tecnico_id FK -> TECNICO, data_abertura, data_conclusao, status, defeito_relatado)
- PECA_ORDEM_SERVICO(**peca_os_id**, ordem_id FK -> ORDEM_SERVICO, produto_id FK -> PRODUTO, quantidade, custo_unitario)
- ITEM_ORDEM_SERVICO(**item_os_id**, ordem_id FK -> ORDEM_SERVICO, servico_id FK -> SERVICO,
  quantidade, valor_mao_obra)
- VENDA(**venda_id**, cliente_id FK -> CLIENTE, data_venda, status)
- ITEM_VENDA(**item_venda_id**, venda_id FK -> VENDA, produto_id FK -> PRODUTO,
  quantidade, preco_unitario)

## Regras de negócio
1. Um cliente pode possuir vários aparelhos, ordens de serviço e vendas.
2. Cada ordem de serviço está associada a um cliente, aparelho e técnico.
3. Uma ordem pode conter um ou mais serviços, registrados em ITEM_ORDEM_SERVICO.
4. Peças utilizadas em reparos são registradas em PECA_ORDEM_SERVICO, vinculando a ordem ao produto/peça consumido.
5. Uma venda pode conter um ou mais produtos, registrados em ITEM_VENDA.
6. Preços e custos são armazenados como DECIMAL(10,2); quantidades são inteiras positivas.
7. O status da ordem deve ser padronizado: Aguardando aprovação, Aguardando peça, Em andamento ou Concluída.
8. Os dados de exemplo são fictícios; não representam registros reais da R&M Celulares.
