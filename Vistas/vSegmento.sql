USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vSegmento
GO

CREATE VIEW dbo.vSegmento
AS
SELECT 
	Id
	,Identificador
	--,IdMaquina
	,'Seg. ' + [dbo].[fnGrupoSegmento](Identificador) Grupo
	,TnsVidaEstimada
FROM
	[dbo].[tbSegmento]
GO

