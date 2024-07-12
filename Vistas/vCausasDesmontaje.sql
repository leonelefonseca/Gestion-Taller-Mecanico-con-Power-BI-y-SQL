USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vCausasDesmontaje
GO

CREATE VIEW dbo.vCausasDesmontaje
AS
SELECT 
	cd.Id
	,cd.IdCampania
	--2724,c.IdSegmento
	--2724,c.Linea
	--2724,c.PosicionEnLinea
	--2724,CAST(c.FechaSegmentoRetirado AS DATE) FechaSegmentoRetirado
	,ec.Descripcion
	--2724,CAST(c.FechaSegmentoInstalado AS DATE) FechaSegmentoInstalado
	,cd.Observaciones
FROM
	[dbo].[tbCampaniaCausasDesmontajeSegmento] cd
	--2724LEFT JOIN [dbo].[tbCampania] c
		--2724ON c.Id = cd.IdCampania
	LEFT JOIN [dbo].[tbTipoEventoCausa] ec
		ON cd.IdTipoEventoCausa = ec.Id
GO
