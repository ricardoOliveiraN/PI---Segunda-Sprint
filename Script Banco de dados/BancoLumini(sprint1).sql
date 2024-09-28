create database db_projeto_lumini;

use db_projeto_lumini;

create table usuario (
	idUsuario int primary key auto_increment,
    nome varchar(40),
    email varchar(254),
    telefone varchar(20),
    endereco varchar(255),
    qtdHectares int
);

insert into usuario (nome, email, telefone, endereco, qtdHectares) values
('João Silva', 'joao.silva@sptech.school', '11-987654321', 'Rua das Flores, 123, São Paulo, SP', 1),
('Maria Oliveira', 'maria.oliveira@sptech.school', '11-987654322', 'Avenida Paulista, 456, São Paulo, SP', 2),
('Carlos Pereira', 'carlos.pereira@sptech.school', '11-987654323', 'Rua dos Pinheiros, 789, Belo Horizonte, MG', 2),
('Ana Souza', 'ana.souza@sptech.school', '11-987654324', 'Rua das Palmeiras, 101, Rio de Janeiro, RJ', 1),
('Pedro Santos', 'pedro.santos@sptech.school', '11-987654325', 'Avenida Brasil, 202, Vitória, ES', 1);

select * from usuario;

select * from usuario where qtdHectares > 1;
select * from usuario where endereco like '%SP%';

alter table usuario rename to tb_usuario;

create table tb_dados_registrados (
	idRegistro int primary key auto_increment,
    dataHora datetime default current_timestamp,
    valorLuminosidade float,
    statusLuminosidade varchar(10),
    constraint chkStatusLuminosidade check (statusLuminosidade in ('Abaixo', 'Normal', 'Acima'))
);

insert into tb_dados_registrados (valorLuminosidade, statusLuminosidade) values
(887, 'Acima'),
(821, 'Acima'),
(780, 'Normal'),
(650, 'Normal'),
(410, 'Normal'),
(370, 'Abaixo'),
(260, 'Abaixo');

select * from tb_dados_registrados;

select * from tb_dados_registrados where statusLuminosidade = 'Acima';
select * from tb_dados_registrados where valorLuminosidade < 800;
select * from tb_dados_registrados where dataHora > '2024-09-08 00:00';

create table tb_alertas (
	idAlerta int primary key auto_increment,
    dataHora datetime default current_timestamp,
    tipoAlerta varchar(20),
    descricaoAlerta varchar(50)
);

alter table tb_alertas add constraint 
chkTipoAlerta check (tipoAlerta in ('Baixa luminosidade', 'Alta luminosidade'));
alter table tb_alertas add constraint 
chkDescricaoAlerta check (descricaoAlerta in ('O nivel de luminosidade está abaixo do esperado', 'O nivel de luminosidade está acima do esperado'));


insert into tb_alertas (tipoAlerta, descricaoAlerta) values 
('Abaixo', 'O nivel de luminosidade está abaixo do esperado'),
('Acima', 'O nivel de luminosidade está acima do esperado');

select * from tb_alertas;

alter table tb_alertas drop check chkTipoAlerta;
alter table tb_alertas drop check chkDescricaoAlerta;

truncate table tb_alertas;

alter table tb_alertas add constraint 
chkTipoAlerta check (tipoAlerta in ('Baixa luminosidade', 'Alta luminosidade', 'Sensor inativo'));
alter table tb_alertas add constraint 
chkDescricaoAlerta check (descricaoAlerta in ('O nivel de luminosidade está abaixo do esperado', 'O nivel de luminosidade está acima do esperado', 'O sensor não está enviando dados'));

insert into tb_alertas (tipoAlerta, descricaoAlerta) values 
('Baixa luminosidade', 'O nivel de luminosidade está abaixo do esperado'),
('Alta luminosidade', 'O nivel de luminosidade está acima do esperado'),
('Sensor inativo', 'O sensor não está enviando dados');

select * from tb_alertas;
