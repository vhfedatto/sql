-- Questão 01 --
SELECT SUM(Frete) AS TotalFrete FROM Pedidos;

-- Questão 02 --
SELECT COUNT(*) AS QtdeContratados_1992 FROM Funcionarios
WHERE YEAR(DataDeContratacao) = 1992;

-- Questão 03 --
SELECT COUNT(*) AS FornecedoresAlemanha FROM Fornecedores
WHERE Pais = 'Alemanha';

-- Questão 04 --
SELECT SUM(Quantidade) AS TotalQuantidadeVendida FROM Detalhes_do_Pedido;

-- Questão 05 --
SELECT MAX(Frete) AS FreteMaximo FROM Pedidos;

-- Questão 06 --
SELECT MIN(Desconto) AS DescontoMinimo FROM Detalhes_do_Pedido;

-- Questão 07 --
SELECT COUNT(*) AS ProdutosCondimentos FROM Produtos
WHERE CodigoDaCategoria = 2;

-- Questão 08 --
SELECT COUNT(*) AS CategoriasInicioC FROM Categorias
WHERE NomeDaCategoria LIKE 'C%';

-- Questão 09 --
SELECT COUNT(*) AS ProdutosAbaixoReposicao FROM Produtos
WHERE UnidadesEmEstoque < NivelDeReposicao;

-- Questão 10 --
SELECT SUM(PrecoUnitario) AS SomaPrecosCatalogo FROM Produtos;

-- Questão 11 --
SELECT SUM(PrecoUnitário * Quantidade) AS TotalVendido_Prod51 FROM Detalhes_do_Pedido
WHERE CodigoDoProduto = 51;

-- Questão 12 --
SELECT COUNT(*) AS QtdePedidos FROM Pedidos
WHERE CodigoDoCliente = 'ROMEY' AND YEAR(DataDoPedido) = 1996;

-- Questão 13 --
SELECT COUNT(*) AS AniversarioJulho FROM Funcionarios
WHERE MONTH(DataDeNascimento) = 7;

-- Questão 14 --
SELECT COUNT(*) AS Produtos_C_G_N FROM Produtos
WHERE NomeDoProduto LIKE 'C%' OR NomeDoProduto LIKE 'G%' OR NomeDoProduto LIKE 'N%';

-- Questão 15 --
SELECT COUNT(*) AS Clientes_Ale_Mex_UK FROM Clientes
WHERE Pais IN ('Alemanha', 'México', 'Reino Unido');

-- Questão 16 --
SELECT COUNT(*) AS ClientesSemFax FROM Clientes
WHERE Fax IS NULL;

-- Questão 17 --
SELECT SUM(PrecoUnitario * UnidadesEmEstoque) AS ValorTotalEmEstoque FROM Produtos;

-- Questão 18 --
SELECT SUM(PrecoUnitário * Quantidade) AS ValorTotalVendido FROM Detalhes_do_Pedido;

-- Questão 19 --
SELECT SUM(PrecoUnitário * Quantidade) AS TotalVendido_Prod19 FROM Detalhes_do_Pedido
WHERE CodigoDoProduto = 19;

-- Questão 20 --
SELECT SUM(Frete) AS TotalFrete_LILAS FROM Pedidos
WHERE CodigoDoCliente = 'LILAS';