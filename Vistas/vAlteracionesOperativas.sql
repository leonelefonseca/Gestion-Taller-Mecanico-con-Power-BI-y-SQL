USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vAlteracionesOperativas
GO

CREATE VIEW dbo.vAlteracionesOperativas
AS
SELECT 
	ao.Id
	,ao.IdCampania
	,c.Identificador
	--2724,c.IdSegmento
	--2724,c.Linea
	--2724,c.PosicionEnLinea
	,ec.Descripcion
	--,ao.Observaciones
	,CASE WHEN ao.Observaciones like ' - '
		THEN 'Sin datos'
		ELSE SUBSTRING(ao.Observaciones, 1, CHARINDEX('-', ao.Observaciones)-1)
	END as TipoDeAO
	,CASE WHEN ao.Observaciones like ' - '
		THEN 'Sin datos'
		ELSE SUBSTRING(ao.Observaciones, CHARINDEX('-', ao.Observaciones)+1, LEN(ao.Observaciones))
	END as Detalle
	,CAST(ao.Fecha AS DATE) AS Fecha
	,ao.Duracion
FROM 
	[dbo].[tbCampaniaAlteracionesOperativas] ao
	LEFT JOIN [dbo].[vCampania] c
		ON c.Id = ao.IdCampania
	LEFT JOIN [dbo].[tbTipoEventoCausa] ec
		ON ao.IdTipoEventoCausa = ec.Id
WHERE c.Id is not null
GO
