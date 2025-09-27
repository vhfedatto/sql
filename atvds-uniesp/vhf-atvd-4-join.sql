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


-- Questao 17 --


-- Questao 18 --


-- Questao 19 --


-- Questao 20 --

