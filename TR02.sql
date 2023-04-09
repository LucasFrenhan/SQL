-- Lucas Frenhan

USE Exercicio

-- INCLUSAO NA TABELA ESTADO
INSERT INTO Estado (sg_Estado, nm_Estado) 
    VALUES ('SP', 'SÃO PAULO')
GO
INSERT INTO Estado (sg_Estado, nm_Estado) 
    VALUES ('RJ', 'RIO DE JANEIRO')
GO

SELECT * FROM Estado

-- INCLUSAO NA TABELA CIDADE
INSERT INTO Cidade (cd_Cidade, sg_Estado, nm_Cidade) 
    VALUES (1, 'SP', 'SÃO PAULO')
GO
INSERT INTO Cidade (cd_Cidade, sg_Estado, nm_Cidade) 
    VALUES (2, 'SP', 'SÃO ANDRÉ')
GO
INSERT INTO Cidade (cd_Cidade, sg_Estado, nm_Cidade) 
    VALUES (3, 'SP', 'CAMPINAS')
GO
INSERT INTO Cidade (cd_Cidade, sg_Estado, nm_Cidade) 
    VALUES (1, 'RJ', 'RIO DE JANEIRO')
GO
INSERT INTO Cidade (cd_Cidade, sg_Estado, nm_Cidade) 
    VALUES (2, 'RJ', 'NITEROI')
GO

SELECT * FROM Cidade

-- INCLUSAO NA TABELA BAIRRO
INSERT INTO Bairro (cd_Bairro, cd_Cidade, sg_Estado, nm_Bairro) 
    VALUES (1, 1, 'SP', 'JARDINS')
GO
INSERT INTO Bairro (cd_Bairro, cd_Cidade, sg_Estado, nm_Bairro) 
    VALUES (2, 1, 'SP', 'MORUMBI')
GO
INSERT INTO Bairro (cd_Bairro, cd_Cidade, sg_Estado, nm_Bairro) 
    VALUES (3, 1, 'SP', 'AEROPORTO')
GO
INSERT INTO Bairro (cd_Bairro, cd_Cidade, sg_Estado, nm_Bairro) 
    VALUES (1, 2, 'RJ', 'AEROPORTO')
GO
INSERT INTO Bairro (cd_Bairro, cd_Cidade, sg_Estado, nm_Bairro) 
    VALUES (2, 2, 'RJ', 'NITEROI')
GO

SELECT * FROM Bairro

--INCLUSAO NA TABELA VENDEDOR
INSERT INTO Vendedor (cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email)
    VALUES(1, 'MARIA DA SILVA', 'RUA DO GRITO, 45', 'msilva@nova.com')
GO
INSERT INTO Vendedor (cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email)
    VALUES(2, 'MARCO ANDRADE', 'AV. DA SAUDADE, 325', 'mandrade@nova.com')
GO
INSERT INTO Vendedor (cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email)
    VALUES(3, 'ANDRÉ CARDOSO', 'AV. BRASIL, 401', 'acardoso@nova.com')
GO
INSERT INTO Vendedor (cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email)
    VALUES(4, 'TATIANA SOUZA', 'RUA DO IMPERADOR. 778', 'tsouza@nova.com')
GO

SELECT * FROM Vendedor

-- INCLUSAO NA TABELA IMOVEL
INSERT INTO Imovel (cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Imovel) 
    VALUES (1, 1, 1, 1, 'SP', 'AL. TIETE, 3304/101', 250, 400, 180000)
GO
INSERT INTO Imovel (cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Imovel) 
    VALUES (2, 1, 2, 1, 'SP', 'AV. MORUMBI, 2230', 150, 250, 135000)
GO
INSERT INTO Imovel (cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Imovel) 
    VALUES (3, 2, 1, 2, 'RJ', 'R. GAL. OSORIO, 445/34', 250, 400, 185000)
GO
INSERT INTO Imovel (cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Imovel) 
    VALUES (4, 2, 2, 2, 'RJ', 'R. D. PEDRO I, 882', 120, 200, 110000)
GO
INSERT INTO Imovel (cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Imovel) 
    VALUES (5, 3, 3, 1, 'SP', 'AV. RUBEN BERTA, 2355', 110, 200, 95000)
