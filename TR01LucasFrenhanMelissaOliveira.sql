-- criação de banco de dados
CREATE DATABASE Desafio
GO

USE Desafio
GO


CREATE TABLE Empregado(
	codigo_do_empregado CHAR(8) NOT NULL,
	nome_do_empregado CHAR(30) NULL,
	data_de_nascimento_do_empregado DATE NULL,
	endereco_do_empregado CHAR(50) NULL,
	cidade_do_empregado CHAR(20) NULL,
	estado_do_empregado CHAR(2) NULL,
	telefone_do_empregado CHAR(11) NULL
)
GO

CREATE TABLE Dependente(
	codigo_do_empregado CHAR(8) NOT NULL,
	codigo_do_dependente INT NOT NULL,
	nome_do_dependente CHAR(30) NULL,
	data_de_nascimento_do_dependente DATE NULL,
	grau_de_parentesco_do_dependente INT NULL
)
GO

CREATE TABLE Parentesco(
	codigo_do_parentesco INT NOT NULL,
	nome_do_parentesco CHAR(25) NULL
)
GO

-- 1A
ALTER TABLE Empregado
	ADD CONSTRAINT PK_Empregado PRIMARY KEY(codigo_do_empregado)
GO

-- 1B
ALTER TABLE Dependente
	ADD CONSTRAINT PK_Dependete PRIMARY KEY (codigo_do_empregado, codigo_do_dependente)
GO

-- 1C
ALTER TABLE Parentesco
	ADD CONSTRAINT PK_Parentesco PRIMARY KEY (codigo_do_parentesco)
GO

-- 2A
ALTER TABLE Dependente
	ADD CONSTRAINT FK_codigo_do_empregado FOREIGN KEY(codigo_do_empregado) REFERENCES Empregado(codigo_do_empregado)
GO

-- *2B
ALTER TABLE Dependente
	ADD CONSTRAINT FK_codigo_do_parentesco FOREIGN KEY(grau_de_parentesco_do_dependente) REFERENCES Parentesco(codigo_do_parentesco)
GO

-- 3a 

INSERT INTO Parentesco (codigo_do_parentesco, nome_do_parentesco)
VALUES 
(99, 'esposa'), 
(1, 'filho'), 
(2, 'filha')

INSERT INTO  Empregado (codigo_do_empregado, nome_do_empregado, data_de_nascimento_do_empregado,
endereco_do_empregado, cidade_do_empregado, estado_do_empregado,
telefone_do_empregado) 
VALUES 
( '001', 'Empregado1', '1973/01/01', 'endereco1', 'cidade1', 'SP', '13997578423'),
( '002', 'Empregado2', '1972/01/01', 'endereco2', 'cidade2', 'RJ', '13998412354'),
( '003', 'Empregado3', '1971/01/01', 'endereco3', 'cidade3', 'SP', '13987578633'),

( '004', 'Empregado4', '1975/01/01', 'endereco4', 'cidade4', 'RJ', '13997578423'),
( '005', 'Empregado5', '1976/01/01', 'endereco5', 'cidade5', 'SP', '13998412354'),
( '006', 'Empregado6', '1977/01/01', 'endereco6', 'cidade6', 'RJ', '13987578633'),

( '007', 'Empregado7', '1990/01/01', 'endereco7', 'cidade7', 'SP', '13997578423'),
( '008', 'Empregado8', '1991/01/01', 'endereco8', 'cidade8', 'RJ', '13998412354'),
( '009', 'Empregado9', '1992/01/01', 'endereco9', 'cidade9', 'SP', '13987578633')
GO

INSERT INTO Dependente (codigo_do_empregado, codigo_do_dependente, nome_do_dependente, data_de_nascimento_do_dependente, grau_de_parentesco_do_dependente)
VALUES
('001', 01, 'Esposa1', '1974/01/01', 99 ),
('001', 02, 'filho1', '2006/01/01', 1 ),
('001', 03, 'filha1', '2005/01/01', 2 ),

('002', 01, 'Esposa2', '1973/01/01', 99 ),
('002', 02, 'filho2', '2007/01/01', 1 ),
('002', 03, 'filha2', '2004/01/01', 2 ),

('003', 01, 'Esposa3', '1972/01/01', 99 ),
('003', 02, 'filho3', '2008/01/01', 1 ),
('003', 03, 'filha3', '2003/01/01', 2 ),

('004', 01, 'Esposa4', '1978/01/01', 99 ),
('004', 02, 'filho4', '2012/01/01', 1 ),
('004', 03, 'filha4', '2009/01/01', 2 ),

('005', 01, 'Esposa5', '1979/01/01', 99 ),
('005', 02, 'filho5', '2013/01/01', 1 ),
('005', 03, 'filha5', '2008/01/01', 2 ),

