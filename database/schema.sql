CREATE TABLE clientes(
	id_cliente SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE,
	senha VARCHAR(100) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	data_de_nascimento DATE NOT NULL,
	data_de_cadastro TIMESTAMP NOT NULL,
	status_da_conta VARCHAR(10)
);

CREATE TABLE enderecos(
	id_cliente INT NOT NULL,
	id_endereco SERIAL NOT NULL PRIMARY KEY,
	CONSTRAINT FK_id_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	rua VARCHAR(100) NOT NULL,
	numero VARCHAR(10) NOT NULL,
	bairro VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	estado CHAR(2) NOT NULL,
	cep VARCHAR(8) NOT NULL,
	complemento VARCHAR(100),
	tipo_de_endereco VARCHAR(100) NOT NULL
);

CREATE TABLE categorias(
id_categorias SERIAL NOT NULL PRIMARY KEY,
nome_categoria VARCHAR(50) NOT NULL 
);

CREATE TABLE produtos(
	id_categoria INT NOT NULL,
	id_produtos SERIAL NOT NULL PRIMARY KEY, 
	CONSTRAINT FK_id_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categorias),
	nome VARCHAR(100) NOT NULL,
	descricao VARCHAR(300) NOT NULL,
	preco NUMERIC(10,2) NOT NULL,
	quantidade_em_estoque SMALLINT NOT NULL,
	peso NUMERIC(4) NOT NULL,
	marca VARCHAR(50) NOT NULL,
	sku VARCHAR(15) NOT NULL UNIQUE,
	data_de_cadastro TIMESTAMP NOT NULL,
	status VARCHAR(10) 
	);

CREATE TABLE imagem_dos_produtos(
	id_imagem_dos_produtos SERIAL NOT NULL PRIMARY KEY,
	id_produtos INT NOT NULL,
	CONSTRAINT FK_id_produtos FOREIGN KEY (id_produtos) REFERENCES produtos(id_produtos),
	url_da_imagem VARCHAR(100) NOT NULL,
	ordem_de_exibicao CHAR(1) NOT NULL,
	imagem_principal BOOLEAN NOT NULL
);

CREATE TABLE carrinhos(
	id_carrinho SERIAL NOT NULL PRIMARY KEY,
	id_cliente INT NOT NULL,
	data_da_criacao TIMESTAMP,
	status VARCHAR(10),
	CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)	
);

CREATE TABLE itens_do_carrinho(
	id_itens_carrinho SERIAL NOT NULL PRIMARY KEY,
	id_carrinho INT NOT NULL,
	id_produto INT NOT NULL,
	quantidade SMALLINT NOT NULL,
	preco_no_momento NUMERIC (10,2) NOT NULL,
	CONSTRAINT FK_id_carrinho FOREIGN KEY (id_carrinho) REFERENCES carrinhos(id_carrinho),
	CONSTRAINT FK_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produtos)
);

CREATE TABLE pedidos(
	id_pedidos SERIAL NOT NULL PRIMARY KEY,
	id_cliente INT NOT NULL,
	data_do_pedido TIMESTAMP NOT NULL,
	status VARCHAR(20) NOT NULL,
	valor_total NUMERIC (10,2) NOT NULL,
	frete NUMERIC (10,2) NOT NULL,
	desconto NUMERIC (10,2) NOT NULL,
	forma_de_pagamento VARCHAR(30) NOT NULL,
	CONSTRAINT FK_id_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_do_pedido(
	id_itens_do_pedido SERIAL NOT NULL PRIMARY KEY,
	id_pedido INT NOT NULL,
	id_produto INT NOT NULL,
	quantidade SMALLINT NOT NULL,
	preco_unitario NUMERIC (10,2) NOT NULL,
	desconto_aplicado NUMERIC (10,2) NOT NULL,
	CONSTRAINT FK_id_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produtos),
	CONSTRAINT FK_id_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedidos)
);

CREATE TABLE pagamentos(
	id_pagamento SERIAL NOT NULL PRIMARY KEY,
	id_pedido INT NOT NULL,
	valor_pago NUMERIC(10,2) NOT NULL,
	data_do_pagamento TIMESTAMP NOT NULL,
	metodo_de_pagamento VARCHAR(10) NOT NULL,
	status VARCHAR(20),
	CONSTRAINT FK_id_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedidos)
);

CREATE TABLE entregas(
	id_entrega SERIAL NOT NULL PRIMARY KEY,
	id_pedido INT NOT NULL,
	id_transportadora INT NOT NULL,
	codigo_de_rastreio VARCHAR(10) NOT NULL,
	status_da_entrega VARCHAR(20) NOT NULL,
	data_de_envio TIMESTAMP NOT NULL,
	data_de_entrega TIMESTAMP NOT NULL,
	CONSTRAINT FK_id_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedidos),
	CONSTRAINT FK_transportadora FOREIGN KEY (id_transportadora) REFERENCES transportadoras(id_transportadora)
);

CREATE TABLE transportadoras (
	id_transportadora SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL UNIQUE,
	telefone VARCHAR(20) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE avaliacao(
	id_avaliacao SERIAL NOT NULL PRIMARY KEY,
	id_cliente INT NOT NULL,
	id_produto INT NOT NULL,
	nota SMALLINT NOT NULL,
	comentario VARCHAR(1500) NOT NULL,
	data_avaliacao TIMESTAMP NOT NULL,
	CONSTRAINT FK_id_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	CONSTRAINT FK_id_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produtos)
);

CREATE TABLE cupons(
	id_cupom SERIAL NOT NULL PRIMARY KEY,
	codigo VARCHAR(10) NOT NULL UNIQUE,
	tipo_do_desconto VARCHAR(20) NOT NULL,
	valor_do_desconto NUMERIC(10,2) NOT NULL,
	data_de_validade DATE NOT NULL,
	quantidade_maxima_uso SMALLINT NOT NULL,
	status_cupom BOOLEAN NOT NULL
);

CREATE TABLE historico_de_precos(
	id_historico_de_preco SERIAL NOT NULL PRIMARY KEY,
	id_produto INT NOT NULL,
	preco_antigo NUMERIC (10,2) NOT NULL,
	preco_novo NUMERIC (10,2) NOT NULL,
	data_da_alteracao TIMESTAMP NOT NULL,
	CONSTRAINT FK_id_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produtos)
);

CREATE TABLE usuarios_administrativos(
	id_administrador SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	senha VARCHAR(255) NOT NULL,
	cargo VARCHAR(80) NOT NULL,
	nivel_de_acesso VARCHAR(100) NOT NULL,
	status_administrador BOOLEAN NOT NULL
);

CREATE TABLE logs_de_sistema(
	id_log SERIAL NOT NULL PRIMARY KEY,
	id_administrador INT NOT NULL,
	tipo_acao VARCHAR(50) NOT NULL,
	entidade_afetada VARCHAR(50) NOT NULL,
	id_referencia INT NOT NULL,
	descricao VARCHAR(500) NOT NULL,
	data_log TIMESTAMP NOT NULL,
	CONSTRAINT FK_id_administrador FOREIGN KEY (id_administrador)
	REFERENCES usuarios_administrativos(id_administrador)
);