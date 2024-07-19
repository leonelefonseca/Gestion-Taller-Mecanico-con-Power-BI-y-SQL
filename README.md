
# Dashboard para la Gestión de un Taller de Mantenimiento en la Industria Siderúrgica  

Con esta herramienta, creada utilizando SQL Server y Power BI, se evalua el desempeño de los equipos que componen la Máquina de Colada Continua (MCC) y que son reparados en este Taller de Mantenimiento, teniendo en cuenta los eventos externos que los afectan, las acciones correctivas que se les realizan y las alteraciones operativas que generan durante la operación en la MCC. También se muestran las causas de fallas más frecuentes y las soluciones a estas problemáticas.
De esta manera se participa en la gestión de Mantenimiento del Taller con el objetivo final de aumentar la vida en servicio de los equipos y/o su confiabilidad durante la operación.


## Tabla de Contenidos

- [Introducción](#introduccion)
    - [Planteo del Problema](#planteodelproblema)
    - [Stakeholders](#stakeholders)
    - [Requerimientos](#requerimientos)
    - [Criterios de Aceptación](#criteriosdeaceptacion)
- [Desarrollo](#desarrollo)
    - [Prerrequisitos](#prerrequisitos)
    - [Instalación](#instalacion)
    - [Análisis de datos con SSMS](#analisisdedatosconssms)
    - [Modelo Analítico de datos](#modeloanaliticodedatos)
- [Screenshots](#screenshots)
- [Otros Recursos](#Otrosrecursos)
- [Autor](#autores)


## Introducción

La creación de este dashboard surge debido a la necesidad de mejorar los reportes existentes, pasando de reportes estáticos en Excel y Power Point a este tipo de informes dinámicos.

### Planteo del problema

Se necesita contar con un panorama general de la gestión del taller, donde se muestre la vida en servicio promedio de equipos en comparación con la vida programada y la vida teórica de manual. Además, se requiere evaluar el cumplimiento del presupuesto en relación a la cantidad de cambios de equipos estimados por año fiscal.

Así también resulta importante poder evaluar la cantidad (disponibilidad) y la calidad de las reparaciones realizadas en el taller a través de la medición de las alteraciones operativas generadas por un incorrecto funcionamiento de estos equipos, de los eventos externos que los afectaron y de las intervenciones de mantenimiento realizadas sobre éstos durante su operación en la MCC.

Por último, se requiere visualizar los distintos tipos de fallas encontradas, cuáles fueron las más relevantes y qué acciones se tomaron para remediarlas con el objetivo final de aumentar la vida en servicio de los equipos y/o su confiabilidad.

### Stakeholders

- Gerente del área
- Jefe del Taller
- Ingeniero de mantenimiento

### Requerimientos

- Gerente del Área:
    - Un dashboard con la performance general del taller que permita evaluar la vida media alcanzada, el cumplimiento del presupuesto y la calidad de reparaciones.

- Jefe del Taller:
    - Un detalle de las alteraciones operativas generadas por los equipos que son reparados en el Taller que permita determinar los tipos de alteraciones más relevantes, las posiciones de la máquina más afectadas y los grupos de equipos críticos.
    - Un detalle de los eventos externos que afectaron la performance de los equipos que permita determinar cuáles fueron los grupos más afectados, las posiciones críticas y los tipos de eventos externos más frecuentes.
    - Un resumen de las intervenciones de mantenimiento que se realizaron sobre los equipos durante su operación que permita determinar cuáles fueron los sistemas, los grupos de equipos y las posiciones de la máquinas más intervenidos.
    - Un reporte de la disponibilidad de equipos brindada por el Taller que permita determinar la cantidad y calidad de las reparaciones.

- Ingeniero de Mantenimiento:
    - Un detalle de las causas de cambio de equipos que permita determinar los tipos más frecuentes.
    - Un reporte de las propuestas de mejora que permita llevar un control de la ejecución y el avance de las tareas pautadas.

### Criterios de aceptación

- Facilitar el proceso de toma de decisiones por parte del equipo de gestión del Taller para lograr incrementar la vida en servicio de los equipos que ahí se reparan.
- Reemplazar los informes estáticos por dashboards dinámicos, de manera de evitar la carga manual de datos y ahorrar así tiempo valioso para el equipo de trabajo.
- Dashboards:
    - Performance general del Taller, evaluado por año fiscal
    - Total de horas por mes de alteraciones operativas que permita filtrar por grupo, por línea operativa de la máquina y que se muestre por año fiscal
    - Recuento mensual de eventos externos con la capacidad de filtrar por posición en la máquina, por línea de operación y por grupo de equipos
    - Recuento mensual de intervenciones de mantenimiento con la capacidad de filtrar por posición, línea y grupo, mostrando los sistemas más intervenidos.
    - Recuento de cada tipo de falla por año fiscal con la capacidad de filtrar por posición, grupo y tipo de falla
    - Detalle de cada propuesta de mejora con su correspondiente avance durante el año fiscal con un filtro por grupo.


## Desarrollo

### Prerrequisitos

Se necesita contar con:
- Microsoft Power BI Desktop 2.127.1327.0
- SQL Server Management Studio v18.8 (SSMS)

### Instalación
    
- Descargar el archivo `Mantenimientos.bacpac` con el esquema y los datos de la base de datos.
- Importar la base de datos en SSMS haciendo click derecho sobre `Databases` y elegir `Import Data-tier Application...` del menú desplegable.

### Análisis de datos usando SSMS

En la base de datos se observa lo siguiente:
- Las tablas obtenidas de la base de datos del cliente. 
- La tabla calendario con su Stored Procedure correspondiente, necesaria para el análisis. Ver el archivo [tablaCalendario.sql](https://github.com/leonelefonseca/Gestion-Taller-de-Mantenimiento-con-Power-BI-y-SQL/blob/main/Tabla%20Calendario/tablaCalendario.sql).
- La función para tomar el grupo de a partir del nombre del equipo. Ver el archivo [Funciones.sql](https://github.com/leonelefonseca/Gestion-Taller-de-Mantenimiento-con-Power-BI-y-SQL/blob/main/Funciones/Funciones.sql).
- Las vistas para extraer solo aquellos datos necesarios para el análisis, permitiendo exportar los datos a la herramienta de visualización que se utilice (en este caso Power BI) y también para la gestión de permisos a otros usuarios en caso de ser necesario. Ver los archivos [Vistas](https://github.com/leonelefonseca/Gestion-Taller-de-Mantenimiento-con-Power-BI-y-SQL/tree/main/Vistas).

### Modelo Analítico de Datos

- Se conecta Power BI con las vistas generadas en SSMS y se confecciona el modelo analítico de datos del tipo Header Details.
![Model](/images/ModeloAnalitico1.png)


## Screenshots

![Dashboard Screenshot](/images/Screenshots/1.General.png)
![Dashboard Screenshot](/images/Screenshots/2.AlteracionesOperativas.png)
![Dashboard Screenshot](/images/Screenshots/3.EventosExternos.png)
![Dashboard Screenshot](/images/Screenshots/4.IntervencionesDeMantenimiento.png)
![Dashboard Screenshot](/images/Screenshots/5.Disponibilidad.png)
![Dashboard Screenshot](/images/Screenshots/6.ABCDeFallas.png)
![Dashboard Screenshot](/images/Screenshots/7.PropuestasDeMejora.png)


## Otros Recursos

- [readme.so](https://readme.so)
- [keepachangelog.com](https://keepachangelog.com/es-ES/1.1.0/)
- [Versionado Semántico](https://semver.org/lang/es/)
- [Storytelling With Data](https://www.storytellingwithdata.com/)


## Autores

Hecho por [Leonel Fonseca](www.linkedin.com/inleonel-edgardo-fonseca-76637a161)
