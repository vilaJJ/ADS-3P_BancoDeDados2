/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
06 de maio de 2024 (2024-05-06), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

CREATE TABLE IF NOT EXISTS Autores (
    AutorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Editoras (
    EditoraID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Livros (
    LivroID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    AnoPublicacao YEAR,
    AutorID INT,
    EditoraID INT,
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (EditoraID) REFERENCES Editoras(EditoraID)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Usuarios (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Emprestimos (
    EmprestimoID INT AUTO_INCREMENT PRIMARY KEY,
    LivroID INT,
    UsuarioID INT,
    DataEmprestimo DATE,
    DataDevolucao DATE,
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
        ON DELETE SET NULL ON UPDATE CASCADE
);
