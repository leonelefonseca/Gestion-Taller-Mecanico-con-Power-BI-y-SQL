USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vProduccionDiaria
GO

CREATE VIEW dbo.vProduccionDiaria
AS
SELECT
	Id
	,Linea
	,CAST(Fecha AS DATE) Fecha
	,TnProcesadas
FROM
	[dbo].[tbProduccionDiaria]
WHERE
	IdMaquina = 2 AND Fecha <= '2020-11-08'
GO

