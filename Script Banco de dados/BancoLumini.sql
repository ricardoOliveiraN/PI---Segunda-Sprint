CREATE DATABASE lumini;

USE lumini;

CREATE TABLE empresa (
	idEmpresa INT,
    dtCriacao DATE,
    nomeFantasia VARCHAR(45),
    cnpj VARCHAR(18),
    tamanhoEmpresa VARCHAR(45),
    dtSaida DATE,
    cep VARCHAR(9),
    uf CHAR(2),
    cidade VARCHAR(45),
    logradouro VARCHAR(45),
    complemento VARCHAR(45),
    qtdHectares INT,
    statusCadastro VARCHAR(7),
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