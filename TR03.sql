-- Lucas Frenhan

USE Exercicio
GO

-- 1. Liste todas as linhas e os campos cd_Comprador, nm_Comprador e ds_Email da tabela COMPRADOR
SELECT cd_Comprador, nm_Comprador, ds_Email FROM Comprador

-- 2. Liste todas as linhas e os campos cd_Vendedor, nm_Vendedor e ds_Email da tabela VENDEDOR em ordem alfabética decrescente.
SELECT cd_Vendedor, nm_Vendedor, ds_Email FROM Vendedor ORDER BY nm_Vendedor DESC

-- 3. Liste as colunas cd_Imovel, cd_Vendedor e vl_Preco de todos os imóveis do vendedor 2.
SELECT cd_Imovel, cd_Vendedor , vl_Imovel FROM Imovel WHERE cd_Vendedor = 2

-- 4. Liste as colunas cd_Imovel, cd_Vendedor, vl_Preco e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e sejam do Estado do RJ.
SELECT cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado FROM Imovel WHERE vl_Imovel < 150000 AND sg_Estado = 'RJ'

-- 5. Liste as colunas cd_Imovel, cd_Vendedor, vl_Preco e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e o vendedor não seja 2.
SELECT cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado FROM Imovel WHERE vl_Imovel < 150000 AND cd_Vendedor != 2

-- 6. Liste as colunas cd_Comprador, nm_Comprador, ds_Endereco e sg_Estado da tabela COMPRADOR em que o Estado seja nulo.
SELECT cd_Comprador, nm_Comprador, ds_Endereco, sg_Estado FROM Comprador WHERE sg_Estado = null

-- 7. Liste todas as ofertas cujo valor esteja entre 100 mil e 150 mil.
SELECT * FROM Oferta WHERE vl_Oferta > 100000 AND vl_Oferta < 150000

-- 8. Liste todas as ofertas cuja data da oferta esteja entre 01/01/2009 e 01/03/2009.
SELECT * FROM Oferta WHERE dt_Oferta BETWEEN '2009/01/01' AND '2009/03/01'

-- 9. Liste todos os vendedores que comecem com a letra M.
SELECT * FROM Vendedor WHERE nm_Vendedor LIKE 'M%'

-- 10. Liste todos vendedores que tenham a letra A na segunda posição do nome
SELECT * FROM Vendedor WHERE nm_Vendedor LIKE '_A%'

-- 11. Liste todos os compradores que tenham a letra U em qualquer posição do endereço
SELECT * FROM Comprador WHERE nm_Comprador LIKE '%U%'

-- 12. Liste todos os imóveis cujo código seja 2 ou 3 em ordem alfabética de endereço
SELECT * FROM Imovel WHERE cd_Imovel = 2 or cd_Imovel = 3 ORDER BY ds_Endereco DESC

-- 13. Liste todas as ofertas cujo imóvel seja 2 ou 3 e o valor da oferta seja maior que 140 mil, em ordem decrescente de data. 
SELECT * FROM Oferta WHERE cd_Imovel IN (2,3) AND vl_Oferta > 140000

-- 14. Liste todos os imóveis cujo preço de venda esteja entre 110 mil e 200 mil ou seja do vendedor 4 em ordem crescente de área útil.
SELECT * FROM Imovel WHERE (vl_Imovel BETWEEN 110000 AND 200000) OR cd_Vendedor = 4 ORDER BY qt_AreaUtil ASC

-- 15. Verifique a maior, a menor e o valor médio das ofertas desta tabela.
SELECT MAX(vl_Oferta) 'MAXIMO', MIN(vl_Oferta) 'MINIMO', AVG(vl_Oferta) 'MEDIO' FROM Oferta

-- 16. Mostre o maior, o menor, o total e a média de preço de venda dos imóveis.
SELECT MAX(vl_Imovel) 'MAXIMO', MIN(vl_Imovel) 'MINIMO', SUM(vl_Imovel) 'TOTAL', AVG(vl_Imovel) 'MEDIO' FROM Imovel

-- 17. Faça uma busca que retorne o total de ofertas realizadas nos anos de 2008, 2009 e 2010. 
SELECT COUNT(*) 'TOTAL DE OFERTAS' FROM Oferta WHERE YEAR(dt_Oferta) BETWEEN 2008 AND 2010