USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vTipoCausa
GO

CREATE VIEW dbo.vTipoCausa
AS
SELECT 
	ec.Id
	,ec.Descripcion
	,ec.Modulo
FROM
	[dbo].[tbTipoEventoCausa] ec
WHERE 
	IdFamilia = 1
GO