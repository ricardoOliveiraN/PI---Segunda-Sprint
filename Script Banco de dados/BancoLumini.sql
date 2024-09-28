CREATE DATABASE lumini;

USE lumini;

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeFantasia VARCHAR(45),
    cnpj VARCHAR(18),
    tamanhoEmpresa VARCHAR(7),
		CONSTRAINT chkTamanhoEmpresa
		CHECK (tamanhoEmpresa IN('Pequena', 'Média', 'Grande')), 
        -- receita operacional em milhão -> pequena: 0,36 - 4,8; média: 4,8 - 300; grande: 300 e além
	qtdHectares INT,
    cep VARCHAR(9),
    uf CHAR(2),
		CONSTRAINT chkUF
        CHECK (uf IN(
        'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 
        'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SE', 'SP', 'TO')),
        -- checando para apenas estados brasileiros válidos
    cidade VARCHAR(45),
    logradouro VARCHAR(45),
    complemento VARCHAR(45),
    statusCadastro VARCHAR(7),
		CONSTRAINT chkStatusCadastro
        CHECK (statusCadastro IN('ativo', 'inativo')),
	dtCriacao DATE,
	dtSaida DATE,
		CONSTRAINT chkDtSaida
        CHECK (dtSaida > dtCriacao) 
        -- data de criação deve ser obrigatoriamente antes que a data de inativação
);

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    senha VARCHAR (45), -- criptografada
    email VARCHAR(45),
		CONSTRAINT chkEmail
		CHECK (email LIKE '%@%' AND email LIKE '%.%'),
        -- checando se o formato de email é válido
    telefone VARCHAR(16),
    tipoUsuario VARCHAR(11),
		CONSTRAINT chkTipoUsuario
		CHECK (tipoUsuario IN('Responsável', 'Comum', 'Convidado')), /*
			permissionamento -> 
            responsável (pela empresa): adicionar/remover usuários, alterar filtros dos dash, visualizar dash;
			comum: alterar filtros dos dash, visualizar dash; 
            convidado (empresa terceira): visualizar dash */
	statusUsuario VARCHAR(7),
		CONSTRAINT chkStatusCadastro
        CHECK (statusCadastro IN('ativo', 'inativo')),
	dtCriacao DATE,
	dtExclusao DATE,
		CONSTRAINT chkDtSaida
        CHECK (dtSaida > dtExclusao),
        -- data de criação deve ser obrigatoriamente antes que a data de exclusão do usuário
    fkUsuario_Empresa INT,
		CONSTRAINT fkReUsuario_Empresa FOREIGN KEY (fkUsuario_Empresa)
		REFERENCES empresa(idEmpresa)
) AUTO_INCREMENT = 1000;

CREATE TABLE talhao (
	idTalhao INT PRIMARY KEY AUTO_INCREMENT,
    numero INT, -- para identificar os talhoes dentro de uma mesma empresa
    areaTalhao INT, -- em metros quadrados
    fkTalhao_Empresa INT,
		CONSTRAINT fkReTalhao_Empresa FOREIGN KEY (fkTalhao_Empresa)
		REFERENCES empresa(idEmpresa)
) AUTO_INCREMENT = 100;

CREATE TABLE sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    statusFuncionamento VARCHAR(10),
		CONSTRAINT chkStatusFuncionamento
		CHECK (statusFuncionamento IN('Ativo', 'Inativo', 'Manutenção')),
    dtInstalacao DATE,
    dtUltimaManutencao DATE,
		CONSTRAINT chkUltimaManutencao
        CHECK (dtUltimaManutencao >= dtInstalacao), 
        -- data da última manuntenção deve ser obrigatoriamente depois da data de instalação
    fkSensor_Empresa INT,
		CONSTRAINT fkReSensor_Empresa FOREIGN KEY (fkSensor_Empresa)
		REFERENCES empresa(idEmpresa),
    fkSensor_Talhao INT,
		CONSTRAINT fkReSensor_Talhao FOREIGN KEY (fkSensor_Talhao)
		REFERENCES talhao(idTalhao)
) AUTO_INCREMENT 10000;

