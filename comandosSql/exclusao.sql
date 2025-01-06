-- Deleta os fornecedores da tabela 'tabelafornecedores' cujo país de origem seja 'Turquia'
DELETE FROM tabelafornecedores
WHERE país_de_origem = 'Turquia';  -- Aplica a exclusão apenas aos fornecedores com o país de origem 'Turquia'

-- Seleciona todos os dados da tabela 'tabelafornecedores' para verificar as exclusões realizadas
SELECT * FROM tabelafornecedores;
