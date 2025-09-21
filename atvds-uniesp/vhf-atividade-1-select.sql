SELECT unidade FROM bebida; --- 195??
SELECT DISTINCT categoria FROM bebida; --- 2
SELECT bebida FROM bebida WHERE bebida LIKE '%COPO%'; --- 9
SELECT bebida, custobebida FROM bebida; ---Clique no botão lateral com "Salvar como CSV" - estou usando o Azure Data Studio.
SELECT bebida AS bebida, custobebida AS Custobebida, custobebida * 1.10 AS [CustobebidaAdd10], precocardapio AS Precocardapio, precocardapio * 0.85 AS [PrecocardapioMin15] FROM Bebida; --- Clique em Exportar -> Excel ou "Save as Excel"
SELECT * FROM bebida WHERE idbebida BETWEEN 100 AND 150;
SELECT * FROM bebida WHERE bebida LIKE 'V%';
SELECT TOP (10) * FROM bebida ORDER BY precocardapio DESC;
SELECT TOP (20) * FROM bebida ORDER BY precocardapio ASC;
SELECT TOP (30) * FROM bebida ORDER BY custobebida DESC;
SELECT * FROM bebida WHERE codigo LIKE 'RV4%';
SELECT bebida AS [Produto], precocardapio AS [Preço Venda], custobebida AS [Custo Bebida] FROM bebida;
SELECT * FROM bebida WHERE bebida LIKE '%ZERO%';