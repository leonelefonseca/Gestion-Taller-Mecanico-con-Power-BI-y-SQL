USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vEventosExternos
GO

CREATE VIEW dbo.vEventosExternos
AS
SELECT
	e.Id
	,CAST(e.Fecha AS DATE) FechaEvento
	,ec.Descripcion
	--2724,e.Linea
	,e.Observaciones
	--2724,c.Identificador
	,c.Id IdCampania
	--2724,c.IdSegmento
	--2724,CAST(c.FechaSegmentoInstalado AS DATE) FechaSegmentoInstalado
	--2724,CAST(c.FechaSegmentoRetirado AS DATE) FechaSegmentoRetirado
	--2724,c.PosicionEnLinea
FROM
	[dbo].[tbEventosExternos] e
	LEFT JOIN [dbo].[tbTipoEventoCausa] ec
		ON e.IdTipoEvento = ec.Id
	LEFT JOIN [dbo].[vCampania] c
		ON e.IdCampania = c.Id
WHERE c.Id IS NOT NULL
GO