-- Criação do banco de dados
CREATE DATABASE atividade01;

-- Selecionar o banco de dados
USE atividade01;

-- Criação da tabela TB_ESTADO
CREATE TABLE TB_ESTADO (
    sigla_estado CHAR(2) NOT NULL,
    nome_estado VARCHAR(40) NOT NULL,
    PRIMARY KEY (sigla_estado)
);

-- Criação da tabela TB_CLASSE
CREATE TABLE TB_CLASSE (
    id_classe SMALLINT NOT NULL,
    id_andar SMALLINT NOT NULL,
    PRIMARY KEY (id_classe)
);

-- Criação da tabela TB_ALUNO
CREATE TABLE TB_ALUNO (
    cod_aluno SMALLINT NOT NULL,
    nome_aluno VARCHAR(45) NOT NULL,
    end_aluno VARCHAR(100) NOT NULL,
    sigla_estado CHAR(2) NOT NULL,
    id_classe SMALLINT NOT NULL,
    PRIMARY KEY (cod_aluno),
    FOREIGN KEY (sigla_estado) REFERENCES TB_ESTADO (sigla_estado),
    FOREIGN KEY (id_classe) REFERENCES TB_CLASSE (id_classe)
);

-- Criação da tabela TB_PROFESSOR
CREATE TABLE TB_PROFESSOR (
    id_professor CHAR(3) NOT NULL,
    nome_professor VARCHAR(25) NOT NULL,
    PRIMARY KEY (id_professor)
);

-- Criação da tabela TB_DISCIPLINA
CREATE TABLE TB_DISCIPLINA (
    id_disciplina CHAR(3) NOT NULL,
    nome_disciplina VARCHAR(15) NOT NULL,
    id_professor_disciplina CHAR(3) NOT NULL,
    nota_minima_disciplina SMALLINT NOT NULL,
    PRIMARY KEY (id_disciplina),
    FOREIGN KEY (id_professor_disciplina) REFERENCES TB_PROFESSOR (id_professor)
);

-- Criação da tabela TB_ALUNO_DISCIPLINA
CREATE TABLE TB_ALUNO_DISCIPLINA (
    cod_aluno SMALLINT NOT NULL,
    id_disciplina CHAR(3) NOT NULL,
    nota_aluno SMALLINT NOT NULL,
    PRIMARY KEY (cod_aluno, id_disciplina),
    FOREIGN KEY (id_disciplina) REFERENCES TB_DISCIPLINA (id_disciplina),
    FOREIGN KEY (cod_aluno) REFERENCES TB_ALUNO (cod_aluno)
);

-- Inserção de dados na tabela TB_PROFESSOR
INSERT INTO TB_PROFESSOR (id_professor, nome_professor)
VALUES 
    ('JOI', 'JOILSON CARDOSO'),
    ('OSE', 'OSEAS SANTANA'),
    ('VIT', 'VITOR VASCONCELOS'),
    ('FER', 'JOSE ROBERTO FERROLI'),
    ('LIM', 'VALMIR LIMA'),
    ('EDS', 'EDSON SILVA'),
    ('WAG', 'WAGNER OKIDA');
   
 SELECT *
 FROM TB_PROFESSOR 

-- Inserção de dados na tabela TB_ESTADO
INSERT INTO TB_ESTADO (sigla_estado, nome_estado)
VALUES ('SP', 'São Paulo');

 SELECT *
 FROM TB_ESTADO 

-- Inserção de dados na tabela TB_CLASSE
INSERT INTO TB_CLASSE (id_classe, id_andar)
VALUES 
    (1, 1),
    (2, 1),
    (3, 1);

-- Inserção de dados na tabela TB_ALUNO
INSERT INTO TB_ALUNO (cod_aluno, nome_aluno, end_aluno, sigla_estado, id_classe)
VALUES 
    (1, 'ANTONIO CARLOS PENTEADO', 'RUA X', 'SP', 1),
    (2, 'AUROMIR DA SILVA VALDEVINO', 'RUA W', 'SP', 1),
    (3, 'ANDRE COSTA', 'RUA T', 'SP', 1),
    (4, 'ROBERTO SOARES DE MENEZES', 'RUA BW', 'SP', 2),
    (5, 'DANIA', 'RUA CCC', 'SP', 2),
    (6, 'CARLOS MAGALHAES', 'AV SP', 'SP', 2),
    (7, 'MARCELO RAUBA', 'AV SAO LUIS', 'SP', 3),
    (8, 'FERNANDO', 'AV COUNTYR', 'SP', 3),
    (9, 'WALMIR BURIN', 'RUA SSISIS', 'SP', 3);

-- Inserção de dados na tabela TB_DISCIPLINA
INSERT INTO TB_DISCIPLINA (id_disciplina, nome_disciplina, id_professor_disciplina, nota_minima_disciplina)
VALUES 
    ('MAT', 'MATEMATICA', 'JOI', 7),
    ('POR', 'PORTUGUES', 'VIT', 5),
    ('FIS', 'FISICA', 'OSE', 3),
    ('HIS', 'HISTORIA', 'EDS', 2),
    ('GEO', 'GEOGRAFIA', 'WAG', 4),
    ('ING', 'INGLES', 'LIM', 2);

-- Inserção de dados na tabela TB_ALUNO_DISCIPLINA
INSERT INTO TB_ALUNO_DISCIPLINA (cod_aluno, id_disciplina, nota_aluno)
VALUES 
    (1, 'MAT', 0),
    (2, 'MAT', 0),
    (3, 'MAT', 1),
    (4, 'POR', 2),
    (5, 'POR', 2),
    (6, 'POR', 2),
    (7, 'FIS', 3),
    (8, 'FIS', 3),
    (9, 'FIS', 3),
    (1, 'POR', 2),
    (2, 'POR', 2),
    (7, 'POR', 2),
    (1, 'FIS', 3);
