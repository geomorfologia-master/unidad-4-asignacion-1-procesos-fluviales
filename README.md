
Geomorfología. Tema 4. Procesos fluviales
=========================================

Dos notas
---------

### Léeme

Dentro de las opciones de `knitr`, en el encabezado de este archivo, es probable que encuentres el argumento `eval = F`. Antes de tejer debes cambiarlo a `eval = T`, para que evalúe los bloques de código según tus cambios.

### Funciones para facilitar la realización de los ejercicios

``` r
scripts <- c(
  'plotgrass.R',
  'integerextent.R',
  'xyvector.R',
  'comparerasters.R',
  'lfp_network.R',
  'lfp_network_merge.R',
  'lfp_profiles_concavity.R',
  'lfp_profiles_concavity_for_any_network.R',
  'integral_hypsometric_curve.R',
  'pT.R',
  'tts_polar_plot.R',
  'transverse_topographic_symmetry.R',
  'sources_for_transverse_topographic_symmetry.R'
  )
ghsource <- paste('https://raw.githubusercontent.com/geofis/rgrass/master/')
invisible(purrr::map(
    paste0(ghsource, scripts),
    devtools::source_url)
)
```

Recursos en línea sobre GRASS GIS para geomorfología
----------------------------------------------------

[GRASS GIS for geomorphologists. Andrew Wickert](https://github.com/awickert/GRASS-GIS-for-geomorphologists)

[Geomorphology in GRASS GIS. A 'how-to' manual. Skyler Sorsby](https://es.slideshare.net/SkylerSorsby/introduction-to-geomorphology-in-grass-gis-by-skyler-sorsby)

[Funciones creadas por el profesor](https://github.com/geofis/rgrass)

[Lista de recursos de pago](https://grass.osgeo.org/documentation/books/)

Asignaciones a cada estudiante
------------------------------

### Coordenadas de cuencas asignadas para ejercicio 1

``` r
 # abreviatura         corte                         ruta
 #       anala        corte2       data/cortes/corte2.kml
 #       carol        corte3       data/cortes/corte3.kml
 #       danie        corte1       data/cortes/corte1.kml
```

Ejercicios
----------

### Ejercicio 0: Crea una región de GRASS GIS

[**Vídeo de referencia**]()

[**Script de referencia**](scripts-de-referencia/region-de-grass.md)

Dentro del bloque de código a continuación, carga el paquete `rgrass7` y crea una región de GRASS GIS utilizando los atributos correspondientes, que incluyen: nombre del directorio de la base de datos de GRASS GIS, nombre de localidad y el nombre del conjuntos de mapas. Todos estos nombres pueden elegirse libremente, pero dado que todos se convertirán en carpetas, considera lo siguiente: 1) No uses espacios, ni signos de puntuación, ni tildes; 2) Utiliza nombres con sentido, por ejemplo, para el nombre de localización es apropiado usar un topónimo.

### EJERCICIO 1: Extracción de una cuenca hidrográfica

[**Vídeo de referencia**]()

[**Script de referencia**](scripts-de-referencia/)

*Tu párrafo interpretativo debajo de esta línea*

Referencias
===========