('006', 01, 'Esposa6', '1980/01/01', 99 ),
('006', 02, 'filho6', '2014/01/01', 1 ),
('006', 03, 'filha6', '2007/01/01', 2 ),

('007', 01, 'Esposa7', '1991/01/01', 99 ),
('007', 02, 'filho7', '2020/01/01', 1 ),
('007', 03, 'filha7', '2017/01/01', 2 ),

('008', 01, 'Esposa8', '1992/01/01', 99 ),
('008', 02, 'filho8', '2021/01/01', 1 ),
('008', 03, 'filha8', '2016/01/01', 2 ),

('009', 01, 'Esposa9', '1993/01/01', 99 ),
('009', 02, 'filho9', '2022/01/01', 1 ),
('009', 03, 'filha9', '2015/01/01', 2 )
GO

-- 4
SELECT E.nome_do_empregado AS 'Nome do Empregado', E.data_de_nascimento_do_empregado AS 'Data Nascimento', 
ESPOSA.nome_do_dependente AS 'Esposa', FILHO.nome_do_dependente AS 'Filho', FILHA.nome_do_dependente AS 'Filha'
 FROM Empregado AS E
 LEFT JOIN Dependente AS ESPOSA ON E.codigo_do_empregado = ESPOSA.codigo_do_empregado AND
 ESPOSA.grau_de_parentesco_do_dependente = 99
 LEFT JOIN Dependente AS FILHO ON E.codigo_do_empregado = FILHO.codigo_do_empregado AND
 FILHO.grau_de_parentesco_do_dependente = 1
 LEFT JOIN Dependente AS FILHA ON E.codigo_do_empregado = FILHA.codigo_do_empregado AND
 FILHA.grau_de_parentesco_do_dependente = 2 
 ORDER BY E.nome_do_empregado

 -- 5 
SELECT E.nome_do_empregado AS 'Nome do Empregado', ESPOSA.nome_do_dependente AS 'Esposa', 
 FILHO.nome_do_dependente AS 'Filho', FILHO.data_de_nascimento_do_dependente as 'Data Nascimento Filho', 
FILHA.nome_do_dependente AS 'Filha', FILHA.data_de_nascimento_do_dependente AS 'Data Nascimento Filha'
 FROM Empregado AS E
 LEFT JOIN Dependente AS ESPOSA ON E.codigo_do_empregado = ESPOSA.codigo_do_empregado AND
 ESPOSA.grau_de_parentesco_do_dependente = 99
 LEFT JOIN Dependente AS FILHO ON E.codigo_do_empregado = FILHO.codigo_do_empregado AND
 FILHO.grau_de_parentesco_do_dependente = 1
 LEFT JOIN Dependente AS FILHA ON E.codigo_do_empregado = FILHA.codigo_do_empregado AND
 FILHA.grau_de_parentesco_do_dependente = 2 
 ORDER BY E.nome_do_empregado

 -- 6 
SELECT E.nome_do_empregado 'NOME DO EMPREGADO', E.data_de_nascimento_do_empregado AS 'DATA DE NASCIMENTO', 
 FILHO.nome_do_dependente AS 'NOME DO FILHO', FILHO.data_de_nascimento_do_dependente AS 'DATA DE NASCIMENTO DO FILHO', 
 FILHA.nome_do_dependente AS 'NOME DA FILHA', FILHA.data_de_nascimento_do_dependente AS 'DATA DE NASCIMENTO DA FILHA'
 FROM Empregado AS E
 LEFT JOIN Dependente FILHO ON E.codigo_do_empregado = FILHO.codigo_do_empregado 
	AND FILHO.grau_de_parentesco_do_dependente = 1 AND FILHO.data_de_nascimento_do_dependente > DATEADD(YEAR, -12, GETDATE())
 LEFT JOIN Dependente FILHA ON E.codigo_do_empregado = FILHA.codigo_do_empregado 
	AND FILHA.grau_de_parentesco_do_dependente = 2 AND FILHA.data_de_nascimento_do_dependente > DATEADD(YEAR, - 12, GETDATE())
 WHERE E.data_de_nascimento_do_empregado BETWEEN DATEADD(YEAR, -49, GETDATE()) AND DATEADD(YEAR, -35, GETDATE())

 -- 7 
SELECT E.nome_do_empregado AS 'NOME DO EMPREGADO',
	ESPOSA.nome_do_dependente AS 'NOME DA ESPOSA',	ESPOSA.data_de_nascimento_do_dependente AS 'DATA DE NASCIMENTO ESPOSA', 
	FILHO.nome_do_dependente AS 'NOME DO FILHO', FILHO.data_de_nascimento_do_dependente AS 'DATA DE NASCIMENTO FILHO', 
	FILHA.nome_do_dependente AS 'NOME DA FILHA', FILHA.data_de_nascimento_do_dependente AS 'DATA DE NASCIMNETO FILHA'