GO
INSERT INTO Imovel (cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Imovel) 
    VALUES (6, 4, 1, 2, 'RJ', 'R. GETULIO VARGAS, 552', 200, 300, 99000)
GO

SELECT * FROM Imovel

-- INCLUSAO NA TABELA COMPRADOR
INSERT INTO Comprador (cd_Comprador, nm_Comprador, ds_Endereco, ds_Email)
    VALUES(1, 'EMMANUEL ANTUNES', 'R. SARAIVA, 452', 'eantunes@nova.com')
GO
INSERT INTO Comprador (cd_Comprador, nm_Comprador, ds_Endereco, ds_Email)
    VALUES(2, 'JOANA PEREIRA', 'AV. PORTUGAL, 52', 'jpereira@nova.com')
GO
INSERT INTO Comprador (cd_Comprador, nm_Comprador, ds_Endereco, ds_Email)
    VALUES(3, 'RONALDO CAMPELO', 'R. ESTADOS UNIDOS, 13', 'rcampelo@nova.com')
GO
INSERT INTO Comprador (cd_Comprador, nm_Comprador, ds_Endereco, ds_Email)
    VALUES(4, 'MANDFRED AUGUSTO', 'AV. BRASIL, 351', 'magusto@nova.com')
GO

SELECT * FROM Comprador

-- INCLUSAO NA TABELA OFERTA
INSERT INTO Oferta (cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta)
    VALUES (1, 1, 170000, '2009/01/01')
GO
INSERT INTO Oferta (cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta)
    VALUES (1, 3, 180000, '2009/01/10')
GO
INSERT INTO Oferta (cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta)
    VALUES (2, 2, 135000, '2009/01/15')
GO
INSERT INTO Oferta (cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta)
    VALUES (2, 4, 100000, '2009/02/15')
GO
INSERT INTO Oferta (cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta)
    VALUES (3, 1, 160000, '2009/01/05')
GO
INSERT INTO Oferta (cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta)
    VALUES (3, 2, 140000, '2009/02/20')
GO

SELECT * FROM Oferta

-- Aumente o preço de vendas dos imóveis em 10%
UPDATE  Imovel SET vl_Imovel = vl_Imovel * 1.10

-- Abaixe o preço de venda dos imóveis do vendedor 1 em 5%
UPDATE Imovel SET vl_Imovel = vl_Imovel - (vl_Imovel * 0.05)
WHERE cd_Vendedor = 1

-- Aumente em 5% o valor das ofertas do comprador 2
UPDATE Oferta SET vl_Oferta = vl_Oferta * 1.05
WHERE cd_Comprador = 2

-- Altere o endereço do comprador 3 para R. ANANÁS, 45 e o estado para RJ
UPDATE Comprador SET ds_Endereco = 'R. ANANÁS, 45'
WHERE cd_Comprador = 3

-- Altere a oferta do comprador 2 no imóvel 4 para 101.000
UPDATE Oferta SET vl_Oferta = 101000
WHERE cd_Comprador = 2 AND cd_Imovel = 4


-- Exclua a oferta do comprador 3 no imóvel 1
DELETE Oferta
WHERE cd_Comprador = 3 AND cd_Imovel = 1

-- Exclua a cidade 3 do estado SP
DELETE Cidade
WHERE cd_Cidade = 3 AND sg_Estado = 'SP'

/* Inclua linhas na tabela FAIXA_IMOVEL
cd_Faixa nmFaixa vl_Minimo vl_Maximo
1       BAIXO       0       105000
2       MÉDIO       105001  180000
3       ALTO        180001  999999
*/
INSERT INTO Faixa_Imovel (cd_Faixa, nm_Faixa, vl_Minimo, vl_Maximo)
    VALUES(1, 'BAIXO', 0, 105000)
INSERT INTO Faixa_Imovel (cd_Faixa, nm_Faixa, vl_Minimo, vl_Maximo)
    VALUES(2, 'MÉDIO', 105001, 180000)
INSERT INTO Faixa_Imovel(cd_Faixa, nm_Faixa, vl_Minimo, vl_Maximo)
    VALUES(3, 'ALTO', 180001, 999999)
SELECT * FROM Faixa_Imovel