/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
10 de junho de 2024 (2024-06-10), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE IF NOT EXISTS aulas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT,
    titulo VARCHAR(100) NOT NULL,
    conteudo TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

CREATE TABLE IF NOT EXISTS materiais_estudo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aula_id INT,
    tipo VARCHAR(50),
    link TEXT,
    descricao TEXT,
    FOREIGN KEY (aula_id) REFERENCES aulas(id)
);

CREATE TABLE IF NOT EXISTS avaliacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT,
    pergunta TEXT,
    resposta_correta TEXT,
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

CREATE TABLE IF NOT EXISTS respostas_alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    avaliacao_id INT,
    usuario_id INT,
    resposta TEXT,
    correta BOOLEAN,
    FOREIGN KEY (avaliacao_id) REFERENCES avaliacoes(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE IF NOT EXISTS progresso_alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    curso_id INT,
    progresso INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

CREATE TABLE IF NOT EXISTS comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aula_id INT,
    usuario_id INT,
    comentario TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (aula_id) REFERENCES aulas(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);