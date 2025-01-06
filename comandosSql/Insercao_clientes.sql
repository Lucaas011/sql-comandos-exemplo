-- Inserção de dados na tabela 'tabelaclientes', que armazena informações dos clientes

-- O comando abaixo insere novos registros na tabela 'tabelaclientes'
INSERT INTO tabelaclientes 
  (id_cliente, nome_cliente, informacoes_de_contato, endereco_cliente)  -- Definindo as colunas que receberão os dados
VALUES
  -- Inserindo os dados de cada cliente, com o formato: 
  -- ('id_cliente', 'nome_cliente', 'informacoes_de_contato', 'endereco_cliente')
  ('1', 'Ana Silva', 'ana.silva@email.com', 'Rua flores - casa 1'),  -- Dados do Cliente 1
  ('2', 'Joao Santos', 'joao.santos@provedor', 'Rua dos pinheiros, 25'), -- Dados do Cliente 2
  ('3', 'Maria Fernandes', 'maria.fernandes@email.com', 'Rua Santo Antonio, 10'), -- Dados do Cliente 3
  ('4', 'Carlos Pereira', 'carlos.pereira@email.com', 'Avenida rio, 67'); -- Dados do Cliente 4

-- Após a inserção dos dados, é realizada uma consulta para exibir todos os registros da tabela 'tabelaclientes'
-- Isso permite verificar se os dados foram inseridos corretamente
SELECT * FROM tabelaclientes;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Inserindo dados na tabela 'tabelapedidosgold' a partir de dados na tabela 'tabelapedidos'
INSERT INTO tabelapedidosgold
(
  id_pedido_gold,             -- ID do pedido na nova tabela 'tabelapedidosgold'
  data_do_pedido_gold,        -- Data do pedido
  status_gold,                -- Status do pedido (por exemplo, "concluído", "pendente")
  total_do_pedido_gold,       -- Valor total do pedido
  cliente_gold,               -- ID do cliente que fez o pedido
  data_de_envio_estimada_gold -- Data estimada para o envio do pedido
)
-- Selecionando os dados da tabela 'tabelapedidos' para inserir na 'tabelapedidosgold'
SELECT
  id,                         -- Selecionando o ID do pedido
  data_do_pedido,             -- Selecionando a data do pedido
  status,                     -- Selecionando o status do pedido
  total_do_pedido,            -- Selecionando o valor total do pedido
  cliente,                    -- Selecionando o ID do cliente do pedido
  data_de_envio_estimada     -- Selecionando a data estimada de envio do pedido
FROM tabelapedidos            -- A partir da tabela 'tabelapedidos'
WHERE total_do_pedido >= 400; -- Apenas insere os pedidos cujo valor total é maior ou igual a 400

-- Selecionando todos os dados da tabela 'tabelapedidosgold' para verificar a inserção
SELECT * FROM tabelapedidosgold; -- Exibe todos os registros da tabela 'tabelapedidosgold' após a inserção

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Atualiza os dados da tabela 'tabelaclientes' para o cliente com id_cliente = 1
UPDATE tabelaclientes
SET 
  informacoes_de_contato = 'ana.jane@email.com',  -- Atualiza o e-mail do cliente
  endereco_cliente = 'Rua dos paralelepípedos, 30' -- Atualiza o endereço do cliente
WHERE id_cliente = 1;  -- Aplica a atualização apenas para o cliente com id_cliente igual a 1

-- Seleciona todos os dados da tabela 'tabelaclientes' para verificar as atualizações realizadas
SELECT * FROM tabelaclientes;

