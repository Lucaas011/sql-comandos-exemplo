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

SELECT * 
FROM tabelaprodutos 
WHERE preço_de_compra BETWEEN 200 AND 600  -- Filtra os produtos com preço entre 200 e 600
ORDER BY fornecedor DESC;  -- Ordena os resultados pela coluna 'fornecedor' de forma decrescente

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Seleciona a coluna 'informacoes_de_contato' da tabela 'tabelaclientes' e a renomeia como 'email_cliente'
SELECT informacoes_de_contato AS email_cliente  -- Renomeia a coluna 'informacoes_de_contato' para 'email_cliente'
FROM tabelaclientes;  -- Obtém os dados da tabela 'tabelaclientes'

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * from CargosColaboradores
WHERE datatermino NOTNULL  -- ISNULL Filtra os registros onde a coluna 'datatermino' é nula (sem data de término)
ORDER BY salario DESC
LIMIT 5;  -- Limita o número de registros retornados a 5, ou seja, apenas os 5 registros com maior salário

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * from Colaboradores
WHERE nome like 'Isadora%'; -- like é o comando que puxa o dado que seja mais ou menos parecido com a busca e % signnifica que tem um texto após a palavra.

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM CargosColaboradores
WHERE cargo = 'Professor'
AND datatermino NOTNULL;  -- Filtra os registros onde a coluna 'datatermino' não é nula (ou seja, tem um valor).

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * 
FROM CargosColaboradores -- Define a tabela 'HistoricoEmprego' como a fonte de dados.
WHERE cargo = 'Oftalmologista' -- Filtra os registros onde o cargo é 'Oftalmologista'.
OR cargo = 'Dermatologista'; -- Ou filtra os registros onde o cargo é 'Dermatologista'

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * from CargosColaboradores
WHERE cargo  IN ('Oftalmologista', 'Dermatologista', 'Professor');

-- NOT IN traz todos os cargos excetos os que estão em ().

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM Treinamento
WHERE (curso like 'O direito%' and instituicao = 'da Rocha') -- Filtra os registros onde 'curso' começa com 'O direito' e 'instituicao' é 'da Rocha'.
OR (curso like 'O conforto%' and instituicao = 'das Neves'); -- Ou filtra os registros onde 'curso' começa com 'O conforto' e 'instituicao' é 'das Neves'.

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT mes, MAX (faturamento_bruto) FROM faturamento; -- MAX OR MIN --

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT SUM(numero_novos_clientes) AS 'Novos clientes 2023' -- Soma o total de novos clientes no ano de 2023 e atribui um alias para a coluna.
FROM faturamento
WHERE mes LIKE '%2023'; -- Filtra os registros onde a coluna 'mes' contém o texto '2023'. --

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT AVG(lucro_liquido) -- Calcula a média dos valores da coluna 'lucro_liquido'.--
FROM faturamento; --Define a tabela 'faturamento' como a fonte de dados.--

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT COUNT(*) FROM Licencas-- Conta o número total de registros onde o tipo de licença é 'férias'.
WHERE tipolicenca = 'férias'  -- Filtra os registros para incluir apenas aqueles onde 'tipolicenca' é igual a 'férias'.

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT parentesco, COUNT(*) FROM Dependentes
GROUP BY parentesco; -- Agrupa os resultados por valores únicos da coluna 'parentesco'.

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT instituicao, count(curso)
FROM Treinamento
GROUP by instituicao
WHERE COUNT(curso) > 2;

--COUNT em SQL é usada para contar o número de linhas ou valores em uma coluna.--

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT instituicao, count (curso)  -- Seleciona a instituição e conta os cursos
FROM Treinamento
GROUP by instituicao -- Agrupa os resultados por instituição
HAVING COUNT(curso) > 2; -- Filtra as instituições com mais de 2 cursos

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT cargo, COUNT(*) qtd
FROM HistoricoEmprego
GROUP BY cargo
HAVING qtd >=2;

--having Serve para filtrar os resultados agrupados e retornar apenas os grupos onde a contagem (qtd) seja maior ou igual a 2.

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT nome, LENGTH(cpf) qtd -- Seleciona o nome e o comprimento do CPF, renomeado como 'qtd'
FROM Colaboradores
WHERE qtd = 11; -- Filtra os registros onde o comprimento do CPF é igual a 11

SELECT COUNT(*), LENGTH(cpf) qtd -- Conta o número total de registros e obtém o comprimento do CPF, renomeado como 'qtd'
FROM Colaboradores
WHERE qtd = 11; 

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT ('A pessoa colaboradora ' || nome || ' de CPF ' || cpf || ' possui o seguinte endereço: ' || endereco) as texto -- Concatena informações do colaborador em uma única string, renomeada como 'texto'
FROM Colaboradores;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM Licencas;
SELECT id_colaborador, STRFTIME('%Y/%m', datainicio) -- Seleciona o ID do colaborador e formata a data de início no formato 'ano/mês'
FROM Licencas;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT id_colaborador, JULIANDAY (datatermino) - JULIANDAY (datacontratacao) -- Calcula a diferença em dias entre a data de término e a data de contratação para cada colaborador
FROM CargosColaboradores
WHERE datatermino is not NULL; -- Filtra apenas registros onde a data de término não é nula.

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT AVG(faturamento_bruto), ROUND (AVG(faturamento_bruto), 2) -- Calcula a média do faturamento bruto e a média arredondada com 2 casas decimais
FROM faturamento;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT floor(faturamento_bruto), floor(despesas) -- Aplica a função FLOOR para arredondar para baixo o valor do faturamento bruto e das despesas
-- ou você pode usar ceil para arredondar para cima, em vez de floor.
FROM faturamento;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT (' O faturamento bruto médio foi ' || cast (ROUND (AVG(faturamento_bruto),2) AS TEXT)) -- Concatena a frase com o valor do faturamento bruto médio arredondado para 2 casas decimais, convertido para texto
FROM faturamento;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT id_colaborador, cargo, salario,
CASE -- Inicia a cláusula CASE, que realiza uma avaliação condicional
WHEN salario < 3000 then  'Baixo'
WHEN salario BETWEEN 3000 and 6000 then 'Médio'
ELSE 'Alto' -- Se o salário for superior a 6000, retorna 'Alto'
END as categoria_salario -- Renomeia a coluna gerada como 'categoria_salario'
FROM CargosColaboradores;

-------------------------------------------------------------------------------------------------------------------------------------------------------------



