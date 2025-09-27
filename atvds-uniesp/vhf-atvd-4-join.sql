-- Questao 01 --
SELECT p.NumeroDoPedido, c.NomeDaEmpresa, c.Telefone, c.Fax
FROM Pedidos AS p
JOIN Clientes AS c ON c.CodigoDoCliente = p.CodigoDoCliente;


-- Questao 02 --
SELECT p.CodigoDoCliente, c.NomeDaEmpresa, p.DataDoPedido, p.Frete
FROM Pedidos AS p
JOIN Clientes AS c ON c.CodigoDoCliente = p.CodigoDoCliente;


-- Questao 03 --
SELECT f.CodigoDoFuncionario, f.Nome, f.Cargo, p.CodigoDoCliente, p.DataDoPedido
FROM Pedidos AS p
JOIN Funcionarios AS f ON f.CodigoDoFuncionario = p.CodigoDoFuncionario;


-- Questao 04 --
SELECT p.NumeroDoPedido, p.DataDoPedido, p.DataDeEntrega, t.NomeDaEmpresa AS Transportadora
FROM Pedidos AS p
JOIN Transportadoras AS t ON t.CodigoDaTransportadora = p.CodigoDaTransportadora
ORDER BY p.NumeroDoPedido;


-- Questao 05 --
SELECT
    f.Nome AS NomeFuncionario, p.NumeroDoPedido, c.NomeDaEmpresa
FROM Pedidos AS p
JOIN Funcionarios AS f ON f.CodigoDoFuncionario = p.CodigoDoFuncionario
JOIN Clientes AS c ON c.CodigoDoCliente = p.CodigoDoCliente;


-- Questao 06 --
SELECT
    pr.NomeDoProduto, ca.NomeDaCategoria, fo.NomeDaEmpresa
FROM Produtos AS pr
JOIN Categorias AS ca ON ca.CodigoDaCategoria = pr.CodigoDaCategoria
JOIN Fornecedores AS fo ON fo.CodigoDoFornecedor = pr.CodigoDoFornecedor;


-- Questao 07 --
SELECT pr.NomeDoProduto, pr.PrecoUnitario, dp.Quantidade, p.NumeroDoPedido, t.NomeDaEmpresa
FROM Detalhes_do_Pedido AS dp
JOIN Produtos        AS pr  ON pr.CodigoDoProduto = dp.CodigoDoProduto
JOIN Pedidos         AS p   ON p.NumeroDoPedido = dp.NumeroDoPedido
JOIN Transportadoras AS t   ON t.CodigoDaTransportadora = p.CodigoDaTransportadora;


-- Questao 08 --
SELECT pr.NomeDoProduto, p.DataDoPedido, c.NomeDaEmpresa
FROM Detalhes_do_Pedido AS dp
JOIN Produtos  AS pr  ON pr.CodigoDoProduto = dp.CodigoDoProduto
JOIN Pedidos   AS p   ON p.NumeroDoPedido = dp.NumeroDoPedido
JOIN Clientes  AS c   ON c.CodigoDoCliente = p.CodigoDoCliente;


-- Questao 09 --
SELECT fo.NomeDaEmpresa AS Fornecedor, pr.NomeDoProduto, pr.PrecoUnitario, p.DataDoPedido, c.NomeDaEmpresa AS Cliente
FROM Fornecedores AS fo
JOIN Produtos           AS pr   ON pr.CodigoDoFornecedor = fo.CodigoDoFornecedor
JOIN Detalhes_do_Pedido AS dp   ON dp.CodigoDoProduto = pr.CodigoDoProduto
JOIN Pedidos            AS p    ON p.NumeroDoPedido = dp.NumeroDoPedido
JOIN Clientes           AS c    ON c.CodigoDoCliente = p.CodigoDoCliente;


-- Questao 10 --
SELECT DISTINCT f.Nome AS NomeFuncionario, c.NomeDaEmpresa AS EmpresaCliente
FROM Pedidos AS p
JOIN Funcionarios AS f  ON f.CodigoDoFuncionario = p.CodigoDoFuncionario
JOIN Clientes     AS c  ON c.CodigoDoCliente = p.CodigoDoCliente;


-- Questao 11 --
SELECT ca.NomeDaCategoria, pr.NomeDoProduto, dp.PrecoUnitário, dp.Quantidade, dp.Desconto
FROM Detalhes_do_Pedido AS dp
JOIN Produtos    AS pr  ON pr.CodigoDoProduto = dp.CodigoDoProduto
JOIN Categorias  AS ca  ON ca.CodigoDaCategoria = pr.CodigoDaCategoria;



