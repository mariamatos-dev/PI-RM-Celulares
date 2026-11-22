-- PROJETO INTEGRADO R&M CELULARES
-- Banco de dados demonstrativo: MySQL 8.0
-- ATENÇÃO: todos os registros inseridos são FICTÍCIOS e servem apenas para prototipação acadêmica.
CREATE DATABASE IF NOT EXISTS rm_celulares_bi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE rm_celulares_bi;

CREATE TABLE cliente (
  cliente_id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(120) NOT NULL,
  telefone VARCHAR(20),
  email VARCHAR(120),
  cidade VARCHAR(80)
);
CREATE TABLE tecnico (
  tecnico_id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(120) NOT NULL
);
CREATE TABLE aparelho (
  aparelho_id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  marca VARCHAR(60) NOT NULL,
  modelo VARCHAR(80) NOT NULL,
  identificacao_modelo VARCHAR(40),
  ano_modelo SMALLINT,
  CONSTRAINT fk_aparelho_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
);
CREATE TABLE servico (
  servico_id INT AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE produto (
  produto_id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(120) NOT NULL,
  categoria VARCHAR(60),
  custo_unitario DECIMAL(10,2) NOT NULL DEFAULT 0,
  preco_venda DECIMAL(10,2) NOT NULL,
  estoque_atual INT NOT NULL DEFAULT 0,
  estoque_minimo INT NOT NULL DEFAULT 0,
  CHECK (custo_unitario >= 0 AND preco_venda >= 0 AND estoque_atual >= 0)
);
CREATE TABLE ordem_servico (
  ordem_id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  aparelho_id INT NOT NULL,
  tecnico_id INT NOT NULL,
  data_abertura DATE NOT NULL,
  data_conclusao DATE NULL,
  status VARCHAR(30) NOT NULL,
  defeito_relatado VARCHAR(255),
  FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
  FOREIGN KEY (aparelho_id) REFERENCES aparelho(aparelho_id),
  FOREIGN KEY (tecnico_id) REFERENCES tecnico(tecnico_id)
);
CREATE TABLE item_ordem_servico (
  item_os_id INT AUTO_INCREMENT PRIMARY KEY,
  ordem_id INT NOT NULL,
  servico_id INT NOT NULL,
  quantidade INT NOT NULL DEFAULT 1,
  valor_mao_obra DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (ordem_id) REFERENCES ordem_servico(ordem_id),
  FOREIGN KEY (servico_id) REFERENCES servico(servico_id),
  CHECK (quantidade > 0 AND valor_mao_obra >= 0)
);
CREATE TABLE venda (
  venda_id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  data_venda DATE NOT NULL,
  status VARCHAR(30) NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
);
CREATE TABLE item_venda (
  item_venda_id INT AUTO_INCREMENT PRIMARY KEY,
  venda_id INT NOT NULL,
  produto_id INT NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (venda_id) REFERENCES venda(venda_id),
  FOREIGN KEY (produto_id) REFERENCES produto(produto_id),
  CHECK (quantidade > 0 AND preco_unitario >= 0)
);

-- Dados demonstrativos; importar os CSVs da pasta dados_csv ou executar os INSERTs
-- via assistente de importação do MySQL Workbench.

CREATE TABLE peca_ordem_servico (
  peca_os_id INT AUTO_INCREMENT PRIMARY KEY,
  ordem_id INT NOT NULL,
  produto_id INT NOT NULL,
  quantidade INT NOT NULL,
  custo_unitario DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (ordem_id) REFERENCES ordem_servico(ordem_id),
  FOREIGN KEY (produto_id) REFERENCES produto(produto_id),
  CHECK (quantidade > 0 AND custo_unitario >= 0)
);
