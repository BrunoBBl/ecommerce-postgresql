INSERT INTO clientes
(nome, cpf, email, senha, telefone, data_de_nascimento, data_de_cadastro, status_da_conta)
VALUES
('João Silva', '12345678901', 'joao@email.com', 'hash123', '51999999999', '1998-05-10', NOW(), 'ativo'),

('Maria Souza', '98765432100', 'maria@email.com', 'hash456', '51988888888', '1995-08-20', NOW(), 'ativo');

INSERT INTO categorias
(nome_categoria)
VALUES
('Eletrônicos'),
('Games'),
('Informática'),
('Roupas');

INSERT INTO produtos
(id_categoria, nome, descricao, preco, quantidade_em_estoque, peso, marca, sku, data_de_cadastro, status)
VALUES
(1, 'Notebook Gamer', 'Notebook RTX 4060', 5999.90, 10, 2.5, 'Dell', 'NOTE001', NOW(), 'ativo'),

(2, 'PlayStation 5', 'Console Sony PS5', 4499.90, 5, 4.2, 'Sony', 'PS5001', NOW(), 'ativo'),

(3, 'Teclado Mecânico', 'Teclado RGB Switch Blue', 299.90, 20, 0.8, 'Redragon', 'TEC001', NOW(), 'ativo');

INSERT INTO imagem_dos_produtos
(id_produtos, url_da_imagem, ordem_de_exibicao, imagem_principal)
VALUES
(1, 'https://site.com/notebook.jpg', '1', true),

(2, 'https://site.com/ps5.jpg', '1', true),

(3, 'https://site.com/teclado.jpg', '1', true);

INSERT INTO carrinhos
(id_cliente, data_da_criacao, status)
VALUES
(1, NOW(), 'ativo'),

(2, NOW(), 'ativo');

INSERT INTO itens_do_carrinho
(id_carrinho, id_produto, quantidade, preco_no_momento)
VALUES
(1, 1, 1, 5999.90),

(1, 3, 2, 299.90),

(2, 2, 1, 4499.90);

INSERT INTO pedidos
(id_cliente, data_do_pedido, status, valor_total, frete, desconto, forma_de_pagamento)
VALUES
(1, NOW(), 'Pago', 6599.70, 50.00, 0.00, 'PIX'),

(2, NOW(), 'Pendente', 4499.90, 30.00, 100.00, 'Cartão');

INSERT INTO itens_do_pedido
(id_pedido, id_produto, quantidade, preco_unitario, desconto_aplicado)
VALUES
(1, 1, 1, 5999.90, 0.00),

(1, 3, 2, 299.90, 0.00),

(2, 2, 1, 4499.90, 100.00);

INSERT INTO pagamentos
(id_pedido, valor_pago, data_do_pagamento, metodo_de_pagamento, status)
VALUES
(1, 6599.70, NOW(), 'PIX', 'Aprovado'),

(2, 4399.90, NOW(), 'Cartão', 'Pendente');

INSERT INTO transportadoras
(nome, telefone, email)
VALUES
('Correios', '5133334444', 'contato@correios.com'),

('Jadlog', '5144445555', 'suporte@jadlog.com');

INSERT INTO entregas
(id_pedido, id_transportadora, codigo_de_rastreio, status_da_entrega, data_de_envio, data_de_entrega)
VALUES
(1, 1, 'BR12345678', 'Enviado', NOW(), NOW()),

(2, 2, 'JD98765432', 'Pendente', NOW(), NOW());

INSERT INTO avaliacao
(id_cliente, id_produto, nota, comentario, data_avaliacao)
VALUES
(1, 1, 5, 'Excelente notebook para jogos.', NOW()),

(2, 2, 4, 'Console muito bom.', NOW());

INSERT INTO cupons
(codigo, tipo_do_desconto, valor_do_desconto, data_de_validade, quantidade_maxima_uso, status_cupom)
VALUES
('BLACK10', 'PERCENTUAL', 10.00, '2027-12-31', 100, true),

('FRETE50', 'FIXO', 50.00, '2027-12-31', 50, true);

INSERT INTO usuarios_administrativos
(nome, email, senha, cargo, nivel_de_acesso, status_administrador)
VALUES
('Administrador Master', 'admin@ecommerce.com', 'hash_admin', 'Administrador', 'ADMIN', true),

('Carlos Ferreira', 'estoque@ecommerce.com', 'hash_estoque', 'Estoquista', 'ESTOQUE', true);

INSERT INTO logs_de_sistema
(id_administrador, tipo_acao, entidade_afetada, id_referencia, descricao, data_log)
VALUES
(1, 'PRODUTO_CRIADO', 'produtos', 1, 'Notebook Gamer criado no sistema', NOW()),

(1, 'PEDIDO_CANCELADO', 'pedidos', 2, 'Pedido cancelado por falta de pagamento', NOW()),

(2, 'ESTOQUE_ALTERADO', 'produtos', 3, 'Quantidade do produto alterada de 20 para 15', NOW());