-- Questao 12 --
SELECT p.NumeroDoPedido, p.DataDoPedido, c.NomeDaEmpresa AS Cliente, t.NomeDaEmpresa AS Transportadora
FROM Pedidos AS p
JOIN Clientes AS c ON c.CodigoDoCliente = p.CodigoDoCliente
JOIN Transportadoras AS t ON t.CodigoDaTransportadora = p.CodigoDaTransportadora;


-- Questao 13 --
SELECT pr.CodigoDoProduto, pr.NomeDoProduto, pr.CodigoDoFornecedor, fo.NomeDaEmpresa AS Fornecedor
FROM Produtos AS pr
JOIN Fornecedores AS fo ON fo.CodigoDoFornecedor = pr.CodigoDoFornecedor;


-- Questao 14 --
SELECT f.Nome AS Funcionario, p.NumeroDoPedido, t.NomeDaEmpresa AS Transportadora
FROM Pedidos AS p
JOIN Funcionarios     AS f ON f.CodigoDoFuncionario = p.CodigoDoFuncionario
JOIN Transportadoras  AS t ON t.CodigoDaTransportadora = p.CodigoDaTransportadora


-- Questao 15 --
SELECT DISTINCT pr.NomeDoProduto
FROM Detalhes_do_Pedido AS dp
JOIN Produtos AS pr ON pr.CodigoDoProduto = dp.CodigoDoProduto;


-- Questao 16 --
SELECT
    f.Nome AS Funcionario,
    SUM(CAST(dp.PrecoUnitário AS decimal(19,4)) * dp.Quantidade * (1 - dp.Desconto/100.0)
    ) AS TotalVendido,
    SUM(CAST(dp.PrecoUnitário AS decimal(19,4)) * dp.Quantidade * (1 - dp.Desconto/100.0)
    ) * 0.05 AS Comissao_5,
    SUM(CAST(dp.PrecoUnitário AS decimal(19,4)) * dp.Quantidade * (1 - dp.Desconto/100.0)
    ) * 0.10 AS Comissao_10
FROM Funcionarios AS f
JOIN Pedidos            AS p  ON p.CodigoDoFuncionario = f.CodigoDoFuncionario
JOIN Detalhes_do_Pedido AS dp ON dp.NumeroDoPedido    = p.NumeroDoPedido
GROUP BY f.Nome
ORDER BY TotalVendido DESC;


-- Questao 17 --
SELECT ca.NomeDaCategoria, SUM(dp.Quantidade) AS QtdeVendida
FROM Detalhes_do_Pedido AS dp
JOIN Produtos   AS pr ON pr.CodigoDoProduto   = dp.CodigoDoProduto
JOIN Categorias AS ca ON ca.CodigoDaCategoria = pr.CodigoDaCategoria
GROUP BY ca.NomeDaCategoria;


-- Questao 18 --
SELECT t.NomeDaEmpresa AS Transportadora, COALESCE(SUM(p.Frete), 0) AS TotalFretes, COUNT(p.NumeroDoPedido) AS PedidosAtendidos
FROM Transportadoras AS t
LEFT JOIN Pedidos AS p ON p.CodigoDaTransportadora = t.CodigoDaTransportadora
GROUP BY t.NomeDaEmpresa;


-- Questao 19 --
SELECT c.NomeDaEmpresa AS Cliente, SUM(CAST(dp.PrecoUnitário AS decimal(19,4)) * dp.Quantidade * (dp.Desconto/100.0)) AS DescontoConcedido
FROM Clientes AS c
JOIN Pedidos            AS p  ON p.CodigoDoCliente = c.CodigoDoCliente
JOIN Detalhes_do_Pedido AS dp ON dp.NumeroDoPedido = p.NumeroDoPedido
GROUP BY c.NomeDaEmpresa;


-- Questao 20 --
SELECT f.Nome AS Funcionario, SUM( dp.PrecoUnitário * dp.Quantidade) AS DescontoConcedido
FROM Funcionarios AS f
JOIN Pedidos AS p  ON p.CodigoDoFuncionario = f.CodigoDoFuncionario
JOIN Detalhes_do_Pedido AS dp ON dp.NumeroDoPedido = p.NumeroDoPedido
GROUP BY f.Nome;