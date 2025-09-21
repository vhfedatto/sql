SELECT DISTINCT CodigoDoProduto, Desconto FROM Detalhes_do_Pedido; ---Não consegui achar as unidades vendidas
SELECT DISTINCT d.CodigoDoProduto FROM dbo.Detalhes_do_Pedido AS d;
SELECT DISTINCT CodigoDoCliente FROM Pedidos;
SELECT NomeDaEmpresa, Endereco,'Cliente preferencial' AS StatusCliente FROM Clientes;
SELECT TOP (25) PERCENT * FROM Produtos;
SELECT TOP (50) PERCENT * FROM Funcionarios;
SELECT TOP (10) PERCENT * FROM Pedidos;
SELECT TOP (17) PERCENT * FROM Fornecedores;
SELECT TOP (85) PERCENT * FROM Categorias;
SELECT DISTINCT Cidade FROM Funcionarios 
SELECT DISTINCT Regiao FROM Funcionarios 
SELECT DISTINCT Pais FROM Fornecedores 
SELECT DISTINCT CodigoDoCliente FROM Pedidos;
SELECT DISTINCT CodigoDoProduto FROM Detalhes_do_Pedido;
SELECT CodigoDoProduto, NomeDoProduto, PrecoUnitario, PrecoUnitario * 1.07 AS PrecoComAcrecimo7 FROM Produtos;
SELECT NumeroDoPedido, PrecoUnitário, Desconto, PrecoUnitário * (1 - Desconto) AS [Preço Final] FROM Detalhes_do_Pedido;
SELECT NumeroDoPedido, PrecoUnitário * Quantidade AS [Preço Total], PrecoUnitário * Quantidade * (1 - Desconto) AS [Preço Final] FROM Detalhes_do_Pedido;
SELECT PrecoUnitario, PrecoUnitario * 1.25 AS [PrecoAdd25], PrecoUnitario * 1.35 AS [PrecoAdd35], PrecoUnitario * 1.45 AS [PrecoAdd45] FROM Produtos;
SELECT NumeroDoPedido, Frete, Frete * 1.05 AS [FreteAdd5], Frete * 1.10 AS [FreteAdd10] FROM Pedidos;
SELECT CodigoDoProduto, NomeDoProduto, NivelDeReposicao, NivelDeReposicao + 5 AS NivelReposicaoAdd5 FROM Produtos; ---5 o que? 5% ou adicionar 5?
SELECT CodigoDoProduto, PrecoUnitario * UnidadesEmEstoque AS "Total em Estoque" FROM Produtos;
SELECT NumeroDoPedido, CodigoDoProduto, PrecoUnitário, Quantidade, PrecoUnitário * 1.20 AS "Cheque p/ 30 dias", PrecoUnitário * 1.30 AS "Cheque p/ 60 dias", PrecoUnitário * 0.85 AS "À Vista" FROM Detalhes_do_Pedido;
SELECT CodigoDoProduto, NomeDoProduto, NivelDeReposicao, NivelDeReposicao + 5 AS NivelReposicaoAdd5 FROM Produtos;
SELECT NumeroDoPedido, CodigoDoCliente AS [Cliente], CodigoDoFuncionario, Frete * 0.93 AS [Frete c/ desconto] FROM Pedidos;
SELECT Nome, Sobrenome FROM Funcionarios ORDER BY Nome DESC;
SELECT CodigoDoProduto, NomeDoProduto, PrecoUnitario FROM Produtos ORDER BY NomeDoProduto ASC;
SELECT CodigoDoProduto AS [Cód.], NomeDoProduto AS [Produto], PrecoUnitario AS [P. Unitário] FROM Produtos ORDER BY CodigoDoProduto DESC;
SELECT Pais, Regiao, CodigoDoFornecedor, NomeDaEmpresa, NomeDoContato FROM Fornecedores ORDER BY Pais ASC, Regiao DESC, NomeDaEmpresa ASC;
SELECT CodigoDoFuncionario, Sobrenome, Nome FROM Funcionarios ORDER BY Pais ASC;