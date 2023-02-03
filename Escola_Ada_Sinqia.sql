USE Escola_Ada_Sinqia;

--Professor (cod_prof, nome, endereco, cep, cidade, uf);

CREATE TABLE Professor (
	cod_prof INT NOT NULL IDENTITY(1,1), 
	nome VARCHAR(100) NOT NULL, 
	endereco VARCHAR(100) NOT NULL, 
	cep VARCHAR(10) NOT NULL, 
	cidade VARCHAR(40) NULL, 
	uf CHAR(2) NULL,
	CONSTRAINT PK_cod_prof PRIMARY KEY (cod_prof)
);

--Aluno (cod_alun, nome, endereco, cep, cidade, uf);

CREATE TABLE Aluno (
	cod_alun INT NOT NULL IDENTITY(1,1), 
	nome VARCHAR(100) NOT NULL, 
	endereco VARCHAR(100) NOT NULL, 
	cep VARCHAR(10) NOT NULL, 
	cidade VARCHAR(40) NULL, 
	uf CHAR(2) NULL,
	CONSTRAINT PK_cod_alun PRIMARY KEY (cod_alun)
);

--Disciplina (cod_disc, nome, curso, qtd_aulas);

CREATE TABLE Disciplina (
	cod_disc INT NOT NULL IDENTITY(1,1), 
	nome VARCHAR(70) NOT NULL, 
	curso VARCHAR(70) NOT NULL, 
	qtd_aulas INT NULL
	CONSTRAINT PK_cod_disc PRIMARY KEY (cod_disc)
);

--Matrícula (cod_matri, cod_aluno, cod_disc, ano);

CREATE TABLE Matricula (
	cod_matri INT NOT NULL IDENTITY(1,1), 
	cod_aluno INT NOT NULL,
	cod_disc INT NOT NULL,
	ano INT NOT NULL,
	CONSTRAINT PK_cod_matri PRIMARY KEY (cod_matri),
	CONSTRAINT FK_cod_aluno FOREIGN KEY (cod_aluno)
		REFERENCES Aluno (cod_alun),
	CONSTRAINT FK_cod_disc FOREIGN KEY (cod_disc)
		REFERENCES Disciplina (cod_disc)
);

--Professor_Disciplina(cod_prof_disc, cod_disc, cod_prof, ano);

CREATE TABLE Professor_Disciplina (
	cod_prof_disc INT NOT NULL IDENTITY(1,1), 
	cod_disc INT NOT NULL,
	cod_prof INT NOT NULL,
	ano INT NOT NULL, 
	CONSTRAINT PK_cod_prof_disc PRIMARY KEY (cod_prof_disc),
	CONSTRAINT FK_cod_disc2 FOREIGN KEY (cod_disc)
		REFERENCES Disciplina (cod_disc),
	CONSTRAINT FK_cod_prof FOREIGN KEY (cod_prof)
		REFERENCES Professor (cod_prof)
);