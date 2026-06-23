/*
eu sinto que seria melhor colocar a categoria como uma tabela propria e colocar ela dentro do produto, assim tendo poucas categs que se usam em varios produtos, mas eu acredito que pelo nome da tabela esse nao era o plano.
*/
create table Produto(
	id_produto int primary key not null,
	nome varchar(20) not null,
	valor_custo numeric(10,2) not null,
	preco_venda numeric(10,2) not null
);
create table ProdutoCategoria(
	id_categoria int primary key not null,
	id_produto int not null,
	nome_categoria varchar(30)
);
create table ProdutoEstoque(
	id_produto int not null,
	quantidade int not null,
	data_atualizacao datetime default getdate(),
	foreign key (id_produto) references Produto(id_produto)
);

insert into Produto(id_produto, nome, valor_custo, preco_venda) values
(1,'Smartphone',200,400),
(2,'Cafe',5,10),
(3,'Arroz',4,10),
(4,'Desodorante',2,3),
(5,'Televisao',150,450),
(6,'Liquidificador',50,95.10),
(7,'Ibuprofeno',0.34,0.30),
(8,'Violao',20,780),
(9,'Camiseta',50.00);

insert into ProdutoCategoria(id_categoria,id_produto,nome_categoria) values
(1,1,'Eletronicos'),
(2,2,'Alimentos'),
(3,3,'Alimentos'),
(4,4,'Cosmeticos'),
(5,5,'Eletronicos'),
(6,6,'Eletronicos'),
(7,7,'Drogas'),
(8,8,'Instrumentos'),
(9,9,'Roupas');

insert into produtoEstoque (id_produto, quantidade) values
(1,100),
(2,56),
(3,133),
(4,14),
(5,15),
(6,76),
(7,1050),
(8,14040),
(9,500);

-- exercicio 1

select p.nome, pc.nome_categoria, pe.quantidade from produto p 
join produtocategoria pc on pc.id_produto = p.id_produto
join produtoestoque pe on pe.id_produto = p.id_produto;

-- exercicio 2

delete p from produto p 
inner join produtocategoria pc on pc.id_produto = p.id_produto
where pc.nome_categoria = 'roupas';
-----------------------

--tabela necessaria para ex3

create table clientes(
	id_cliente int not null primary key,
	titulo varchar(10),
	nome_primeiro varchar(20) not null,
	nome_meio varchar(20),
	nome_ultimo varchar(20) not null
);

insert into clientes(id_cliente, titulo, nome_primeiro, nome_meio, nome_ultimo) values
(1,'Senhor','Michael','Hue','Jackson'),
(2,'Sra.','Ferdinanda','Pereira','Paz');


insert into clientes(id_cliente, nome_primeiro, nome_ultimo) values
(3,'Jose','Silva'),
(4,'Marcos','Trobbo');


insert into clientes(id_cliente, titulo, nome_primeiro, nome_ultimo) values
(5,'Doutor','Michael','Jackson'),
(6,'Majestade','Pedro','Braganca');


insert into clientes(id_cliente, nome_primeiro, nome_meio, nome_ultimo) values
(7,'Franz','Ludwig','Ferdinand'),
(8,'Pedro','de Alcantara','Gonzaga');

--ex 3
select concat(case when titulo is not null then titulo + ' ' else '' end,
	nome_primeiro, 
	case when nome_meio is not null then ' ' + nome_meio else '' end,
	' ', 
	nome_ultimo) NomeCompleto
from clientes;
