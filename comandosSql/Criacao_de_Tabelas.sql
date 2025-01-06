-- Criação da tabela 'tabelaprodutos', que armazena informações sobre os produtos
CREATE TABLE tabelaprodutos (
  
  -- A coluna 'ID_Produto' é a chave primária (única) para cada produto
  ID_Produto INT PRIMARY KEY,
  
  -- A coluna 'nome_do_Produto' armazena o nome do produto (até 250 caracteres)
  nome_do_Produto VARCHAR(250),
  
  -- A coluna 'Descrição' armazena uma descrição do produto em formato de texto
  Descrição TEXT,
  
  -- A coluna 'Categoria' armazena o ID da categoria do produto, que será uma referência à tabela 'tabelacategorias'
  Categoria INT,
  
  -- A coluna 'Preço_de_Compra' armazena o preço de compra do produto (formato DECIMAL para valores com duas casas decimais)
  Preço_de_Compra DECIMAL(10,2),
  
  -- A coluna 'Unidade' armazena a unidade de medida do produto (exemplo: unidade, quilo, litro, etc.)
  Unidade VARCHAR(50),
  
  -- A coluna 'Fornecedor' armazena o ID do fornecedor do produto, que será uma referência à tabela 'tabelafornecedores'
  Fornecedor INT,
  
  -- A coluna 'Data_de_Inclusao' armazena a data de inclusão do produto na tabela
  Data_de_Inclusao DATE,

  -- Definindo a chave estrangeira (foreign key) para a coluna 'Categoria', referenciando a tabela 'tabelacategorias' 
  FOREIGN KEY (Categoria) REFERENCES tabelacategorias(id_categoria),
  
  -- Definindo a chave estrangeira (foreign key) para a coluna 'Fornecedor', referenciando a tabela 'tabelafornecedores'
  FOREIGN KEY (Fornecedor) REFERENCES tabelafornecedores(id)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Criação da tabela 'tabelacategorias', que armazena informações sobre as categorias de produtos
CREATE TABLE tabelacategorias (
  
  -- A coluna 'ID_Categoria' é a chave primária (única) para cada categoria
  ID_Categoria INT PRIMARY KEY,           -- Chave primária para identificar a categoria
  
  -- A coluna 'Nome_Categoria' armazena o nome da categoria (até 250 caracteres)
  Nome_Categoria VARCHAR(250),            -- Nome da categoria
  
  -- A coluna 'Descricao_Categoria' armazena uma descrição da categoria (em texto livre)
  Descricao_Categoria TEXT               -- Descrição da categoria
  
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Criação da tabela 'tabelapedidosgold', que armazena informações sobre os pedidos de clientes
CREATE TABLE tabelapedidosgold (
  
  -- A coluna 'ID_pedido_gold' é a chave primária, única para cada pedido
  ID_pedido_gold INT PRIMARY KEY,                       
  
  -- A coluna 'Data_Do_Pedido_gold' armazena a data em que o pedido foi feito
  Data_Do_Pedido_gold DATE,                              
  
  -- A coluna 'Status_gold' armazena o status atual do pedido (por exemplo, 'Em andamento', 'Concluído', etc.)
  Status_gold VARCHAR(50),                               
  
  -- A coluna 'Total_Do_Pedido_gold' armazena o total do pedido (valor com 2 casas decimais)
  Total_Do_Pedido_gold DECIMAL(10, 2),                  

  -- A coluna 'Cliente_gold' armazena o ID do cliente que fez o pedido (referência à tabela 'tabelaclientes')
  Cliente_gold INT,                                     
  
  -- A coluna 'Data_De_Envio_Estimada_gold' armazena a data estimada para envio do pedido
  Data_De_Envio_Estimada_gold DATE,                      
  
  -- Definindo a chave estrangeira (foreign key) para a coluna 'Cliente_gold', que faz referência à tabela 'tabelaclientes'
  FOREIGN KEY (Cliente_gold) REFERENCES tabelaclientes(id_cliente)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
