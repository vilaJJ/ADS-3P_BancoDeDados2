CREATE TABLE Departamentos(
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Departamentos PRIMARY KEY(Codigo)
);

CREATE TABLE Projetos(
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Departamento_Codigo INT NOT NULL,
    CONSTRAINT PK_Projetos PRIMARY KEY(Codigo),
    CONSTRAINT FK_Projetos_Departamentos FOREIGN KEY(Departamento_Codigo) REFERENCES Departamentos(Codigo)
);

CREATE TABLE Colaboradores(
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Salario DECIMAL(6,2) NOT NULL,
    Departamento_Codigo INT NOT NULL,
    CONSTRAINT PK_Colaboradores PRIMARY KEY(Codigo),
    CONSTRAINT FK_Colaboradores_Departamentos FOREIGN KEY(Departamento_Codigo) REFERENCES Departamentos(Codigo)
);

CREATE TABLE Trabalhos(
    Colaborador_Codigo INT NOT NULL,
    Projeto_Codigo INT NOT NULL,
    HorasSemanais INT NOT NULL,
    CONSTRAINT PK_Trabalhos PRIMARY KEY(Colaborador_Codigo, Projeto_Codigo),
    CONSTRAINT FK_Trabalhos_Colaboradores FOREIGN KEY(Colaborador_Codigo) REFERENCES Colaboradores(Codigo),
    CONSTRAINT FK_Trabalhos_Projetos FOREIGN KEY(Projeto_Codigo) REFERENCES Projetos(Codigo)
);