-- 1 
CREATE PROCEDURE AplicarAcrescimoPorBairro
	@NomeBairro VARCHAR(20),
	@PercentualAcrescimo DECIMAL(5,2)
AS
BEGIN
	UPDATE Imovel
	SET vl_Imovel = vl_Imovel * (1 + @PercentualAcrescimo / 100)
	WHERE cd_Bairro IN (
		SELECT cd_Bairro
		FROM Bairro
		WHERE nm_Bairro = @NomeBairro
	)
END

-- 2 
CREATE PROCEDURE AplicarAcrescimoUltimaOferta
	@CodigoComprador INT,
	@PercentualAcrescimo DECIMAL(5,2)
AS
BEGIN
	DECLARE @ValorImovel MONEY;
	DECLARE @ValorOferta MONEY;

	SELECT TOP 1 @ValorImovel = vl_Imovel
	FROM Imovel
	WHERE cd_Imovel IN (
		SELECT cd_Imovel
		FROM Oferta
		WHERE cd_Comprador = @CodigoComprador
		ORDER BY dt_Oferta DESC
	)
	ORDER BY dt_Lancto DESC;

	SELECT TOP 1 @ValorOferta = vl_Oferta
	FROM Oferta
	WHERE cd_Comprador = @CodigoComprador
	ORDER BY dt_Oferta DESC;

	IF (@ValorOferta >= (@ValorImovel * (1 + 0.10)))
	BEGIN
		RETURN;
	END

	UPDATE Oferta
	SET vl_Oferta = vl_Oferta * (1 + @PercentualAcrescimo / 100)
	WHERE cd_Comprador = @CodigoComprador
	AND vl_Oferta = @ValorOferta
END


-- 3 
CREATE PROCEDURE CalcularMediaOfertasPorImovel
AS
BEGIN
	UPDATE Imovel
	SET vl_MediaOfertas = (
		SELECT AVG(vl_Oferta)
		FROM Oferta
		WHERE Oferta.cd_Imovel = Imovel.cd_Imovel
	)
END

-- 4 
CREATE PROCEDURE AplicarAumentoImoveisBaixoIndice
	@ValorAumento MONEY
AS
BEGIN
	UPDATE Imovel
	SET vl_Imovel = vl_Imovel + @ValorAumento
	WHERE cd_Faixa IN (
		SELECT cd_Faixa
		FROM Faixa_Imovel
		WHERE nm_Faixa = 'BAIXO'
	)
END

-- 5 
CREATE PROCEDURE AplicarDescontoImoveisSP
	@PercentualDesconto DECIMAL(5,2)
AS
BEGIN
	UPDATE Imovel
	SET vl_Imovel = vl_Imovel - (vl_Imovel * (@PercentualDesconto / 100))
	WHERE sg_Estado = 'SP'
END

-- 6 
CREATE TABLE Parcelas (
    cd_Parcela INT NOT NULL,
    cd_Imovel INT NOT NULL,
    cd_Comprador INT NOT NULL,
    vl_Parcela MONEY NULL
);

CREATE PROCEDURE GerarParcelas
    @cd_Imovel INT,
    @QuantidadeParcelas INT
AS
BEGIN
    -- Verificar se o número de parcelas é válido
    IF @QuantidadeParcelas < 1 OR @QuantidadeParcelas > 10
    BEGIN
        RAISERROR('Quantidade de parcelas inválida.', 16, 1);
        RETURN;
    END;
    
    -- Verificar se a quantidade de parcelas é 1 (à vista)
    IF @QuantidadeParcelas = 1
    BEGIN
        PRINT 'Pedido à vista';
        RETURN;
    END;
    
    -- Calcular o valor total do pedido
    DECLARE @ValorTotal MONEY;
    SELECT @ValorTotal = vl_Imovel FROM Imovel WHERE cd_Imovel = @cd_Imovel;
    
    -- Verificar se a quantidade de parcelas é maior que 3 e aplicar o acréscimo
    IF @QuantidadeParcelas > 3
    BEGIN
        SET @ValorTotal = @ValorTotal * 1.10;
    END;
    
    -- Calcular o valor de cada parcela
    DECLARE @ValorParcela MONEY;
    SET @ValorParcela = @ValorTotal / @QuantidadeParcelas;
    
    -- Inserir as parcelas na tabela Parcelas
    DECLARE @cd_Parcela INT;
    SET @cd_Parcela = 1;
    
    WHILE @cd_Parcela <= @QuantidadeParcelas
    BEGIN
        INSERT INTO Parcelas (cd_Parcela, cd_Imovel, cd_Comprador, vl_Parcela)
        VALUES (@cd_Parcela, @cd_Imovel, @cd_Comprador, @ValorParcela);
        
        SET @cd_Parcela = @cd_Parcela + 1;
    END;
    
    PRINT 'Parcelas geradas com sucesso.';
END
