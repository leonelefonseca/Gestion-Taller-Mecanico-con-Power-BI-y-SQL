USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vPropuestasDeMejora
GO

CREATE VIEW dbo.vPropuestasDeMejora
AS
SELECT
	p.Id
	--2724,p.IdReparacion
	--2724,r.IdComponente
	,c.IdSegmento
	--2724,r.IdCampania
	--2724,r.PosicionEnSegmento
	--2724,CAST(r.Fecha AS DATE) FechaReparacion
	,CAST(p.Fecha AS DATE) FechaDePropuesta
	,ec.Descripcion
	,p.Observaciones
	,r.Diagnostico
	,r.AnalisisDeFalla
	,p.PropuestaDeMejora
FROM
	[dbo].[tbPropuestasDeMejora] p
	LEFT JOIN [dbo].[tbCampaniaReparacionesEnTaller] r
		ON p.IdReparacion = r.Id
	LEFT JOIN [dbo].[tbTipoEventoCausa] ec
		ON p.IdTipoEventoCausa = ec.Id
	LEFT JOIN [dbo].[tbCampania] c
		ON r.IdCampania = c.Id
GO
