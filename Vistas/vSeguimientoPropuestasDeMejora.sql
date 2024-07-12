USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vSeguimientoPropuestasDeMejora
GO

CREATE VIEW dbo.vSeguimientoPropuestasDeMejora
AS
SELECT
	sp.Id
	,sp.IdPropuesta
	,CAST(sp.Fecha AS DATE) Fecha
	,e.Estado
	,sp.Observaciones
	--2724,p.IdReparacion
	--2724,CAST(p.FechaDePropuesta AS DATE) FechaInicioPropuesta
	--2724,p.IdSegmento
	--2724,p.PropuestaDeMejora
	--2724,p.Descripcion
	--2724,p.IdComponente
	--2724,p.IdCampania
	--2724,p.PosicionEnSegmento
	--2724,p.FechaReparacion
FROM
	[dbo].[tbSeguimientoPropuestasDeMejora] sp
	LEFT JOIN [dbo].[tbEstadoPropuestaMejora] e
		ON sp.Estado = e.Id
	LEFT JOIN (SELECT * FROM [dbo].[vPropuestasDeMejora]) p
		ON p.Id = sp.IdPropuesta
GO