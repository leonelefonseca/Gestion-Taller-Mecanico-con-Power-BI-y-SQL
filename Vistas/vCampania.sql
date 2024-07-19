USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vCampania
GO

CREATE VIEW dbo.vCampania
AS
SELECT 
	c.Id
	,c.Identificador
	,c.IdSegmento
	,CAST(c.FechaSegmentoInstalado AS DATE) AS FechaSegmentoInstalado
	,CAST(c.FechaSegmentoRetirado AS DATE) AS FechaSegmentoRetirado --ver si es necesario
	,CAST(c.FechaSegmentoDisponibleEnStock AS DATE) AS FechaSegmentoDisponible
	,c.TnProcesadasFinCampania AS TnProcesadasFinCampania
	,c.TnProgramadas AS TnProgramadas
	,CAST(c.TnProcesadasFinCampania/s.TnsVidaEstimada AS DECIMAL(20,2)) RazonTnProcesadasVsTnEstandar
	,CASE 
		WHEN c.TnProgramadas <> 0 THEN CAST(c.TnProcesadasFinCampania/c.TnProgramadas AS DECIMAL(20,2))
		ELSE 1
	END AS RazonTnProcesadasVsTnProgramadas
	,c.Linea
	,c.PosicionEnLinea
	,CASE 
		WHEN c.TnProgramadas IN (100000,300000,500000,600000) THEN 'Nuevo'
		WHEN c.TnProgramadas = 0 THEN 'No Reparado'
		ELSE 'Recuperado'
	END AS CondicionInicial
FROM 
	[dbo].[tbCampania] c
	LEFT JOIN [dbo].[tbSegmento] s
		ON c.IdSegmento = s.Id
GO
