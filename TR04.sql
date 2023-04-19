-- Lucas Frenhan

USE Exercicio
GO
-- 1. Faça uma busca que mostre cd_Imovel, cd_Vendedor, nm_Vendedor e sg_Estado.

SELECT I.cd_Imovel, V.cd_Vendedor, V.nm_Vendedor, E.sg_Estado 
	FROM Imovel AS I, Estado AS E, Vendedor AS V 

-- 2. Faça uma busca que mostre cd_Comprador, nm_Comprador, cd_Imovel e vl_Oferta.

SELECT C.cd_Comprador, C.nm_Comprador, I.cd_Imovel, O.vl_Oferta 
	FROM Comprador AS C, Imovel AS I, Oferta AS O

-- 3. Faça uma busca que mostre cd_Imovel, vl_Imovel e nm_Bairro, cujo código do vendedor seja 3.

SELECT I.cd_Imovel, I.vl_Imovel, B.nm_Bairro 
	FROM Imovel AS I, Bairro AS B, Vendedor AS V 
	WHERE V.cd_Vendedor = 3

-- 4. Faça uma busca que mostre todos os imóveis que tenham ofertas cadastradas.

SELECT  I.vl_Imovel, I.cd_Imovel 
	FROM Imovel AS I, Oferta AS O 
	WHERE I.cd_Imovel = O.cd_Imovel

-- 5. Faça uma busca que mostre todos os imóveis e ofertas mesmo que não haja ofertas cadastradas para o imóvel.

SELECT  I.vl_Imovel, I.cd_Imovel 
	FROM Imovel AS I, Oferta AS O 
	WHERE I.cd_Imovel != O.cd_Imovel

-- 6. Faça uma busca que mostre os compradores e as respectivas ofertas realizadas por eles.

SELECT C.cd_Comprador, C.nm_Comprador, O.vl_Oferta  
	FROM Comprador AS C, Oferta AS O 
	WHERE O.cd_Comprador = C.cd_Comprador

-- 7. Faça a mesma busca, porém acrescentando os compradores que ainda não fizeram ofertas para os imóveis.

SELECT C.cd_Comprador, C.nm_Comprador, O.vl_Oferta  
	FROM Comprador AS C, Oferta AS O 
	WHERE O.cd_Comprador = C.cd_Comprador OR  C.cd_Comprador IS NOT NULL

-- 8. Faça uma busca que mostre o endereço do imóvel, o bairro e nível de preço do imóvel.

SELECT I.ds_Endereco, I.cd_Bairro, F.nm_Faixa 
	FROM Imovel AS I, Faixa_Imovel AS F

-- 9. Faça uma busca que retorne o total de imóveis por nome de vendedor. Apresente em ordem de total de imóveis.

SELECT V.nm_Vendedor, COUNT(I.cd_Imovel) 'TOTAL IMOVEIS' 
	FROM Imovel AS I, Vendedor AS V 
	GROUP BY V.nm_Vendedor

-- 10. Verifique a diferença de preços entre o maior e o menor imóvel da tabela.

SELECT MAX(vl_Imovel) - MIN(vl_Imovel) AS 'DIFERENÇA' 
	FROM Imovel

-- 11. Mostre o código do vendedor e o menor preço de imóvel dele no cadastro. Exclua da busca os valores de imóveis inferiores a 10 mil.

SELECT I.cd_Vendedor, MIN(I.vl_Imovel) 'VALOR MINIMO' 
	FROM Imovel AS I 
	WHERE I.vl_Imovel > 10000 
	GROUP BY I.cd_Vendedor

-- 12. Mostre o código e o nome do comprador e a média do valor das ofertas e o número de ofertas deste comprador.

SELECT C.cd_Comprador, C.nm_Comprador, AVG(O.vl_Oferta) 'MEDIA DO VALOR', COUNT(O.vl_Oferta) 'OFERTAS' 
	FROM Comprador AS C, Oferta AS O 
	WHERE (C.cd_Comprador = O.cd_Comprador) 
	GROUP BY C.nm_Comprador, C.cd_Comprador