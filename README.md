
<!-- Este .md fue generado a partir del .Rmd homónimo. Edítese el .Rmd -->

# Geomorfología. Asignaciones del tema 4: procesos fluviales. Parte 1

Por José Ramón Martínez Batlle
[![DOI](https://zenodo.org/badge/248094883.svg)](https://zenodo.org/badge/latestdoi/248094883)

Entrada BibTeX, [aquí](#entrada-bibtex)

## Léeme

Dentro de las opciones de `knitr`, en el encabezado de este archivo, es
probable que encuentres el argumento `eval = F`. Antes de tejer debes
cambiarlo a `eval = T`, para que evalúe los bloques de código según tus
cambios.

## Recursos en línea sobre GRASS GIS para geomorfología

[GRASS GIS for geomorphologists. Andrew
Wickert](https://github.com/awickert/GRASS-GIS-for-geomorphologists)

[Geomorphology in GRASS GIS. A ‘how-to’ manual. Skyler
Sorsby](https://es.slideshare.net/SkylerSorsby/introduction-to-geomorphology-in-grass-gis-by-skyler-sorsby)

[Funciones creadas por el profesor](https://github.com/geofis/rgrass)

[Lista de recursos de
pago](https://grass.osgeo.org/documentation/books/)

## Datos asignados a cada estudiante

### Coordenadas de desembocadura de cuenca

``` r
 # abreviatura     coordenada de desembocadura (EPSG:32619)
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
 #       danie     mi-asignacion/data-asignada/demyds.tif
```

### Límites de cuencas vectorizados

``` r
 # abreviatura     ruta de archivo DEM
 #       anala     mi-asignacion/data-asignada/cuenca_rio_yaque_del_norte.geojson
 #       carol     mi-asignacion/data-asignada/cuenca_rio_bao.geojson
 #       danie     mi-asignacion/data-asignada/cuenca_rio_yaque_del_sur.geojson     
```

## Ejercicios

### Ejercicio 1: Crea una región de GRASS. Redacta de forma resumida el procedimiento, cita ventajas/desventajas

[**Vídeo de
referencia**](https://www.youtube.com/watch?v=cORbTaa827g&list=PLDcT2n8UzsCSt1-NnUQ8anwHhmouFr0Kv&index=5)

[**Script de referencia**](intro-a-rgrass.md)

Dentro del bloque de código a continuación, carga el paquete `rgrass7` y
crea una región de GRASS GIS utilizando los atributos correspondientes
en cada parámetro:

  - Ruta de inicio (parámetro `home`): `mi-asignacion`

  - Nombre del directorio de la base de datos de GRASS GIS (parámetro
    `gisDbase`): utiliza `mi-asignacion/mi-grass`

  - Nombre de localidad (parámetro `location`): usa la abreviatura de
    nombre geográfico que te tocó.

  - Nombre del conjunto de mapas (parámetro `mapset`): utiliza
    `PERMANENT`

> **IMPORTANTE**. Asegúrate que tus parámetros no tengan espacios,
> signos de puntuación, o tildes.

  - Verifica la metadata de tu región con la función `gmeta`.

<!-- end list -->

``` r
loc <- initGRASS(gisBase = "/usr/lib/grass78/",
                 home = '...',
                 gisDbase = '...',
                 location = '...',
                 mapset = '...',
                 override = TRUE)
```

*Describe, en un párrafo, usando tus propias palabras, el procedimiento
que acabas de ejecutar. Si aplica, en un párrafo adicional, plantea las
ventajas y desventajas de usar GRASS desde
R*

### EJERCICIO 2: Define resolución/extensión utilizando una fuente. Redacta de forma resumida el procedimiento

[**Vídeo de
referencia**](https://www.youtube.com/watch?v=YkqHMeko8-Y&list=PLDcT2n8UzsCSt1-NnUQ8anwHhmouFr0Kv&index=6)

[**Script de referencia**](proyeccion-importar-fuente-extension.md)

Escribe el código necesario para definir la proyección de tu región de
GRASS creada en el ejercicio anterior, usando como referencia tu DEM
asignado. Usa el vídeo de referencia para conocer los pasos necesarios.
El procedimiento general consiste en:

  - Sin importarlo (aún), usa tu DEM para definir la proyección de la
    región de GRASS (addon `g.proj`).

  - Importa el DEM (addon `r.in.gdal`).

  - Utilízalo para definir la extensión y resolución de la región de
    GRASS (addon `g.region`)

  - Verifica la metadata de tu región con la función `gmeta`.

*Describe, en un párrafo, usando tus propias palabras, el procedimiento
que acabas de
ejecutar*

### EJERCICIO 3: Explora y compara mapas de GRASS y R. Interpreta el resultado

[**Vídeo de
referencia**](https://www.youtube.com/watch?v=w5lGrm_XKek&list=PLDcT2n8UzsCSt1-NnUQ8anwHhmouFr0Kv&index=7)

[**Script de referencia**](explorar-mapas-de-grass-en-R.md)

Explora y compara mapas de pendientes generados en R y en GRASS. Usa el
vídeo de referencia para conocer los pasos necesarios. El procedimiento
general consiste en:

  - Antes que nada, explora qué mapas están disponibles en tu región de
    GRASS mediante el addon `g.list`.

  - **En R**:
    
      - Carga los paquetes `sp` y `raster`, y ejecuta la función
        `use_sp()`; esto preparará a R para definir que los mapas de
        GRASS que importes con el paquete `rgrass7` serán objetos
        `Spatial*` y `Raster*`.
      - Importa el DEM desde la región de GRASS mediante la función
        `readRAST`. Convierte tu DEM a raster con la función `raster`
        (puedes también hacerlo en un único paso ejecutando
        `raster(readRAST(...))`). Representa tu raster con la función
        `plot`.
      - Importa tu límite de cuenca a R. Para ello, carga el paquete
        `sf`, importa el archivo del límite de tu cuenca con la función
        `st_read`. Represéntalo con la función `plot` pero añadiendo el
        argumento `add=T`, para que se superponga sobre el DEM.
      - Usando el límite de cuenca, corta el DEM con la función `crop`,
        y enmascáralo con `mask`.
      - Genera un mapa de pendiente en R a partir del DEM con la función
        `terrain` del paquete `raster`.
      - Finalmente, representa el mapa de pendiente con `plot`, e
        igualmente haz un histograma de dicha variable y calcula sus
        estadísticos descriptivos básicos con `summary`. Compararás el
        mapa y los estadísticos de pendiente con los resultados que
        obtengas en GRASS.

  - **En GRASS (recuerda, “desde R”)**. Lleva tu límite de cuenca a la
    región de GRASS y úsalo como máscara. Genera un mapa de pendiente, y
    tráelo a R. Te recomiendo el siguiente procedimiento:
    
      - Lleva tu límite de cuenca a la región (vectorial formato
        GeoJSON) de GRASS mediante la función `writeVECT`.
      - Define los límites de la región de GRASS usando dicho vectorial
        mediante el addon `g.region`.
      - Utiliza el vectorial como máscara de la región mediante el addon
        `r.mask`.
      - Utiliza el addon `r.slope.aspect` para crear un mapa de
        pendientes a partir del DEM.
      - Trae el mapa raster de pendientes generado en GRASS a R mediante
        `raster(readRAST(...))`.
      - Represéntalo mediante la función `plot`.

> **Nota sobre la máscara**. Si al ejecutar el addon `g.list` uno de los
> mapas de denomina `raster/MASK`, como en el ejemplo a continuación,
> quiere decir que hay una máscara aplicada, con lo que todos los
> algoritmos se ejecutan únicamente dentro de dicha área.

``` r
execGRASS(
  'g.list',
  flags = 't',
  parameters = list(
    type = c('raster', 'vector')
  )
)
raster/MASK
...
```

  - **En R nuevamente**. Compara los estadísticos descriptivos de los
    dos mapas de pendiente, es decir, del generado en R y del generado
    en GRASS, mediante la función `summary`. Genera también un
    histograma de los valores de pendiente (función `hist`), así como
    dos mapas de pendiente mediante la función `plot`. Para colocar
    ambos histogramas o ambos mapas enfrentados, usa
    `par(mfrow=c(1,2))`, de manera que tu dispositivo gráfico quedará
    dividido en dos columnas en lo adelante. Si deseas volver a ponerlo
    en modo 1 columna, ejecuta `par(mfrow=c(1,1))`. Teniendo los
    histogramas y los mapas enfrentados, podrás interpretar mejor tus
    resultados.

  - **En GRASS desde R**. No olvides volver a poner la región de GRASS a
    su estado anterior, quitando la máscara (addon `r.mask`) y
    utilizando la extensión del DEM como límite de la región (addon
    `g.region`). Puedes comprobar que no hay máscara aplicada si al
    ejecutar el addon `g.list` NO te aparece el mapa `raster/MASK`.

*Tu párrafo interpretativo debajo de esta línea. Algunas preguntas
clave: ¿Hay diferencias? ¿Son significativas? ¿Notas diferencias entre
ambos mapas de pendiente en algunas áreas más que en otras?*

### EJERCICIO 4: Extrae el límite de tu cuenca hidrográfica. Descríbelo

[**Vídeo de referencia sobre
`r.watershed`**](https://www.youtube.com/watch?v=gPDf6w3NOgs&list=PLDcT2n8UzsCSt1-NnUQ8anwHhmouFr0Kv&index=8)

[**Script de referencia sobre
`r.watershed`**](https://github.com/geomorfologia-master/unidad-4-asignacion-1-procesos-fluviales/blob/master/calcular-parametros-hidrograficos-r-watershed.Rmd)

[**Vídeo de referencia sobre
`r.water.outlet`**](https://www.youtube.com/watch?v=gPDf6w3NOgs&list=PLDcT2n8UzsCSt1-NnUQ8anwHhmouFr0Kv&index=9)

[**Script de referencia sobre
`r.water.outlet`**](https://github.com/geomorfologia-master/unidad-4-asignacion-1-procesos-fluviales/blob/master/crear-una-cuenca-con-r-water-outlet.Rmd)

  - Usando el addon de GRASS `r.watershed`, genera un mapa de dirección
    de drenaje. Lo necesitarás para generar el mapa de cuenca en el
    siguiente paso. Es posible hacer lo propio con el addon
    `r.stream.extract`.

  - Ejecuta el addon `r.water.outlet` para generar el límite de tu
    cuenca, usando el mapa de dirección generado en el paso anterior,
    especificando las coordenadas de desembocadura de tu cuenca. La
    salida del módulo (parámetro `output`), es un mapa ráster donde el
    área de tu cuenca tiene valor 1.

  - Vectoriza tu límite de cuenca en GRASS mediante el módulo
    `r.to.vect`.

  - Define los límites de la región de GRASS usando dicho vectorial
    mediante el addon `g.region`.

  - Utiliza el vectorial como máscara de la región mediante el addon
    `r.mask`.

> **Nota**. Puedes conservar tu región de GRASS con la máscara actual,
> de manera que todos tus análisis, desde este ejercicio en adelante, se
> referirán únicamente a tu cuenca asignada. Por lo tanto, NO quites la
> máscara, consérvala para futuros ejercicios. Para comprobar si hay o
> no máscara aplicada, ejecuta el addon `g.list`; si te aparece el mapa
> `raster/MASK`, significa que la hay.

  - Haz un plot de tu cuenca sobre el DEM. Para ello, primero representa
    el DEM mediante la función `plot` (el DEM fue importado a R en
    ejercicios anteriores, por lo que puedes usar el objeto ya creado o
    ejecutar nuevamente el código que lo importó).

  - Importa el límite de tu cuenca a R con la función `readVECT`, y
    luego superpones dicho límite al DEM mediante
    `plot(<nombredelvectorial>, add=T)` (el argumento `add` es la
    clave).

  - Haz también un mapa de tu cuenca con la función `mapview` del
    paquete homónimo.

*Describe, en términos morfométricos, el límite de tu cuenca y abunda
sobre ella. Algunas preguntas guía: ¿Qué forma tiene? ¿A qué atribuyes
su forma? ¿Es importante esta cuenca? ¿Por
qué?*

### EJERCICIO 5: Extrae la red de drenaje de tu cuenca utilizando dos umbrales de acumulación distintos. Describe e interpreta los resultados.

[**Vídeo de
referencia**](https://www.youtube.com/watch?v=17MRQTJ4gUU&list=PLDcT2n8UzsCSt1-NnUQ8anwHhmouFr0Kv&index=10)

[**Script de referencia **](extraer-red-de-drenaje-con-r-stream.Rmd)

Usando el addon de GRASS `r.stream.extract`, realiza las siguientes
tareas:

> **Recuerda**. Si conservaste la región de GRASS y la máscara que
> estableciste en el ejercicio anterior, los nuevos mapas que generes se
> referirán únicamente a tu cuenca asignada. Para saber si tu región
> tiene máscara aplicada ejecuta el addon `g.list`.

  - Genera dos mapas **vectoriales** de red de drenaje, uno con un
    umbral de acumulación de 30 celdas y otro con 80. Tendrás que
    ejecutar el addon dos veces, en cada corrida especificando nombres
    de salida diferentes para cada red (te sugiero usar los sufijos `30`
    y `80` para los nombres de salida de las redes correspondientes)

  - Importa ambas redes a R (función `readVECT`, por ejemplo: `red30 <-
    readVECT('red30')` y lo mismo para `red80`) y represéntalas (por
    separado) con la función básica `plot` (necesitarás correr dos veces
    las funciones `readVECT` y `plot`). Para colocar ambos mapas
    enfrentados, usa `par(mfrow=c(1,2))`, de manera que tu dispositivo
    gráfico quedará dividido en dos columnas en lo adelante. Si deseas
    volver a ponerlo en modo 1 columna, ejecuta `par(mfrow=c(1,1))`

  - Para visualizar mejor tus redes usando el paquete `leaflet`, crea un
    mapa donde cada red sea una capa. ¿Cómo hacerlo?
    
      - Los mapas anteriores, transfórmalos al CRS EPSG:4326 para
        poderlos cargar a `leaflet`. Por ejemplo, `red30` se
        transformaría así `red30ll <- spTransform(red30, CRSobj =
        CRS("+init=epsg:4326"))`. El sufijo `ll` fue añadido en alusión
        a lat/lon, pero puedes usar cualquier otro nombre nuevo.
      - Carga `library(leaflet)`
      - Ejecuta `leaflet`, añade `Stamen.Terrain` como proveedor de
        fondo, añade (usando la pipa `%>%`) cada red transformada con
        `addPolylines` (ver vídeo y script de referencia) y finalmente
        añade un botón que te permita activar y desactivar cada red. En
        este mapa podrás hacer zoom en distintas áreas y tendrás más
        control del mapa.

*Describe tus dos redes de drenaje e interprétalas. Algunas preguntas
guía: En dos líneas, ¿cómo describirías tus dos redes? ¿Cuál es/son
la/s diferencia/s principales entre ambas redes, es decir, entre la
generada con umbral 30 y la generada con 80? Clasifica tu tipo de red
según morfología, apoyándote en el material de apoyo de la clase
(e.g. dendrítica, paralela, etc.) (Gutiérrez Elorza, 2008; Pedraza
Gilsanz, 1996).*

## Entrada BibTeX

    @software{jose_ramon_martinez_batlle_2021_4425878,
      author       = {José Ramón Martínez Batlle},
      title        = {{geomorfologia-master/unidad-4-asignacion-1 
                       -procesos-fluviales: Let's map}},
      month        = jan,
      year         = 2021,
      publisher    = {Zenodo},
      version      = {v0.0.0.9000},
      doi          = {10.5281/zenodo.4425878},
      url          = {https://doi.org/10.5281/zenodo.4425878}
    }

# Referencias

<div id="refs" class="references">

<div id="ref-gutierrez2008geomorfologia">

Gutiérrez Elorza, M. (2008). *Geomorfología*.

</div>

<div id="ref-pedraza1996geomorfologia">

Pedraza Gilsanz, J. de. (1996). *Geomorfología: Principios, métodos y
aplicaciones*.

</div>

</div>
