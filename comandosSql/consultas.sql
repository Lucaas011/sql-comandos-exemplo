-- Seleção de todos os dados da tabela 'tabelaclientes' onde o nome do cliente é igual a 'A'
SELECT * 
FROM tabelaclientes 
WHERE nome_cliente = 'A';  -- O filtro 'WHERE' seleciona apenas os registros em que o nome do cliente seja 'A'

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Seleciona todos os registros da tabela 'tabelapedidos' onde a coluna 'data_de_envio_estimada'
-- está entre as datas de 1º de agosto de 2023 e 1º de setembro de 2023, inclusive.
SELECT * 
FROM tabelapedidos 
WHERE data_de_envio_estimada BETWEEN '2023-08-01' AND '2023-09-01';

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Seleciona todos os registros da tabela 'tabelaprodutos' onde o preço de compra está entre 200 e 600,
-- e organiza os resultados pela coluna 'fornecedor' em ordem decrescente.
SELECT * 
FROM tabelaprodutos 
WHERE preço_de_compra BETWEEN 200 AND 600  -- Filtra os produtos com preço entre 200 e 600
ORDER BY fornecedor DESC;  -- Ordena os resultados pela coluna 'fornecedor' de forma decrescente

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Seleciona a coluna 'informacoes_de_contato' da tabela 'tabelaclientes' e a renomeia como 'email_cliente'
SELECT informacoes_de_contato AS email_cliente  -- Renomeia a coluna 'informacoes_de_contato' para 'email_cliente'
FROM tabelaclientes;  -- Obtém os dados da tabela 'tabelaclientes'


