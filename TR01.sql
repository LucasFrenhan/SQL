-- Lucas Frenhan

-- criação de banco de dados
CREATE DATABASE [Exercicio]
GO

USE [Exercicio]
GO

-- criação da tabela vendedor
CREATE TABLE [Vendedor](
	[cd_Vendedor] INT NOT NULL,
	[nm_Vendedor] VARCHAR(40) NULL,
	[ds_Endereco] VARCHAR(40) NULL,
	[cd_CPF] DECIMAL(11) NULL,
	[nm_Cidade] VARCHAR(20) NULL,
	[nm_Bairro] VARCHAR(20) NULL,
	[sg_Estado] CHAR(2) NULL,
	[cd_Telefone] VARCHAR(20) NULL,
	[ds_Email] VARCHAR(80) NULL
)
GO

-- criação da tabela estado
CREATE TABLE [Estado](
	[sg_Estado] CHAR(2) NOT NULL,
	[nm_Estado] VARCHAR(20) NULL
)
GO

-- criação da tabela cidade
CREATE TABLE [Cidade](
	[cd_Cidade] INT NOT NULL,
	[sg_Estado] CHAR(2) NOT NULL,
	[nm_Cidade] VARCHAR(20) NULL
)
GO

-- criação da tabela bairro
CREATE TABLE [Bairro](
	[cd_Bairro] INT NOT NULL,
	[cd_Cidade] INT NOT NULL,
	[sg_Estado] CHAR(2) NOT NULL,
	[nm_Bairro] VARCHAR(20) NULL
)
GO

-- criação da tabela oferta
CREATE TABLE [Oferta](
	[cd_Comprador] INT NOT NULL,
	[cd_Imovel] INT NOT NULL,
	[vl_Oferta] MONEY NULL,
	[dt_Oferta] DATE NULL
)
GO

-- criação da tabela faixa imovel
CREATE TABLE [Faixa_Imovel](
	[cd_Faixa] INT NOT NULL,
	[nm_Faixa] VARCHAR(30) NULL,
	[vl_Maximo] MONEY NULL,
	[vl_Minimo] MONEY NULL
)
GO

-- criação da tabela comprador
CREATE TABLE [Comprador](
	[cd_Comprador] INT NOT NULL,
	[nm_Comprador] VARCHAR(40) NULL,
	[ds_Endereco] VARCHAR(40) NULL,
	[cd_CPF] DECIMAL(11) NULL,
	[nm_Cidade] VARCHAR(20) NULL,
	[nm_Bairro] VARCHAR(20) NULL,
	[sg_Estado] VARCHAR(2) NULL,
	[cd_Telefone] VARCHAR(20) NULL,
	[ds_Email] VARCHAR(80) NULL
)
GO

-- criação da tabela imovel
CREATE TABLE [Imovel](
	[cd_Imovel] INT NOT NULL,
	[cd_Vendedor] INT NOT NULL,
	[cd_Bairro] INT NOT NULL,
	[cd_Cidade] INT NOT NULL,
	[sg_Estado] CHAR(2) NULL,
	[ds_Endereco] VARCHAR (40) NULL,
	[qt_AreaUtil] DECIMAL(10,2) NULL,
	[qt_AreaTotal] DECIMAL (10,2) NULL,
	[ds_Imovel] VARCHAR (300) NULL,
	[vl_Imovel] MONEY NULL,
	[qt_Ofertas] INT NULL,
	[ic_Vendido] CHAR(1) NULL,
	[dt_Lancto] DATE NULL,
	[qt_ImovelIndicado] INT NULL
)
GO

-- atribuindo chave primária para faixa imóvel
ALTER TABLE [Faixa_Imovel]
	ADD CONSTRAINT [PK_cd_Faixa] PRIMARY KEY([cd_Faixa])
GO

-- atribuindo chave primária para estado
ALTER TABLE [Estado]
	ADD CONSTRAINT [PK_sg_Estado] PRIMARY KEY([sg_Estado])
GO

-- atribuindo chave primária e estrangeira para cidade
ALTER TABLE [Cidade]
	ADD CONSTRAINT [FK_sg_Estado] 
		FOREIGN KEY([sg_Estado])
			REFERENCES [Estado]([sg_Estado]),
	CONSTRAINT [PK_Cidade] PRIMARY KEY ([cd_Cidade], [sg_Estado])
GO

-- atribuindo chave primária para comprador
ALTER TABLE [Comprador]
	ADD CONSTRAINT [PK_cd_Comprador] PRIMARY KEY([cd_Comprador])
GO

-- atribuindo chave primária para vendedor
ALTER TABLE [Vendedor]
	ADD CONSTRAINT [PK_cd_Vendedor] PRIMARY KEY([cd_Vendedor])
GO

-- atribuindo chave primária e estrangeira para bairro
ALTER TABLE [Bairro]
ADD CONSTRAINT [FK_cd_Cidade]
		FOREIGN KEY([cd_Cidade], [sg_Estado])
			REFERENCES [Cidade]([cd_Cidade], [sg_Estado]),
	
	 CONSTRAINT [PK_Bairro] PRIMARY KEY([cd_Bairro], [cd_Cidade], [sg_Estado])
GO

-- atribuindo chave primária e estrangeira para imovel
ALTER TABLE [Imovel]
	ADD CONSTRAINT [FK_cd_Vendedor] 
		FOREIGN KEY([cd_Vendedor])
			REFERENCES [Vendedor]([cd_Vendedor]),

		CONSTRAINT [FK_Bairro] 
			FOREIGN KEY([cd_Bairro], [cd_Cidade], [sg_Estado])
				REFERENCES [Bairro]([cd_Bairro], [cd_Cidade], [sg_Estado]),

		CONSTRAINT [PK_Imovel] PRIMARY KEY ([cd_Imovel])
GO

-- atribuindo chave primária e estrangeira para oferta
ALTER TABLE [Oferta]
	ADD CONSTRAINT [FK_cd_Comprador] 
		FOREIGN KEY([cd_Comprador])
			REFERENCES [Comprador]([cd_Comprador]),

		CONSTRAINT [FK_cd_Imovel] 
		FOREIGN KEY([cd_Imovel])
			REFERENCES [Imovel]([cd_Imovel]),
		
		CONSTRAINT [PK_Oferta] PRIMARY KEY([cd_Comprador], [cd_Imovel])
GO
