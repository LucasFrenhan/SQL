-- Lucas Frenhan

USE Exercicio
GO

-- 1
SELECT * FROM Imovel 
WHERE cd_Bairro = (select cd_Bairro from Imovel where cd_Imovel = 2) 
AND cd_Imovel != 2

-- 2
SELECT * FROM Imovel
WHERE vl_Imovel > (select AVG(vl_Imovel) from Imovel)

-- 3
SELECT C.* FROM Comprador AS C
INNER JOIN Oferta AS O
ON C.cd_Comprador = O.cd_Comprador 
AND vl_Oferta > 70000

-- 4
SELECT I.* FROM Imovel AS I
INNER JOIN Oferta AS O
ON I.cd_Imovel = O.cd_Imovel
AND vl_Oferta > (select AVG(vl_Oferta) from Oferta)

-- 5
SELECT I.*
FROM Imovel AS I
INNER JOIN (
  SELECT cd_Bairro, AVG(vl_Imovel) AS media_Preco
  FROM Imovel
  GROUP BY cd_Bairro) AS media_Bairro
ON I.cd_Bairro = media_Bairro.cd_Bairro
AND I.vl_Imovel > media_Bairro.media_Preco

-- 6
SELECT cd_Bairro, MAX(vl_Imovel) AS maior_Preco
FROM Imovel
WHERE vl_Imovel > (SELECT AVG(vl_Imovel) FROM Imovel)
GROUP BY cd_Bairro
ORDER BY maior_preco ASC

-- 7 
SELECT I.*
FROM Imovel AS I
INNER JOIN (
  SELECT cd_Vendedor, MIN(vl_Imovel) AS menor_Preco
  FROM Imovel
  GROUP BY cd_Vendedor
) AS menor_Vendedor
ON I.cd_Vendedor = menor_Vendedor.cd_Vendedor
AND I.vl_Imovel = menor_Vendedor.menor_Preco

-- 8
SELECT I.* 
FROM Imovel AS I 
INNER JOIN (
   SELECT cd_Vendedor, min(vl_Imovel) as min_preco 
   FROM Imovel 
   GROUP BY cd_Vendedor 
   HAVING MIN(vl_Imovel) = (SELECT MIN(vl_Imovel) FROM Imovel)) AS Min_vendedor 
ON I.cd_Vendedor != Min_vendedor.cd_Vendedor 
AND I.vl_Imovel = Min_vendedor.min_preco