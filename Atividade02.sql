USE atividade01


-- 1A) Selecionar todos os alunos cadastrados:

SELECT  *
FROM TB_ALUNO

-- 1B) Selecionar todos os nomes de disciplinas cuja nota mínima seja maior que 5:

SELECT
	nome_disciplina 
FROM
	TB_DISCIPLINA
WHERE
	nota_minima_disciplina > 5
	
-- 1C) Selecionar todas as disciplinas que tenham nota mínima entre 3 e 5:
	
SELECT
	*
FROM
	TB_DISCIPLINA
WHERE
	nota_minima_disciplina BETWEEN 3 AND 5
	
-- 2A) Selecionar todos os alunos em ordem alfabética de nome de aluno, e também o número da classe que estuda:
	
SELECT
	ta.nome_aluno AS 'Nome Aluno',
	ta.id_classe AS 'ID Classe'
FROM
	TB_ALUNO ta
ORDER BY
	nome_aluno ASC
	
-- 2B) Selecionar todos os alunos em ordem decrescente pelo identificador do aluno:

SELECT
	nome_aluno,
	id_classe
FROM
	TB_ALUNO
ORDER BY
	cod_aluno ASC
	
-- 2C) Selecionar todos os alunos que cursam as disciplinas de Matemática e Português agrupados por aluno e disciplina:
	
SELECT
	ta.nome_aluno,
	td.nome_disciplina
FROM
	TB_ALUNO ta
JOIN TB_ALUNO_DISCIPLINA tad ON
	ta.cod_aluno = tad.cod_aluno
JOIN TB_DISCIPLINA td ON
	tad.id_disciplina = td.id_disciplina
WHERE
	td.nome_disciplina LIKE '%MATEMATIC%'
	OR td.nome_disciplina LIKE '%PORTUGUES%'
GROUP BY
	ta.nome_aluno,
	td.nome_disciplina;

-- 3A) Selecionar todos os nomes de alunos que cursam Português ou Matemática

SELECT
	DISTINCT a.nome_aluno
FROM
	TB_ALUNO a
JOIN TB_ALUNO_DISCIPLINA ad ON
	a.cod_aluno = ad.cod_aluno
JOIN TB_DISCIPLINA d ON
	ad.id_disciplina = d.id_disciplina
WHERE
	d.nome_disciplina LIKE 'POR%' 
	OR d.nome_disciplina LIKE 'MAT%'

-- 3B) Selecionar todos os nomes de alunos cadastrados que curam a disciplina 'Física' e seus respectivos endereços
	
SELECT
	a.nome_aluno,
	a.end_aluno
FROM
	TB_ALUNO a
JOIN TB_ALUNO_DISCIPLINA ad ON
	a.cod_aluno = ad.cod_aluno
JOIN TB_DISCIPLINA d ON
	ad.id_disciplina = d.id_disciplina
WHERE
	d.nome_disciplina = 'FISICA';

-- 3C) Selecionar todos os nomes de alunos cadastrados que cursam física e o andar que se encontra a classe dos mesmos. 
-- (Concatenando a string "andar" com o número do andar para estética.)

SELECT
    a.nome_aluno,
    CONCAT('andar ', c.id_andar) AS andar
FROM
    TB_ALUNO a
JOIN TB_ALUNO_DISCIPLINA ad ON
    a.cod_aluno = ad.cod_aluno
JOIN TB_DISCIPLINA d ON
    ad.id_disciplina = d.id_disciplina
JOIN TB_CLASSE c ON
    a.id_classe = c.id_classe
WHERE
    LOWER(d.nome_disciplina) = LOWER('FISICA');

-- 4A) Selecionar todos os Professores com suas respectivas disciplinas e os demais Professores que não lecionam disciplina alguma.

SELECT
    p.id_professor,
    p.nome_professor,
    d.nome_disciplina
FROM
    TB_PROFESSOR p
LEFT JOIN TB_DISCIPLINA d ON
    p.id_professor = d.id_professor_disciplina;

-- 5A) Selecionar todos os nomes de professores que tenham ministrado disciplina para alunos que sejam do Estado do Piaui, 
-- cujo a classe tenha sido no terceiro andar.
   
SELECT
	DISTINCT p.nome_professor
FROM
	TB_PROFESSOR p
WHERE
	p.id_professor IN (
	SELECT
		d.id_professor_disciplina
	FROM
		TB_DISCIPLINA d
	JOIN TB_ALUNO a ON
		d.id_disciplina = (
		SELECT
			ad.id_disciplina
		FROM
			TB_ALUNO_DISCIPLINA ad
		WHERE
			ad.cod_aluno = a.cod_aluno
    )
	JOIN TB_CLASSE c ON
		a.id_classe = c.id_classe
	WHERE
		a.sigla_estado = 'SP'
		AND c.id_andar = 2
);

	
	
	
	
	
	
	
	
