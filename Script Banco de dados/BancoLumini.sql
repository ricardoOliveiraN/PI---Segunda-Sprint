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
	dtCriacao DATE,
    fkUsuario_Empresa INT,
		CONSTRAINT fkReUsuario_Empresa FOREIGN KEY (fkUsuario_Empresa)
		REFERENCES empresa(idEmpresa)
) AUTO_INCREMENT = 1000;

CREATE TABLE talhao (
	idTalhao INT PRIMARY KEY AUTO_INCREMENT,
    numero INT,
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