USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vCalendario
GO

CREATE VIEW dbo.vCalendario
AS
SELECT
	Fecha
	,NombreDiaCorto
	,NumDiaSemana
	,NumSemanaAnio
	,NombreMesCorto
	,NumMes
	,AnioCalendario
	,NumTrimestre
	,NombreTrimestre
	,NumSemestre
	,NombreSemestre
	,AnioFiscal
	,NumTrimestreFiscal
	,NombreTrimestreFiscal
	,NumMesFiscal
FROM
	[dbo].[tbCalendario]
GO