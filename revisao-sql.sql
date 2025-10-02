-- Questão 01

SELECT Cliente_idCliente, Nome, count(Cliente_idCliente) Total
FROM Venda AS v
JOIN Cliente AS c ON v.Cliente_idCliente = c.idCliente
GROUP BY v.Cliente_idCliente, c.Nome
ORDER BY Total DESC;

-- Questão 02
SELECT TOP(1) vdr.idVendedor, vdr.Nome, SUM(vnd.Quantidade) AS Quantidade_Vendida
FROM Vendedor AS vdr
JOIN Venda AS vnd ON vnd.Vendedor_idVendedor = vdr.idVendedor
GROUP BY vdr.idVendedor, vdr.Nome
ORDER BY Quantidade_Vendida DESC;

-- Questão 03
SELECT cli.idCliente, cli.Nome, SUM(vnd.Quantidade) AS Quantidade_Total
FROM Cliente AS cli
JOIN Venda AS vnd ON vnd.Cliente_idCliente = cli.idCliente
GROUP BY cli.idCliente, cli.Nome
ORDER BY Quantidade_Total DESC;

-- Questão 04
SELECT vdr.idVendedor, vdr.Nome, SUM(vnd.Quantidade) AS Quantidade_Vendida
FROM Vendedor AS vdr
JOIN Venda AS vnd ON vnd.Vendedor_idVendedor = vdr.idVendedor
GROUP BY vdr.idVendedor, vdr.Nome
ORDER BY Quantidade_Vendida DESC;

-- Questão 05
SELECT p.idProduto, p.Descricao, SUM(v.Quantidade) AS Quantidade_Total
FROM Produto AS p
JOIN Venda AS v ON v.Produto_idProduto = p.idProduto
GROUP BY p.idProduto, p.Descricao
ORDER BY Quantidade_Total DESC;

-- Questão 06
SELECT p.idProduto, p.Descricao FROM Produto AS p
LEFT JOIN Venda AS v ON v.Produto_idProduto = p.idProduto
WHERE v.idVenda IS NULL;

-- Questão 07
SELECT TOP (1) v.Turno, COUNT(*) AS Qtd_Vendas FROM Venda AS v
GROUP BY v.Turno
ORDER BY Qtd_Vendas DESC, v.Turno;

-- Questão 08
SELECT v.Turno, SUM(v.Quantidade) AS Quantidade_Total FROM Venda AS v
GROUP BY v.Turno
ORDER BY Quantidade_Total DESC;

-- Questão 09
SELECT c.idCliente, c.Nome, AVG(CAST(v.Quantidade AS DECIMAL(10,2))) AS Media_Quantidade
FROM Cliente AS c
JOIN Venda AS v ON v.Cliente_idCliente = c.idCliente
GROUP BY c.idCliente, c.Nome
ORDER BY Media_Quantidade DESC;

-- Questão 10
SELECT v.idVendedor, v.Nome, AVG(CAST(vnd.Quantidade AS DECIMAL(10,2))) AS Media_Quantidade
FROM Vendedor AS v
JOIN Venda AS vnd ON vnd.Vendedor_idVendedor = v.idVendedor
GROUP BY v.idVendedor, v.Nome
ORDER BY Media_Quantidade DESC;

-- Questão 11
SELECT idCliente, Nome, Celular FROM Cliente
WHERE Celular IS NULL;

-- Questão 12
SELECT DISTINCT Setor FROM Produto
ORDER BY Setor;

-- Questão 13
SELECT DISTINCT Turno FROM Venda
ORDER BY Turno;

-- Questão 14
SELECT idCliente, Nome FROM Cliente
WHERE Nome LIKE '%Cristina%';

-- Questão 15
SELECT DAY(vnd.DataVenda) AS Dia, COUNT(*) AS Qtd_Vendas FROM Venda AS vnd
WHERE DAY(vnd.DataVenda) BETWEEN 1 AND 5
GROUP BY DAY(vnd.DataVenda)
ORDER BY Dia;

-- Questão 16
SELECT vnd.DataVenda, COUNT(*) AS Qtd_Vendas FROM Venda AS vnd
GROUP BY vnd.DataVenda
ORDER BY vnd.DataVenda;