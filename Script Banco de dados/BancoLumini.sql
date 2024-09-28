CREATE DATABASE lumini;

USE lumini;

CREATE TABLE empresa (
	idEmpresa INT,
    nomeFantasia VARCHAR(45),
    cnpj VARCHAR(18),
    tamanhoEmpresa VARCHAR(45),
		CONSTRAINT chkTamanhoEmpresa
		CHECK (tamanhoEmpresa IN('Pequena', 'Média', 'Grande')), -- receita operacional em milhão -> pequena: 0,36 - 4,8; média: 4,8 - 300; grande: 300 e além
	qtdHectares INT,
    cep VARCHAR(9),
    uf CHAR(2),
		CONSTRAINT chckEstado 
        CHECK (estado IN(
        'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 
        'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SE', 'SP', 'TO')),
    cidade VARCHAR(45),
    logradouro VARCHAR(45),
    complemento VARCHAR(45),
    statusCadastro VARCHAR(7),
		CONSTRAINT chkEstado
        CHECK (statusCadastro IN('ativo', 'inativo')),
	dtCriacao DATE,
	dtSaida DATE,
		CONSTRAINT chkDtSaida
        CHECK (dtSaida > dtCriacao) -- data de criação deve ser obrigatoriamente antes que a data de inativação
);

CREATE TABLE usuario (
	idUsuario INT,
    nome VARCHAR(45),
    senha VARCHAR (45),
    email VARCHAR(45),
    telefone VARCHAR(16),
    tipoUsuario VARCHAR(9),
		CONSTRAINT chkTipoUsuario
		CHECK (tipoUsuario IN('Responsável', 'Comum', 'Convidado')),
	dtCriacao DATE,
    fkUsuario_Empresa INT,
		CONSTRAINT fkReUsuario_Empresa FOREIGN KEY (fkUsuario_Empresa)
		REFERENCES empresa(idEmpresa)
);

CREATE TABLE talhao (
	idTalhao INT,
    numero INT,
    areaTalhao INT,
    fkTalhao_Empresa INT,
		CONSTRAINT fkReTalhao_Empresa FOREIGN KEY (fkTalhao_Empresa)
		REFERENCES empresa(idEmpresa)
);

CREATE TABLE sensor (
	idSensor INT,
    statusFuncionamento VARCHAR(10),
		CONSTRAINT chkStatusFuncionamento
		CHECK (statusFuncionamento IN('Ativo', 'Inativo', 'Manutenção')),
    dtInstalacao DATE,
    dtUltimaManutencao DATE,
		CONSTRAINT chkUltimaManutencao
        CHECK (dtUltimaManutencao >= dtInstalacao), -- data da última manuntenção deve ser obrigatoriamente depois da data de instalação
    fkSensor_Empresa INT,
		CONSTRAINT fkReSensor_Empresa FOREIGN KEY (fkSensor_Empresa)
		REFERENCES empresa(idEmpresa),
    fkSensor_Talhao INT,
		CONSTRAINT fkReSensor_Talhao FOREIGN KEY (fkSensor_Talhao)
		REFERENCES empresa(idTalhao)
);

CREATE TABLE dadosSensor (
	idDadosSensor INT,
    qtdLuz INT,
	statusLuminosidade VARCHAR(12),
    alerta CHAR(3),
    momentoCaptura DATETIME,
    fkDadosSensor_Sensor INT
);