erDiagram
    CLIENTE ||--o{ APARELHO : possui
    CLIENTE ||--o{ ORDEM_SERVICO : solicita
    APARELHO ||--o{ ORDEM_SERVICO : recebe
    TECNICO ||--o{ ORDEM_SERVICO : executa
    ORDEM_SERVICO ||--|{ ITEM_ORDEM_SERVICO : contem
    ORDEM_SERVICO ||--o{ PECA_ORDEM_SERVICO : utiliza
    PRODUTO ||--o{ PECA_ORDEM_SERVICO : consumido_em
    SERVICO ||--o{ ITEM_ORDEM_SERVICO : classifica
    CLIENTE ||--o{ VENDA : realiza
    VENDA ||--|{ ITEM_VENDA : contem
    PRODUTO ||--o{ ITEM_VENDA : vendido_em
