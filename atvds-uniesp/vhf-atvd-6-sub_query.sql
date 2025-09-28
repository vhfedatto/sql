-- Questão 01 --
SELECT NomeDoProduto, PrecoUnitario FROM Produtos
WHERE PrecoUnitario > (SELECT AVG(PrecoUnitario) FROM Produtos);

-- Questão 02 --
SELECT DISTINCT c.NomeDaEmpresa AS Cliente FROM Detalhes_do_Pedido AS dp
JOIN Produtos AS pr ON pr.CodigoDoProduto = dp.CodigoDoProduto
JOIN Pedidos  AS p  ON p.NumeroDoPedido   = dp.NumeroDoPedido
JOIN Clientes AS c  ON c.CodigoDoCliente  = p.CodigoDoCliente
WHERE pr.NomeDoProduto = 'Maxilaku';

-- Questão 03 --
SELECT NumeroDoPedido FROM Detalhes_do_Pedido
GROUP BY NumeroDoPedido
HAVING COUNT(*) > 5;

-- Questão 04 --
WITH TotaisPorPedido AS (
    SELECT p.NumeroDoPedido, p.CodigoDoCliente, SUM( dp.PrecoUnitário * dp.Quantidade - dp.Desconto ) AS ValorPedido
    FROM Pedidos AS p
    JOIN Detalhes_do_Pedido AS dp ON dp.NumeroDoPedido = p.NumeroDoPedido
    GROUP BY p.NumeroDoPedido, p.CodigoDoCliente
)
SELECT c.NomeDaEmpresa AS Cliente, MAX(t.ValorPedido) AS MaiorPedido FROM TotaisPorPedido AS t
JOIN Clientes AS c ON c.CodigoDoCliente = t.CodigoDoCliente
GROUP BY c.NomeDaEmpresa

-- Questão 05 --
SELECT pr.NomeDoProduto, MAX(dp.Quantidade) AS MaiorQuantidade FROM Produtos AS pr
JOIN Detalhes_do_Pedido AS dp ON dp.CodigoDoProduto = pr.CodigoDoProduto
GROUP BY pr.NomeDoProduto
ORDER BY MaiorQuantidade DESC, pr.NomeDoProduto;

-- Questão 06 --
SELECT pr.NomeDoProduto, MIN(dp.[PrecoUnitário]) AS MenorPrecoVendido
FROM Produtos AS pr
JOIN Detalhes_do_Pedido AS dp ON dp.CodigoDoProduto = pr.CodigoDoProduto
GROUP BY pr.NomeDoProduto
ORDER BY MenorPrecoVendido, pr.NomeDoProduto;

-- Questão 07 --
SELECT p.NumeroDoPedido FROM Pedidos AS p
JOIN Transportadoras AS t
    ON t.CodigoDaTransportadora = p.CodigoDaTransportadora
WHERE t.NomeDaEmpresa = 'Speedy Express' AND p.DataDoPedido >= '1996-04-01' AND p.DataDoPedido <  '1996-07-01'

-- Questão 08 --
SELECT p.NumeroDoPedido FROM Pedidos AS p
WHERE (YEAR(p.DataDoPedido) = 1996 AND MONTH(p.DataDoPedido) = 4) OR (YEAR(p.DataDoPedido) = 1997 AND MONTH(p.DataDoPedido) = 3)

-- Questão 09 --
WITH TotaisQ2_1997 AS (
    SELECT p.NumeroDoPedido, SUM( dp.[PrecoUnitário] * dp.Quantidade - dp.Desconto ) AS ValorPedido FROM Pedidos AS p
    JOIN Detalhes_do_Pedido AS dp ON dp.NumeroDoPedido = p.NumeroDoPedido
    WHERE p.DataDoPedido >= '1997-04-01' AND p.DataDoPedido < '1997-07-01'
    GROUP BY p.NumeroDoPedido
),
MediaTrimestre AS (SELECT AVG(ValorPedido*1.0) AS MediaValor FROM TotaisQ2_1997)
SELECT t.NumeroDoPedido, t.ValorPedido
FROM TotaisQ2_1997 AS t
CROSS JOIN MediaTrimestre AS m
WHERE t.ValorPedido > m.MediaValor;

-- Questão 10 --
SELECT DISTINCT f.NomeDaEmpresa AS Fornecedor
FROM Fornecedores AS f
JOIN Produtos AS p ON p.CodigoDoFornecedor = f.CodigoDoFornecedor
WHERE p.PrecoUnitario > (SELECT AVG(PrecoUnitario) FROM Produtos);

-- Questão 11 --
SELECT p.NomeDoProduto, p.PrecoUnitario FROM Produtos AS p
WHERE p.CodigoDaCategoria IN (
    SELECT c.CodigoDaCategoria FROM Categorias AS c
    WHERE c.NomeDaCategoria = 'Confeitos'
);

-- Questão 12 --
SELECT p.NumeroDoPedido, p.CodigoDoCliente, p.DataDoPedido FROM Pedidos AS p
WHERE p.CodigoDaTransportadora IN (
    SELECT t.CodigoDaTransportadora FROM Transportadoras AS t
    WHERE t.NomeDaEmpresa IN ('Speedy Express', 'Federal Shipping')
);

-- Questão 13 --
SELECT c.NomeDaEmpresa, p.NumeroDoPedido, p.DataDoPedido FROM Clientes AS c
JOIN Pedidos AS p ON p.CodigoDoCliente = c.CodigoDoCliente
WHERE p.NumeroDoPedido IN (
    SELECT x.NumeroDoPedido FROM Pedidos AS x
    WHERE (YEAR(x.DataDoPedido) = 1996 AND MONTH(x.DataDoPedido) = 8) OR (YEAR(x.DataDoPedido) = 1997 AND MONTH(x.DataDoPedido) = 9)
);

