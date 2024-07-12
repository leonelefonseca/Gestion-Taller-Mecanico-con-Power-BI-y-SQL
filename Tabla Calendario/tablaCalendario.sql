USE [Mantenimientos]
GO

DROP TABLE IF EXISTS [dbo].[tbCalendario]
GO

-- Creación de la tabla en la base de datos
CREATE TABLE [dbo].[tbCalendario]
(
	[Fecha] [date],
	[NombreDia] [varchar](10),
	[NombreDiaCorto] [varchar](10),
	[NumDiaSemana] [int],
	[NumDiaMes] [int],
	[NumDiaAnio] [int],
	[NumSemanaAnio] [int],
	[NombreSemana] [varchar](20),
	[NombreMesCompleto] [varchar](20),
	[NombreMesCorto] [varchar](3),
	[NumMes] [int],
	[AnioCalendario] [int],
	[NumTrimestre] [int],
	[NombreTrimestre] [varchar](20),
	[NumSemestre] [int],
	[NombreSemestre] [varchar](20),
	[AnioFiscal] [varchar](20),
	[NumTrimestreFiscal] [int],
	[NombreTrimestreFiscal] [varchar](20),
	[NumMesFiscal] [int]
	CONSTRAINT PK_tbCalendario PRIMARY KEY CLUSTERED ([Fecha] ASC)
)
GO

DROP PROCEDURE IF EXISTS [dbo].[spGenerarFechas]
GO

-- Creación del Procedimiento almacenado
CREATE PROCEDURE dbo.spGenerarFechas
AS
	TRUNCATE TABLE [dbo].[tbCalendario];
	DECLARE @fechaInicio date;
	DECLARE @fechaFin date;
	DECLARE @nombreDia varchar(20);
	DECLARE @nombreDiaCorto varchar(3);
	DECLARE @numDiaSemana int;
	DECLARE @numDiaMes int;
	DECLARE @numDiaAnio int;
	DECLARE @numSemanaAnio int;
	DECLARE @nombreSemana varchar(20);
	DECLARE @nombreMesCompleto varchar(20);
	DECLARE @nombreMesCorto varchar(3);
	DECLARE @numMes int;
	DECLARE @anioCalendario int;
	DECLARE @numTrimestre int;
	DECLARE @nombreTrimestre varchar (20);
	DECLARE @numSemestre int;
	DECLARE @nombreSemestre varchar (20);
	DECLARE @anioFiscal varchar(20);
	DECLARE @numTrimestreFiscal int;
	DECLARE @nombreTrimestreFiscal varchar(20);
	DECLARE @numMesFiscal int;

	-- SET DATEFORMAT dmy
	SET DATEFIRST 1
	SET LANGUAGE spanish
	SET @fechaInicio = (SELECT DATEADD(yy, DATEDIFF(yy, 0, MIN(FechaSegmentoInstalado)), 0) FROM [dbo].[tbCampania]);
	SET @fechaFin = (SELECT DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) +1, -1));

	WHILE @fechaInicio <= @fechaFin
	BEGIN
		SET @nombreDia = DATENAME(dw, @fechaInicio);
		SET @nombreDiaCorto = LEFT(@nombreDia, 3);
		SET @numDiaSemana = DATEPART(dw, @fechaInicio);
		SET @numDiaMes = DATEPART(d, @fechaInicio);
		SET @numDiaAnio = DATEPART(dy, @fechaInicio);
		SET @numSemanaAnio = DATEPART(wk, @fechaInicio);
		SET @anioCalendario = DATEPART(yy, @fechaInicio);
		SET @nombreSemana = 'Sem ' + CAST(@numSemanaAnio AS CHAR(2)) + '/' + CAST(@anioCalendario as CHAR(4));
		SET @nombreMesCompleto = DATENAME(m, @fechaInicio);
		SET @nombreMesCorto = LEFT(@nombreMesCompleto, 3);
		SET @numMes = DATEPART(m, @fechaInicio);
		SET @numTrimestre = DATEPART(qq, @fechaInicio);
		SET @nombreTrimestre = 'T ' + CAST(@numTrimestre as char (1)) + '/' + CAST(@anioCalendario as CHAR(4));
		SET @numSemestre = CASE WHEN @numTrimestre <= 2 THEN 1 ELSE 2 END;
		SET @nombreSemestre = 'S ' + CAST(@numSemestre as char (1)) + '/' + CAST(@anioCalendario as CHAR(4));
		SET @anioFiscal = CASE WHEN @numSemestre = 1 THEN 
		'Año ' + RIGHT(CAST(@anioCalendario-1 as char(4)), 2) + '/' + RIGHT(CAST(@anioCalendario as char(4)), 2)
		ELSE 
		'Año ' + RIGHT(CAST(@anioCalendario as char(4)), 2) + '/' + RIGHT(CAST(@anioCalendario+1 as char(4)), 2)
		END;
		SET @numTrimestreFiscal = 
		CASE 
			WHEN @numTrimestre = 1 THEN 3
			WHEN @numTrimestre = 2 THEN 4
			WHEN @numTrimestre = 3 THEN 1
			ELSE 2
		END;
		SET @nombreTrimestreFiscal = 'T' + CAST(@numTrimestreFiscal AS CHAR(1)) + '-' + RIGHT(@anioFiscal,5);
		SET @numMesFiscal = CASE
			WHEN @numMes <= 6 THEN @nummes + 6
			ELSE @numMes - 6
		END;
		
		INSERT INTO [dbo].[tbCalendario] (
		[Fecha],
		[NombreDia],
		[NombreDiaCorto],
		[NumDiaSemana],
		[NumDiaMes],
		[NumDiaAnio],
		[NumSemanaAnio],
		[NombreSemana],
		[NombreMesCompleto],
		[NombreMesCorto],
		[NumMes],
		[AnioCalendario],
		[NumTrimestre],
		[NombreTrimestre],
		[NumSemestre],
		[NombreSemestre],
		[AnioFiscal],
		[NumTrimestreFiscal],
		[NombreTrimestreFiscal],
		[NumMesFiscal])
		SELECT @fechaInicio,
		@nombreDia,
		@nombreDiaCorto,
		@numDiaSemana,
		@numDiaMes,
		@numDiaAnio,
		@numSemanaAnio,
		@nombreSemana,
		@nombreMesCompleto,
		@nombreMesCorto, 
		@numMes,
		@anioCalendario,
		@numTrimestre,
		@nombreTrimestre, 
		@numSemestre,
		@nombreSemestre, 
		@anioFiscal,
		@numTrimestreFiscal,
		@nombreTrimestreFiscal,
		@numMesFiscal;

		SET @fechaInicio = DATEADD(DAY, 1, @fechaInicio)
	END;
GO 

EXEC dbo.spGenerarFechas
GO

select * from dbo.tbCalendario	
GO
















