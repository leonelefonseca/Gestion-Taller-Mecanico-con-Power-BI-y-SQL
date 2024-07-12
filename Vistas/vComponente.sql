USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vComponente
GO

DROP VIEW IF EXISTS dbo.vComponente
GO

CREATE VIEW dbo.vComponente
AS
SELECT
	c.Id
	,c.Identificador
	,f.Nombre NombreFamilia
	,t.Id Tipo
	,t.Informacion1
	,c.Estado
	,c.FechaDescarteComponente
	,t.Codigo
FROM
	[dbo].[tbComponente] c
	LEFT JOIN [dbo].[tbFamilia] f
		ON c.IdFamilia = f.Id
	LEFT JOIN [dbo].[tbTipoComponente] t
		ON c.IdTipo = t.Id
GO

select * from tbTipoComponente