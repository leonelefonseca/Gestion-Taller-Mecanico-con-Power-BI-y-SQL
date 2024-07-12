-- CREAR VISTAS PARA EXPORTAR LOS DATOS A POWER BI
USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vCampania
GO

CREATE VIEW dbo.vCampania
AS
SELECT 
	c.Id
	,c.Identificador
	,IdSegmento
	,CAST(FechaSegmentoInstalado AS DATE) AS FechaSegmentoInstalado
	,CAST(FechaSegmentoRetirado AS DATE) AS FechaSegmentoRetirado --ver si es necesario
	,CAST(FechaSegmentoDisponibleEnStock AS DATE) AS FechaSegmentoDisponible
	,TnProcesadasFinCampania -- o categoría de valor alcanzado
	,TnProgramadas
	--2724,s.TnsVidaEstimada
	,CAST(c.TnProcesadasFinCampania/s.TnsVidaEstimada AS DECIMAL(20,2)) RazonTnProcesadasVsTnEstandar
	,CASE 
		WHEN TnProgramadas <> 0 THEN CAST(TnProcesadasFinCampania/TnProgramadas AS DECIMAL(20,2))
		ELSE 1
	END AS RazonTnProcesadasVsTnProgramadas
	--2724,1 Unidad
	/*2724,CASE 
		WHEN TnProgramadas <> 0 AND TnProcesadasFinCampania/TnProgramadas >= 0.95 THEN 'SI'
		ELSE 'NO'
	END AS VidaObjetivoAlcanzada --VER si realmente se necesita*/
	/*,CASE 
		WHEN TnProgramadas <> 0 AND TnProcesadasFinCampania/TnProgramadas <= 0.30 THEN 'Menor al 30%'
		WHEN TnProgramadas <> 0 AND TnProcesadasFinCampania/TnProgramadas <= 0.60 THEN 'Del 30% al 60%'
		WHEN TnProgramadas <> 0 AND TnProcesadasFinCampania/TnProgramadas <= 0.95 THEN 'Del 60% al 95%'
		WHEN TnProgramadas <> 0 AND TnProcesadasFinCampania/TnProgramadas > 0.95 THEN 'Mayor al 95%'
		ELSE 'No reparado'
	END AS CategoriaVida --VER si realmente se necesita*/
	--,IdMaquina
	,c.Linea
	,c.PosicionEnLinea
	,CASE 
		WHEN TnProgramadas IN (750000,450000,150000,900000) THEN 'Nuevo'
		WHEN TnProgramadas = 0 THEN 'No Reparado'
		ELSE 'Recuperado'
	END AS CondicionInicial
FROM 
	[dbo].[tbCampania] c
	LEFT JOIN [dbo].[tbSegmento] s
		ON c.IdSegmento = s.Id
WHERE FechaSegmentoRetirado IS NOT NULL
GO
