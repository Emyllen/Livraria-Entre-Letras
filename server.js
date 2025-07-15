import express from 'express';
import sqlite3 from 'sqlite3';
import cors from 'cors';
import mysql from 'mysql2';

const app = express();
const db = new sqlite3.Database('./livraria.db');

app.use(cors());
app.use(express.json());

app.get('/livros', (req, res) => {
  db.all('SELECT * FROM livros', [], (err, rows) => {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.json(rows);
  });
});

app.listen(3000, () => console.log('Servidor rodando em http://localhost:3000'));


(async () => {
    const db = require("./base")
    console.log("Começou!")
  //usuario
    console.log('INSERT INTO USUARIOS')
    const result = await db.inserir({cpf: "123.456.789-00", senha:"JOSEFA01", nivel_acesso: 1})
    console.log(result);
  
  
    console.log("SELECT * FROM usuarios")
    const usuarios = await db.selecionar();
    console.log(usuarios);
  //livros
    console.log('INSERT INTO LIVROS')
    const result2 = await db.inserir2({num_chamada: "82-312.4 C319f", titulo: "Floresta Dos Medos" , autor: "Emily Carroll", paginas: "206", isbn: "9788594541406", publicacao: "Rio de Janeiro (RJ) : Darkside Books, 2019.", assuntos: "Contos de terror | Ficção fantástica | Histórias em quadrinhos | Literatura americana"})
    console.log(result2);

  
// Conexão com o banco
const connection = mysql.createConnection({
  host: 'localhost',       // ou o IP do servidor
  user: 'root',            // seu usuário MySQL
  password: '',            // sua senha MySQL (pode ser '' se estiver sem senha)
  database: 'biblioteca'  // o nome do seu banco de dados
});

// Testa conexão
connection.connect((err) => {
  if (err) {
    console.error('Erro ao conectar ao MySQL:', err);
    return;
  }
  console.log('Conectado ao banco de dados MySQL!');
});
})