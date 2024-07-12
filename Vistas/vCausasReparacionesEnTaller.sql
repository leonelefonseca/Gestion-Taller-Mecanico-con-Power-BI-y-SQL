USE [Mantenimientos]
GO

DROP VIEW IF EXISTS vCausasReparacionesEnTaller
GO

CREATE VIEW dbo.vCausasReparacionesEnTaller
AS
SELECT 
	ct.IdReparacionTaller
	,ec.Descripcion
	,ct.Observaciones
	--2724,c.IdSegmento
	--2724,c.Linea
	--2724,c.PosicionEnLinea
	--2724,ret.PosicionEnSegmento
	--2724,CAST(ret.Fecha AS DATE) FechaReparacion
	--2724,CAST(c.FechaSegmentoInstalado AS DATE) FechaSegmentoInstalado
	--2724,CAST(c.FechaSegmentoRetirado AS DATE) FechaSegmentoRetirado
FROM
	[dbo].[tbCampaniaCausasReparacionEnTaller] ct
	--2724LEFT JOIN [dbo].[tbCampaniaReparacionesEnTaller] ret
		--2724ON ct.IdReparacionTaller = ret.Id
	--2724LEFT JOIN [dbo].[tbCampania] c
		--2724ON c.Id = ret.IdCampania
	LEFT JOIN [dbo].[tbTipoEventoCausa] ec
		ON ct.IdTipoEventoCausa = ec.Id
GO
