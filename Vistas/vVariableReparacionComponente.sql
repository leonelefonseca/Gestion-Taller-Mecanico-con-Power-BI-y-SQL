USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vVariableReparacionComponente
GO

CREATE VIEW dbo.vVariableReparacionComponente
AS
SELECT
	cv.IdReparacionTaller
	--,cv.IdVariable
	,v.Nombre
	,cv.Valor
	,r.IdComponente
	,r.IdCampania
	,r.PosicionEnSegmento
	--,CAST(r.Fecha AS DATE) FechaReparacion
	,c.IdSegmento
	,c.Linea
	,CAST(c.FechaSegmentoInstalado AS DATE) FechaSegmentoInstalado
	,CAST(c.FechaSegmentoRetirado AS DATE) FechaSegmentoRetirado
	,c.PosicionEnLinea
FROM
	[dbo].[tbCampaniaVariableReparacionComponente] cv
	LEFT JOIN [dbo].[vReparacionesEnTaller] r
		ON cv.IdReparacionTaller = r.Id
	LEFT JOIN [tbCampania] c
		ON r.IdCampania = c.Id
	LEFT JOIN [dbo].[tbVariable] v
		ON cv.IdVariable = v.Id
WHERE r.Id IS NOT NULL
GO