FROM Empregado AS E
LEFT JOIN Dependente ESPOSA ON E.codigo_do_empregado = ESPOSA.codigo_do_empregado AND ESPOSA.grau_de_parentesco_do_dependente = 99 AND
                           ESPOSA.data_de_nascimento_do_dependente BETWEEN '1991/01/01' AND '2003/12/31'
LEFT JOIN Dependente FILHO ON E.codigo_do_empregado = FILHO.codigo_do_empregado AND FILHO.grau_de_parentesco_do_dependente = 1 AND
                           FILHO.data_de_nascimento_do_dependente > DATEADD(YEAR, -5, GETDATE())
LEFT JOIN Dependente FILHA ON E.codigo_do_empregado = FILHA.codigo_do_empregado AND FILHA.grau_de_parentesco_do_dependente = 2 AND
                           FILHA.data_de_nascimento_do_dependente > DATEADD(YEAR, -5, GETDATE())
WHERE E.data_de_nascimento_do_empregado BETWEEN '1989/01/01' AND '2003/12/31' 
ORDER BY E.nome_do_empregado

-- 8
SELECT E.nome_do_empregado AS 'NOME DO EMPREGADO',
	ESPOSA.nome_do_dependente AS 'NOME DA ESPOSA', ESPOSA.data_de_nascimento_do_dependente AS 'DATA DE NASCIMENTO DA ESPOSA',
	FILHO.nome_do_dependente AS 'NOME DO FILHO', FILHO.data_de_nascimento_do_dependente AS 'DATA DE NASCIMENTO DO FILHO',
	FILHA.nome_do_dependente AS 'NOME DA FILHA', FILHA.data_de_nascimento_do_dependente AS 'DATA DE NASCIMENTO DA FILHA'
FROM Empregado AS E
LEFT JOIN Dependente AS ESPOSA ON E.codigo_do_empregado = ESPOSA.codigo_do_empregado AND ESPOSA.grau_de_parentesco_do_dependente = 99 AND 
	ESPOSA.data_de_nascimento_do_dependente > DATEADD(YEAR, -47, GETDATE())
LEFT JOIN Dependente AS FILHO ON E.codigo_do_empregado = FILHO.codigo_do_empregado AND FILHO.grau_de_parentesco_do_dependente = 1 AND
	FILHO.data_de_nascimento_do_dependente > DATEADD(YEAR, -17, GETDATE())
LEFT JOIN Dependente AS FILHA ON E.codigo_do_empregado = FILHA.codigo_do_empregado AND FILHA.grau_de_parentesco_do_dependente = 2 AND
	FILHA.data_de_nascimento_do_dependente > DATEADD(YEAR, -17, GETDATE())
WHERE E.data_de_nascimento_do_empregado > DATEADD(YEAR, -50, GETDATE())
ORDER BY E.nome_do_empregado

-- 9
SELECT E.nome_do_empregado AS 'NOME DO EMPREGADO',
	FILHO.nome_do_dependente AS 'NOME DO FILHO', FILHO.data_de_nascimento_do_dependente AS 'DATA DE NASCIMENTO DO FILHO',
	E.estado_do_empregado AS 'ESTADO'
FROM Empregado AS E
LEFT JOIN Dependente AS FILHO ON E.codigo_do_empregado = FILHO.codigo_do_empregado
WHERE FILHO.grau_de_parentesco_do_dependente = 1 AND E.estado_do_empregado = 'SP'
ORDER BY E.nome_do_empregado

-- 10
SELECT E.nome_do_empregado AS 'NOME DO EMPREGADO',
	ESPOSA.nome_do_dependente AS 'NOME DA ESPOSA', 
	FILHO.nome_do_dependente AS 'NOME DO FILHO', FILHO.data_de_nascimento_do_dependente AS 'DATA DE NASCIMENTO DO FILHO',
	FILHA.nome_do_dependente AS 'NOME DA FILHA', FILHA.data_de_nascimento_do_dependente AS 'DATA DE NASCIMENTO DA FILHA',
	E.cidade_do_empregado AS 'CIDADE'
FROM Empregado AS E
LEFT JOIN Dependente AS ESPOSA ON E.codigo_do_empregado = ESPOSA.codigo_do_empregado AND ESPOSA.grau_de_parentesco_do_dependente = 99
LEFT JOIN Dependente AS FILHO ON E.codigo_do_empregado = FILHO.codigo_do_empregado AND FILHO.grau_de_parentesco_do_dependente = 1 
LEFT JOIN Dependente AS FILHA ON E.codigo_do_empregado = FILHA.codigo_do_empregado AND FILHA.grau_de_parentesco_do_dependente = 2 
WHERE E.estado_do_empregado = 'RJ'