CREATE DATABASE IF NOT EXISTS Dimensional;
USE Dimensional;
CREATE TABLE Dimensional.dim_categoria (
    categoria_id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Dimensional.dim_cliente (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    telefone VARCHAR(20),
    status VARCHAR(10),
    limite_credito NUMERIC(10, 2) NOT NULL
);
CREATE TABLE Dimensional.dim_produto (
    produto_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria_id INT REFERENCES Dimensional.dim_categoria(categoria_id),
    preco NUMERIC(10, 2) NOT NULL
);
CREATE TABLE Dimensional.dim_tempo (
    data DATE PRIMARY KEY,
    ano INT NOT NULL,
    mes INT NOT NULL,
    dia INT NOT NULL
);
CREATE TABLE Dimensional.fato_vendas (
    venda_id SERIAL PRIMARY KEY,
    data DATE REFERENCES Dimensional.dim_tempo(data),
    cliente_id INT REFERENCES Dimensional.dim_cliente(cliente_id),
    produto_id INT REFERENCES Dimensional.dim_produto(produto_id),
    quantidade INT NOT NULL,
    valor_total NUMERIC(12, 2) NOT NULL
);
