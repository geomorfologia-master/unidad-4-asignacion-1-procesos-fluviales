Introducción a rgrass7, interfaz entre GRASS GIS 7 y R. Crear región de GRASS
================

<!-- Este .md fue generado a partir del .Rmd homónimo. Edítese el .Rmd -->
Paquetes
--------

Sólo necesitamos el paquete `rgrass7` (R. Bivand, Krug, Neteler, Jeworutzki, & Bivand, 2019)

``` r
library(rgrass7)
## Loading required package: XML
## GRASS GIS interface loaded with GRASS version: (GRASS not running)
```

Región de GRASS
---------------

![](../img/organizacion-grass-gis.jpg) Organización de directorio, localidad, conjuntos de mapas, capas vectoriales y ráster, según M. Neteler & Mitasova (2007)

``` r
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

Más información:

-   [GRASS GIS for geomorphologists. Andrew Wickert](https://github.com/awickert/GRASS-GIS-for-geomorphologists)

-   [Geomorphology in GRASS GIS. A 'how-to' manual. Skyler Sorsby](https://es.slideshare.net/SkylerSorsby/introduction-to-geomorphology-in-grass-gis-by-skyler-sorsby)

-   [Funciones creadas por el profesor](https://github.com/geofis/rgrass)

-   [Lista de recursos de pago](https://grass.osgeo.org/documentation/books/)

Referencias
-----------

Bivand, R., Krug, R., Neteler, M., Jeworutzki, S., & Bivand, M. R. (2019). *Package “rgrass7”*.

Neteler, M., & Mitasova, H. (2007). *Open source gis: A grass gis approach*. Springer US.
