-- Lucas Frenhan

USE Exercicio
GO
-- 1. Fa�a uma busca que mostre cd_Imovel, cd_Vendedor, nm_Vendedor e sg_Estado.

SELECT I.cd_Imovel, V.cd_Vendedor, V.nm_Vendedor, E.sg_Estado 
	FROM Imovel AS I, Estado AS E, Vendedor AS V 

-- 2. Fa�a uma busca que mostre cd_Comprador, nm_Comprador, cd_Imovel e vl_Oferta.

SELECT C.cd_Comprador, C.nm_Comprador, I.cd_Imovel, O.vl_Oferta 
	FROM Comprador AS C, Imovel AS I, Oferta AS O

-- 3. Fa�a uma busca que mostre cd_Imovel, vl_Imovel e nm_Bairro, cujo c�digo do vendedor seja 3.

SELECT I.cd_Imovel, I.vl_Imovel, B.nm_Bairro 
	FROM Imovel AS I, Bairro AS B, Vendedor AS V 
	WHERE V.cd_Vendedor = 3

-- 4. Fa�a uma busca que mostre todos os im�veis que tenham ofertas cadastradas.

SELECT  I.vl_Imovel, I.cd_Imovel 
	FROM Imovel AS I, Oferta AS O 
	WHERE I.cd_Imovel = O.cd_Imovel

-- 5. Fa�a uma busca que mostre todos os im�veis e ofertas mesmo que n�o haja ofertas cadastradas para o im�vel.

SELECT  I.vl_Imovel, I.cd_Imovel 
	FROM Imovel AS I, Oferta AS O 
	WHERE I.cd_Imovel != O.cd_Imovel

-- 6. Fa�a uma busca que mostre os compradores e as respectivas ofertas realizadas por eles.

SELECT C.cd_Comprador, C.nm_Comprador, O.vl_Oferta  
	FROM Comprador AS C, Oferta AS O 
	WHERE O.cd_Comprador = C.cd_Comprador

-- 7. Fa�a a mesma busca, por�m acrescentando os compradores que ainda n�o fizeram ofertas para os im�veis.

SELECT C.cd_Comprador, C.nm_Comprador, O.vl_Oferta  
	FROM Comprador AS C, Oferta AS O 
	WHERE O.cd_Comprador = C.cd_Comprador OR  C.cd_Comprador IS NOT NULL

-- 8. Fa�a uma busca que mostre o endere�o do im�vel, o bairro e n�vel de pre�o do im�vel.

SELECT I.ds_Endereco, I.cd_Bairro, F.nm_Faixa 
	FROM Imovel AS I, Faixa_Imovel AS F

-- 9. Fa�a uma busca que retorne o total de im�veis por nome de vendedor. Apresente em ordem de total de im�veis.

SELECT V.nm_Vendedor, COUNT(I.cd_Imovel) 'TOTAL IMOVEIS' 
	FROM Imovel AS I, Vendedor AS V 
	GROUP BY V.nm_Vendedor

-- 10. Verifique a diferen�a de pre�os entre o maior e o menor im�vel da tabela.

SELECT MAX(vl_Imovel) - MIN(vl_Imovel) AS 'DIFEREN�A' 
	FROM Imovel

-- 11. Mostre o c�digo do vendedor e o menor pre�o de im�vel dele no cadastro. Exclua da busca os valores de im�veis inferiores a 10 mil.

SELECT I.cd_Vendedor, MIN(I.vl_Imovel) 'VALOR MINIMO' 
	FROM Imovel AS I 
	WHERE I.vl_Imovel > 10000 
	GROUP BY I.cd_Vendedor

-- 12. Mostre o c�digo e o nome do comprador e a m�dia do valor das ofertas e o n�mero de ofertas deste comprador.

SELECT C.cd_Comprador, C.nm_Comprador, AVG(O.vl_Oferta) 'MEDIA DO VALOR', COUNT(O.vl_Oferta) 'OFERTAS' 
	FROM Comprador AS C, Oferta AS O 
	WHERE (C.cd_Comprador = O.cd_Comprador) 
	GROUP BY C.nm_Comprador, C.cd_Comprador