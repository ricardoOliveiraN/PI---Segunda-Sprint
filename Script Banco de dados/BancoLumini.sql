CREATE DATABASE lumini;

USE lumini;

CREATE TABLE empresa (
	idEmpresa INT,
    dtCriacao DATE,
    nomeFantasia VARCHAR(45),
    cnpj VARCHAR(18),
    tamanhoEmpresa VARCHAR(45),
		CONSTRAINT chkTamanhoEmpresa
		CHECK (tamanhoEmpresa IN('Pequena', 'Média', 'Grande')), -- receita operacional em milhão -> pequena: 0,36 - 4,8; média: 4,8 - 300; grande: 300 e além
    dtSaida DATE,
		CONSTRAINT chkDtSaida
        CHECK (dtSaida > dtCriacao),
    cep VARCHAR(9),
    uf CHAR(2),
		CONSTRAINT chckEstado 
        CHECK (estado IN(
        'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 
        'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SE', 'SP', 'TO')),
    cidade VARCHAR(45),
    logradouro VARCHAR(45),
    complemento VARCHAR(45),
    qtdHectares INT,
    statusCadastro VARCHAR(7),
		CONSTRAINT chkEstado
        CHECK (statusCadastro IN('ativo', 'inativo')),
    dataSaida DATE
);

CREATE TABLE usuario (
	idUsuario INT,
    dtCriacao DATE,
    nome VARCHAR(45),
    senha VARCHAR (45),
    email VARCHAR(45),
    telefone VARCHAR(16),
    tipoUsuario VARCHAR(9),
    fkEmpresa_Usuario INT
);

CREATE TABLE talhao (
	idTalhao INT,
    numero INT,
    areaTalhao INT,
    fkEmpresa_Talhao INT
);

CREATE TABLE sensor (
	idSensor INT,
    talhao INT,
    statusFuncionamento VARCHAR(11),
    dtInstalacao DATE,
    dtUltimaManutencao DATE,
    fkEmpresa_Sensor INT,
    fkTalhao_Sensor INT
);

CREATE TABLE dadosSensor (
	idDadosSensor INT,
    qtdLuz INT,
    momentoCaptura DATETIME,
    statusLuminosidade VARCHAR(12),
    fkSensor_DadosSensor INT
);