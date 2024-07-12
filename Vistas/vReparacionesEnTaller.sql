USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vReparacionesEnTaller
GO

CREATE VIEW dbo.vReparacionesEnTaller
AS
SELECT 
	r.Id
	,r.IdComponente
	,r.IdCampania
	--2724,c.IdSegmento
	--2724,c.Linea
	--2724,c.PosicionEnLinea
	,r.PosicionEnSegmento
	--2724,CAST(c.FechaSegmentoInstalado AS DATE) FechaSegmentoInstalado
	--2724,CAST(c.FechaSegmentoRetirado AS DATE) FechaSegmentoRetirado
	--2724,CAST(r.Fecha AS DATE) FechaReparacion
	,r.Accion
	,r.IdComponenteNuevo
	,r.Observaciones
	--2724,r.Diagnostico
	--2724,r.AnalisisDeFalla
FROM
	[dbo].[tbCampaniaReparacionesEnTaller] r
	LEFT JOIN [dbo].[vCampania] c
		ON c.Id = r.IdCampania
WHERE c.Id IS NOT NULL
GO

