CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE IF NOT EXISTS usuarios ( 
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    email TEXT UNIQUE NOT NULL,
	cpf TEXT UNIQUE NOT NULL,
    nome_usuario TEXT UNIQUE NOT NULL,
	senha TEXT NOT NULL,
	data_criacao TEXT DEFAULT CURRENT_TIMESTAMP,
	nivel_acesso INTEGER DEFAULT 1 
);

CREATE TABLE IF NOT EXISTS livros (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	num_chamada TEXT UNIQUE NOT NULL,
	titulo TEXT NOT NULL,
	autor TEXT NOT NULL,
	paginas INTEGER,
    isbn TEXT UNIQUE,
	publicacao TEXT, 
	assuntos TEXT
);

CREATE TABLE IF NOT EXISTS avaliacoes (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	livro_id INTEGER NOT NULL,
	usuario_id INTEGER NOT NULL,
	pontuacao INTEGER NOT NULL CHECK (pontuacao BETWEEN 1 AND 5),
	comentario TEXT,
	data_avaliacao TEXT DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (livro_id) REFERENCES livros(id),
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
	UNIQUE(livro_id, usuario_id)
);

INSERT INTO usuarios (id, email, cpf, nome_usuario, senha) 
VALUES (1, 'josefasilva@gmail.com', '123.456.789-01', 'Josefina', 'JOSEFA01');
INSERT INTO livros (id, num_chamada, titulo, autor, paginas, isbn, publicacao, assuntos) 
VALUES (1, '82-312.4 C319f', 'Floresta Dos Medos', 'Emily Carroll', 208, '9788594541406', 'Rio de Janeiro (RJ) : Darkside Books, 2019.', 'Contos de terror | Ficção fantástica | Histórias em quadrinhos | Literatura americana');
INSERT INTO avaliacoes (id, livro_id, usuario_id, pontuacao, comentario, data_avaliacao) 
VALUES (1, 1, 1, 5, 'Legal', '2025-07-15');

SELECT * FROM usuarios;
SELECT * FROM avaliacoes;
SELECT * FROM livros;