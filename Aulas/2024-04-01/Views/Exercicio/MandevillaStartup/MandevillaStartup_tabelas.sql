/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
01 de abril de 2024 (2024-04-01), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

CREATE TABLE FuncoesUsuarios(
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(32) NOT NULL,
    CONSTRAINT PK_FuncoesUsuarios PRIMARY KEY(Codigo)
);

CREATE TABLE Usuarios(
    Codigo INT AUTO_INCREMENT,
    Email VARCHAR(320) NOT NULL,
    SenhaHash VARCHAR(255) NOT NULL,
    Nome VARCHAR(255) NOT NULL,
    Funcao_Codigo INT NOT NULL,
    DataCadastro DATETIME NOT NULL,
    CONSTRAINT PK_Usuarios PRIMARY KEY(Codigo),
    CONSTRAINT FK_Usuarios_FuncoesUsuarios FOREIGN KEY(Funcao_Codigo) REFERENCES FuncoesUsuarios(Codigo)
);

CREATE TABLE CategoriasProjetos(
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT NULL,
    CONSTRAINT PK_CategoriasProjetos PRIMARY KEY(Codigo)
);

CREATE TABLE Projetos(
    Codigo INT AUTO_INCREMENT,
    Usuario_Codigo INT NOT NULL,
    Titulo VARCHAR(50) NOT NULL,
    Descricao TEXT NOT NULL,
    Categoria_Codigo INT NULL,
    ValorDesejado DECIMAL(10,2) NOT NULL,
    ValorArrecadado DECIMAL(10,2) NULL,
    DataInicio DATE NOT NULL,
    DataFinalizacao DATE NOT NULL,
    CONSTRAINT PK_Projetos PRIMARY KEY (Codigo),
    CONSTRAINT FK_Projetos_Usuarios FOREIGN KEY(Usuario_Codigo) REFERENCES Usuarios(Codigo),
    CONSTRAINT FK_Projetos_CategoriasProjetos FOREIGN KEY(Categoria_Codigo) REFERENCES CategoriasProjetos(Codigo)
);

CREATE TABLE Investimentos(
    Codigo INT AUTO_INCREMENT,
    Projeto_Codigo INT NOT NULL,
    UsuarioInvestidor_Codigo INT NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    DataInvestimento DATE NOT NULL,
    CONSTRAINT PK_Investimentos PRIMARY KEY(Codigo),
    CONSTRAINT FK_Investimentos_Projetos FOREIGN KEY(Projeto_Codigo) REFERENCES Projetos(Codigo),
    CONSTRAINT FK_Investimentos_Usuarios FOREIGN KEY(UsuarioInvestidor_Codigo) REFERENCES Usuarios(Codigo)
);

CREATE TABLE AnalisesProjetos(
    Codigo INT AUTO_INCREMENT,
    Projeto_Codigo INT NOT NULL,
    UsuarioAvaliador_Codigo INT NOT NULL,
    Nota TINYINT NOT NULL,
    Comentarios TEXT NULL,
    DataAnalise DATE NOT NULL,
    CONSTRAINT PK_AnalisesProjetos PRIMARY KEY(Codigo),
    CONSTRAINT FK_AnalisesProjetos_Projetos FOREIGN KEY(Projeto_Codigo) REFERENCES Projetos(Codigo),
    CONSTRAINT FK_AnalisesProjetos_Usuarios FOREIGN KEY(UsuarioAvaliador_Codigo) REFERENCES Usuarios(Codigo)
);

CREATE TABLE Eventos(
    Codigo INT AUTO_INCREMENT,
    Titulo VARCHAR(50) NOT NULL,
    Descricao TEXT NULL,
    DataEvento DATETIME NOT NULL,
    Localizacao VARCHAR(255) NOT NULL,
    CONSTRAINT PK_Eventos PRIMARY KEY(Codigo)
);

CREATE TABLE TiposParticipantesEventos(
    Codigo INT AUTO_INCREMENT,
    Tipo VARCHAR(32) NOT NULL,
    CONSTRAINT PK_TiposParticipantesEventos PRIMARY KEY(Codigo)
);

CREATE TABLE ParticipantesEventos(
    Evento_Codigo INT NOT NULL,
    Usuario_Codigo INT NOT NULL,
    TipoParticipante_Codigo INT NOT NULL,
    CONSTRAINT PK_ParticipantesEventos PRIMARY KEY(Evento_Codigo, Usuario_Codigo),
    CONSTRAINT FK_ParticipantesEventos_Eventos FOREIGN KEY(Evento_Codigo) REFERENCES Eventos(Codigo),
    CONSTRAINT FK_ParticipantesEventos_Usuarios FOREIGN KEY(Usuario_Codigo) REFERENCES Usuarios(Codigo) 
);

CREATE TABLE InteressesInvestidores(
    Codigo INT AUTO_INCREMENT,
    UsuarioInvestidor_Codigo INT NOT NULL,
    CategoriaProjeto_Codigo INT NOT NULL,
    CONSTRAINT PK_InteressesInvestidores PRIMARY KEY(Codigo),
    CONSTRAINT FK_InteressesInvestidores_Usuarios FOREIGN KEY(UsuarioInvestidor_Codigo) REFERENCES Usuarios(Codigo),
    CONSTRAINT FK_InteressesInvestidores_CategoriasProjetos FOREIGN KEY(CategoriaProjeto_Codigo) REFERENCES CategoriasProjetos(Codigo)
);
