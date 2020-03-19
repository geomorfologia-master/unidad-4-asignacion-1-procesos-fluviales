Introducción a rgrass7, interfaz entre GRASS GIS 7 y R. Crear región de GRASS
================

<!-- Este .md fue generado a partir del .Rmd homónimo. Edítese el .Rmd -->
Paquete, región
---------------

Más información en [Introducción a rgrass7, interfaz entre GRASS GIS 7 y R. Crear región de GRASS](intro-rgrass.md)

``` r
library(rgrass7)
## Loading required package: XML
## GRASS GIS interface loaded with GRASS version: (GRASS not running)
gisdbase <- 'grass-data-test' #Base de datos de GRASS GIS
wd <- getwd() #Directorio de trabajo
wd
## [1] "/home/jr/unidad-4-asignacion-1-procesos-fluviales/scripts-de-referencia"
loc <- initGRASS(gisBase = "/usr/lib/grass78/",
                 home = wd,
                 gisDbase = paste(wd, gisdbase, sep = '/'),
                 location = 'rdom',
                 mapset = "PERMANENT",
                 override = TRUE)
```

Definir proyección
------------------

``` r
#Muestra la definición de la región
#Si sólo se ha ejecutado una sola vez, mostrará extensión y proyección indefinidas
gmeta()
## gisdbase    /home/jr/unidad-4-asignacion-1-procesos-fluviales/scripts-de-referencia/grass-data-test 
## location    rdom 
## mapset      PERMANENT 
## rows        1 
## columns     1 
## north       1 
## south       0 
## west        0 
## east        1 
## nsres       1 
## ewres       1 
## projection  NA

#Definir ruta del DEM
dem <- 'data/dem.tif'

#Definir la proyección de la región basada en DEM
execGRASS(
  "g.proj",
  flags = c('t','c'),
  georef=dem)
## Default region was updated to the new projection, but if you have multiple
## mapsets `g.region -d` should be run in each to update the region from the
## default
## Projection information updated

#Muestra la definición de la región modificada
gmeta()
## gisdbase    /home/jr/unidad-4-asignacion-1-procesos-fluviales/scripts-de-referencia/grass-data-test 
## location    rdom 
## mapset      PERMANENT 
## rows        895 
## columns     975 
## north       2122949 
## south       2042609 
## west        253740.1 
## east        341262.4 
## nsres       89.76646 
## ewres       89.76646 
## projection  +proj=utm +no_defs +zone=19 +a=6378137 +rf=298.257223563
## +towgs84=0.000,0.000,0.000 +to_meter=1
```

Importar fuente
---------------

``` r
#r.in.gdal importa la fuente a GRASS
execGRASS(
  "r.in.gdal",
  flags=c('overwrite','quiet'),
  parameters=list(
    input=dem,
    output="dem"
  )
)

#Actualizar la extensión de la región al DEM, sólo por precaución
execGRASS(
  "g.region",
  parameters=list(
    raster = "dem",
    align = "dem"
  )
)

#Muestra la definición de la región. Debe coincidir con la anterior
gmeta()
## gisdbase    /home/jr/unidad-4-asignacion-1-procesos-fluviales/scripts-de-referencia/grass-data-test 
## location    rdom 
## mapset      PERMANENT 
## rows        895 
## columns     975 
## north       2122949 
## south       2042609 
## west        253740.1 
## east        341262.4 
## nsres       89.76646 
## ewres       89.76646 
## projection  +proj=utm +no_defs +zone=19 +a=6378137 +rf=298.257223563
## +towgs84=0.000,0.000,0.000 +to_meter=1
```

Actualizar extensión de la región
---------------------------------

Referencias
-----------
