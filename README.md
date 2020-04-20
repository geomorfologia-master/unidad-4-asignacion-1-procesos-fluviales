
<!-- Este .md fue generado a partir del .Rmd homónimo. Edítese el .Rmd -->
Geomorfología. Asignaciones del tema 4: procesos fluviales
==========================================================

Léeme
-----

Dentro de las opciones de `knitr`, en el encabezado de este archivo, es probable que encuentres el argumento `eval = F`. Antes de tejer debes cambiarlo a `eval = T`, para que evalúe los bloques de código según tus cambios.

Recursos en línea sobre GRASS GIS para geomorfología
----------------------------------------------------

[GRASS GIS for geomorphologists. Andrew Wickert](https://github.com/awickert/GRASS-GIS-for-geomorphologists)

[Geomorphology in GRASS GIS. A 'how-to' manual. Skyler Sorsby](https://es.slideshare.net/SkylerSorsby/introduction-to-geomorphology-in-grass-gis-by-skyler-sorsby)

[Funciones creadas por el profesor](https://github.com/geofis/rgrass)

[Lista de recursos de pago](https://grass.osgeo.org/documentation/books/)

Datos asignados a cada estudiante
---------------------------------

### Coordenadas de desembocaduras de cuencas

``` r
 # abreviatura     coordenadas de desembocaduras (EPSG:32619)
 #       anala     311450,2109960
 #       carol     292900,2124790
 #       danie     288280,2093570
```

### Nombres geográficos

``` r
 # abreviatura     nombre geográfico                     abreviatura de nombre geográfico
 #       anala     Río Yaque del Norte, hasta Manabao    rioydn
 #       carol     Río Bao, hasta Mata Grande            riobao
 #       danie     Río Yaque del Sur, hasta P. Palomino  rioyds
```

### DEMs

``` r
 # abreviatura     ruta de archivo DEM
 #       anala     mi-asignacion/data-asignada/demydn.tif
 #       carol     mi-asignacion/data-asignada/dembao.tif
```

### Límites de cuencas vectorizados

``` r
 # abreviatura     ruta de archivo DEM
 #       anala     mi-asignacion/data-asignada/cuenca_rio_yaque_del_norte.geojson
 #       carol     mi-asignacion/data-asignada/cuenca_rio_bao.geojson
```

Ejercicios
----------

### Ejercicio 1: Crea una región de GRASS

[**Vídeo de referencia**](https://www.youtube.com/watch?v=cORbTaa827g&list=PLDcT2n8UzsCSt1-NnUQ8anwHhmouFr0Kv&index=5)

[**Script de referencia**](intro-a-rgrass.md)

Dentro del bloque de código a continuación, carga el paquete `rgrass7` y crea una región de GRASS GIS utilizando los atributos correspondientes en cada parámetro:

-   Ruta de inicio (parámetro `home`): `mi-asignacion`
-   Nombre del directorio de la base de datos de GRASS GIS (parámetro `gisDbase`): utiliza `mi-asignacion/mi-grass`
-   Nombre de localidad (parámetro `location`): usa la abreviatura de nombre geográfico que te tocó.
-   Nombre del conjunto de mapas (parámetro `mapset`): utiliza `PERMANENT`

**IMPORTANTE**. Asegúrate que tus parámetros no tengan espacios, signos de puntuación, o tildes.

``` r
loc <- initGRASS(gisBase = "/usr/lib/grass78/",
                 home = '...',
                 gisDbase = '...',
                 location = '...',
                 mapset = '...',
                 override = TRUE)
```

### EJERCICIO 2: Define resolución/extensión utilizando una fuente

[**Vídeo de referencia**](https://www.youtube.com/watch?v=YkqHMeko8-Y&list=PLDcT2n8UzsCSt1-NnUQ8anwHhmouFr0Kv&index=6)

[**Script de referencia**](proyeccion-importar-fuente-extension.md)

Escribe el código necesario para definir la proyección de tu región de GRASS creada en el ejercicio anterior, usando como referencia tu DEM asignado. Importa dicha fuente (tu DEM) a la región de GRASS, y utilízala para definir su extensión y resolución.

### EJERCICIO 3: Explora y compara mapas de GRASS y R

[**Vídeo de referencia**](https://www.youtube.com/watch?v=w5lGrm_XKek&list=PLDcT2n8UzsCSt1-NnUQ8anwHhmouFr0Kv&index=7)

[**Script de referencia**](explorar-mapas-de-grass-en-R.md)

Escribe el código necesario para hacer las siguientes tareas:

-   **En R**. Importa a R tu DEM asignado, primero mediante `readRAST` y luego convirtiéndolo a objeto `raster` de R con la función del mismo nombre (también se podría leer desde tu archivo de DEM con la función `raster`). A continuación, usa tu límite de cuenca asignado como máscara de dicho DEM. Luego, genera un mapa de pendiente en R a partir del objeto DEM con la función correspondiente del paquete `raster`. Representa dicha variable (pendiente) en un histograma.

-   **En GRASS desde R**. Lleva tu límite de cuenca a la región de GRASS y úsalo como máscara. Genera un mapa de pendiente, y tráelo a R.

-   **En R nuevamente**. Compara los estadísticos descriptivos de los dos mapas de pendiente, es decir, del generado en R y del generado en GRASS.

*Tu párrafo interpretativo debajo de esta línea*

### EJERCICIO 4: Extrae el límite de tu cuenca hidrográfica

[**Vídeo de referencia sobre `r.watershed`**]()

[**Vídeo de referencia sobre r.water.outlet**]()

[**Script de referencia**]()

-   Usando el addon de GRASS `r.watershed`, generar un mapa de dirección de drenaje.

``` r
source(
  knitr::purl(
    'borrar.Rmd',
    output=tempfile()
  )
)

execGRASS(
  'g.list',
  flags = 't',
  parameters = list(
    type = c('raster', 'vector')
  )
)

execGRASS(
   "r.watershed",
   flags = c('overwrite','quiet'),
   parameters = list(
     elevation = 'dem',
     # threshold = 80,
     drainage = 'direccion'
   )
)

execGRASS(
   "r.water.outlet",
   flags = c('overwrite','quiet'),
   parameters = list(
     input = 'direccion',
     output = 'cuenca',
     coordinates = c(311450,2109960)
   )
)
library(raster)
use_sp()
cuenca <- raster(readRAST('cuenca'))
plot(cuenca)
```

-   

### EJERCICIO 5: Extrae la red de drenaje de tu DEM

[**Vídeo de referencia**](https://www.youtube.com/watch?v=17MRQTJ4gUU&list=PLDcT2n8UzsCSt1-NnUQ8anwHhmouFr0Kv&index=10)

[**Script de referencia **](extraer-red-de-drenaje-con-r-stream.Rmd)

Usando el addon de GRASS `r.stream.extract`, realiza las siguientes tareas:

-   Genera dos mapas **vectoriales** de red de drenaje, uno con un umbral de acumulación de 30 celdas y otro de 80. Tendrás que ejecutar el addon dos veces, en cada corrida especificando nombres de salida diferentes para cada red (te sugiero usar los sufijos `30` y `80` para los nombres de salida de las redes correspondientes)

-   Importa ambas redes a R (función `readVECT`, por ejemplo: `red30 <- readVECT('red30')` y lo mismo para `red80`) y represéntalas (por separado) con la función básica `plot` (necesitarás correr dos veces las funciones `readVECT` y `plot`).

-   Alternativamente, crea dos mapas usando `mapview`: uno para la red de 30 celdas de umbral de acumulación y otro para la de 80. ¿Cómo hacerlo?

    -   Carga `library(mapview)`
    -   Supongamos que el mapa de 30 celdas de umbral en la región de GRASS se denomina `red30`
    -   Tráelo a R mediante `red30 <- readVECT('red30')`
    -   Finalmente, `mapview(red30, zcol='cat', legend = FALSE)`. Esto te permitirá visualizar tu mapa con distintos niveles de zoom.
    -   Luego haces lo propio con el de 80.

-   Interpreta las diferencias/similitudes.

*Tu párrafo interpretativo debajo de esta línea*

Referencias
===========