-- Questão 14 --
SELECT p.* FROM Pedidos AS p
WHERE p.CodigoDoCliente IN (
    SELECT c.CodigoDoCliente FROM Clientes AS c
    WHERE c.Fax IS NULL OR LTRIM(RTRIM(c.Fax)) = ''
);

-- Questão 15 --
SELECT DISTINCT c.NomeDaEmpresa FROM Clientes AS c
JOIN Pedidos AS p ON p.CodigoDoCliente = c.CodigoDoCliente
JOIN (
    SELECT dp.NumeroDoPedido, SUM(dp.PrecoUnitário * dp.Quantidade - dp.Desconto) AS ValorPedido FROM Detalhes_do_Pedido AS dp
    GROUP BY dp.NumeroDoPedido
) AS tp ON tp.NumeroDoPedido = p.NumeroDoPedido
WHERE tp.ValorPedido > (
    SELECT AVG(t2.ValorPedido * 1.0) FROM (
        SELECT dp2.NumeroDoPedido, SUM(dp2.PrecoUnitário * dp2.Quantidade - dp2.Desconto) AS ValorPedido FROM Detalhes_do_Pedido AS dp2
        GROUP BY dp2.NumeroDoPedido
    ) AS t2
);

-- Questão 16 --
SELECT f.Nome, f.DataDeNascimento FROM Funcionarios AS f
WHERE DATEDIFF(year, f.DataDeNascimento, GETDATE()) < (SELECT AVG(DATEDIFF(year, f2.DataDeNascimento, GETDATE())*1.0) FROM Funcionarios AS f2);

-- Questão 17 --
SELECT x.CodigoDoFuncionario, f.Nome, x.QtdePedidos FROM (
    SELECT p.CodigoDoFuncionario, COUNT(*) AS QtdePedidos FROM Pedidos AS p
    WHERE p.CodigoDoFuncionario IS NOT NULL
    GROUP BY p.CodigoDoFuncionario
) AS x
JOIN Funcionarios AS f ON f.CodigoDoFuncionario = x.CodigoDoFuncionario
WHERE x.QtdePedidos > (
    SELECT AVG(y.QtdePedidos * 1.0) FROM (
        SELECT p2.CodigoDoFuncionario, COUNT(*) AS QtdePedidos FROM Pedidos AS p2
        WHERE p2.CodigoDoFuncionario IS NOT NULL
        GROUP BY p2.CodigoDoFuncionario
    ) AS y
);

-- Questão 18 --
SELECT p.NumeroDoPedido FROM Pedidos AS p
WHERE p.CodigoDoCliente IN (
    SELECT c.CodigoDoCliente
    FROM dbo.Clientes AS c
    WHERE c.Fax IS NULL
);

-- Questão 19 --
SELECT c.NomeDaEmpresa
FROM Clientes AS c
WHERE NOT EXISTS (
    SELECT 1 FROM Pedidos AS p
    WHERE p.CodigoDoCliente = c.CodigoDoCliente
);

-- Questão 20 --
SELECT p.NumeroDoPedido FROM Pedidos AS p
WHERE EXISTS (
  SELECT 1 FROM Detalhes_do_Pedido AS dp
  JOIN Produtos AS pr ON pr.CodigoDoProduto = dp.CodigoDoProduto
  JOIN Categorias AS ca ON ca.CodigoDaCategoria = pr.CodigoDaCategoria
  WHERE dp.NumeroDoPedido = p.NumeroDoPedido AND ca.NomeDaCategoria = 'Bebidas'
);

-- Questão 21 --
SELECT DISTINCT f.Nome AS Funcionario FROM Pedidos AS p
JOIN Funcionarios AS f ON f.CodigoDoFuncionario = p.CodigoDoFuncionario
JOIN Clientes AS c ON c.CodigoDoCliente = p.CodigoDoCliente
WHERE c.NomeDaEmpresa IN (N'Antonio Moreno Taquería','Blauer See Delikatessen','Ernst Handel');

-- Questão 22 --
SELECT DISTINCT c.NomeDaEmpresa AS Cliente FROM Pedidos AS p
JOIN Clientes AS c ON c.CodigoDoCliente = p.CodigoDoCliente
WHERE p.Frete > (SELECT AVG(Frete*1.0) FROM Pedidos);

-- Questão 23 --
SELECT DISTINCT pr.NomeDoProduto FROM Detalhes_do_Pedido AS dp
JOIN Produtos AS pr ON pr.CodigoDoProduto = dp.CodigoDoProduto
WHERE dp.Desconto < (SELECT AVG(Desconto*1.0) FROM Detalhes_do_Pedido);

--ou (23)
SELECT DISTINCT pr.NomeDoProduto FROM Detalhes_do_Pedido AS dp
JOIN Produtos AS pr ON pr.CodigoDoProduto = dp.CodigoDoProduto
WHERE dp.Desconto <= (SELECT AVG(Desconto*1.0) FROM dbo.Detalhes_do_Pedido);

-- Questão 24 --
SELECT DISTINCT f.NomeDaEmpresa AS Fornecedor FROM dbo.Fornecedores AS f
JOIN Produtos AS p ON p.CodigoDoFornecedor = f.CodigoDoFornecedor
WHERE p.PrecoUnitario > (SELECT AVG(PrecoUnitario) FROM Produtos);

-- Questão 25 --
SELECT p.NomeDoProduto, p.UnidadesEmEstoque FROM dbo.Produtos AS p
WHERE p.UnidadesEmEstoque < (
    SELECT AVG(dp.Quantidade*1.0)
    FROM dbo.Detalhes_do_Pedido AS dp
);