CREATE TABLE dadosSensor (
	idDadosSensor INT PRIMARY KEY AUTO_INCREMENT,
    qtdLuz INT,
		CONSTRAINT chkQtdLuz
        CHECK (qtdLuz >= 0), 
        -- a luminosidade, vinda da voltagem, captada pelo sensor não deve ser negativa
	statusLuminosidade VARCHAR(12),
		CONSTRAINT chkStatusLuminosidade
		CHECK (statusLuminosidade IN('Satisfatória', 'Baixa', 'Crítica')),
        -- luminosidade -> crítica: abaixo de 0,2 lux; baixa: 0,2 - 30 lux; satisfatória 30 - 50 lux;
    alerta CHAR(3),
		CONSTRAINT chkAlerta
        CHECK (alerta IN('Sim', 'Não')),
        -- se houve alerta ou não
    momentoCaptura DATETIME,
    fkDadosSensor_Sensor INT,
		CONSTRAINT fkReDadosSensor_Sensor FOREIGN KEY (fkDadosSensor_Sensor)
		REFERENCES sensor(idSensor)
);

INSERT INTO empresa (nomeFantasia, cnpj, tamanhoEmpresa, qtdHectares, cep, uf, cidade, logradouro, complemento, statusCadastro, dtCriacao, dtSaida) VALUES
	('Agrosil', '12.345.678/0001-90', 'Pequena', 15, '12345-678', 'SP', 'Vale do Ribeira', 'Rua das Flores', 'Casa 1', 'ativo', '2024-08-20', 2023-09-01),
	('LúFazendas', '23.456.789/0001-01', 'Média', 20, '23456-789', 'RS', 'Serra Gaúcha', 'Avenida da Paz', 'Lote 10', 'ativo', '2024-08-30', NULL),
	('Lúpulo da Terra',  '45.678.901/0001-23', 'Grande', 500, '45678-901', 'SP', 'Campos do Jordão', 'Rua do Lúpulo', 'Chácara 2', 'ativo', '2024-09-05', NULL);

INSERT INTO usuario (nome, senha, email, telefone, tipoUsuario, statusUsuario ,dtCriacao, dtExclusao, fkUsuario_Empresa) VALUES
	('João Silva', MD5('Sol!123'), 'joao.silva@email.com', '11987654321', 'Responsável', 'inativo','2024-08-30','2023-09-01', 1),
	('Maria Oliveira', MD5('Céu@456'), 'maria.oliveira@email.com', '21987654321', 'Comum', 'ativo','2024-08-30', null, 2),
	('Carlos Souza', MD5('Floresta#789'), 'carlos.souza@email.com', '31987654321', 'Responsável', 'ativo','2024-08-30', null, 3),
	('Ana Pereira', MD5('Mar$3Clamo'), 'ana.pereira@email.com', '41987654321', 'Comum', 'ativo','2024-08-30', null, 3),
	('Ricardo Lima', MD5('Lua%8Cheia'), 'ricardo.lima@email.com', '51987654321', 'Convidado', 'inativo','2024-08-30', '2024-09-30', 3);
    
INSERT INTO talhao (numero, areaTalhao, fkTalhao_Empresa) VALUES
	(1, 5000, 1),
	(1, 75000, 2),
	(2, 150000, 2),
	(1, 60000, 3),
	(2, 120000, 3),
	(3, 300000, 3);

INSERT INTO sensor (statusFuncionamento, dtInstalacao, dtUltimaManutencao, fkSensor_Empresa, fkSensor_Talhao) VALUES
	('Inativo', '2024-09-05', '2024-09-20', 1, 1), 
	('Inativo', '2024-09-05', null, 1, 2), 
	('Manutenção', '2024-09-08', null, 2, 3), 
	('Ativo', '2024-09-10', '2024-09-12', 3, 4),
	('Inativo', '2024-09-20', null, 2, 5),
	('Ativo', '2024-09-20', null, 3, 6), 
	('Ativo', '2024-09-21', null, 2, 2),
	('Ativo', '2024-09-30', null, 3, 3); 
    

