
# Léeme

Dentro de las opciones de `knitr`, en el encabezado de este archivo, es
probable que encuentres el argumento `eval = F`. Antes de tejer debes
cambiarlo a `eval = T`, para que evalúe los bloques de código según tus
cambios.

# Asignaciones a cada estudiante

## Corte asignado para el ejercicio 1 *Datación relativa usando la elevación topográfica y la edad de las rocas*

``` r
 # abreviatura         corte                         ruta
 #       anala        corte2       data/cortes/corte2.kml
 #       carol        corte3       data/cortes/corte3.kml
 #       danie        corte1       data/cortes/corte1.kml
```

## Isótopo asignado para el ejercicio 2 *Datación absoluta a partir del porcentaje isotópico remanente* y el ejercicio 3 *Vida media y semivida (periodo de semidesintegración) isotópica*

``` r
 # abreviatura      istótopo
 #       anala    Carbono 14  
 #       carol    Berilio 10
 #       danie   Aluminio 26
```

## Datos de cuencas asginadas para el ejercicio 4 *Tasa de denudación*

``` r
# abrev  tamaño (km cuad.)  densidad rocas (g por cm cúbicos)  tasa transporte sed (kg/año)
# anala             478.71                               2.69                103,435,298.45
# carol             532.13                               2.45                148,569,784.32
# danie             296.46                               3.02                 87,489,625.26
```

## Muestras de clastos asignadas para el ejercicio 5 *Tamaños de clastos de tipos de rocas comunes en distintos tramos de río*

``` r
# abreviatura            codigo_lugar
# anala             GJRC_02 y LPRO_03
# carol             RBAH_01 y LPRO_01
# danie             AVAV_01 y LPRO_02
```

# Unidad 2. Tiempo en geomorfología

  - Datación relativa usando la elevación topográfica y la edad de las
    rocas.
  - Datación absoluta a partir del porcentaje isotópico remanente.
  - Vida media y semivida (periodo de semidesintegración) isotópica.

Para fines de referencia, la presentación correspondiente a este tema se
encuentra alojada
[aquí](https://drive.google.com/file/d/1I7kNCS3oj5NpXsinVGaIZAezsZCAyRqI/view).

Adicionalmente, consulta el capítulo 6 de Anderson & Anderson
(2010)

## EJERCICIO 1: Datación relativa usando la elevación topográfica y la edad de las rocas

Propón una secuencia evolutiva del relieve intersectado por tu corte.
Indica edades utilizando períodos del mapa geológico.

> ¿Sirve de algo que yo escriba aquí *tips*=plepla, o mejor explico de
> viva voz? Fijo que será esto último.

En cualquier caso, tienes dos alternativas:

  - Utilizado GoogleEarth. Descarga el mapa geológico alojado
    [aquí](https://drive.google.com/open?id=1iLYmhiFq2cowuelKqAsI506Z2AYhBxFJ)
    y cárgalo en GoogleEarth. Posteriormente, descarga tu corte asignado
    (la ruta se encuentra arriba) y colócalo encima del mapa geológico.
    En GoogleEarth Tienes la ventaja de que lo puedes visualizar en 3D
    con relativa facilidad.

  - Utilizando QGIS. Descarga el mapa geológico alojado
    [aquí](https://drive.google.com/open?id=1NKyZjxzIedFq6Lq0bx-2YrGq5PtMh_r7),
    cárgalo en QGIS. Descarga tu corte (la ruta se encuentra arriba) y
    colócalo encima del mapa geológico. Para visualizar elevaciones, te
    recomiendo cargar el OpenTopoMap desde el plugin QuickMapServices de
    QGIS. Alternativamente, puedes descargar el DEM SRTM 90-m de la isla
    desde el [EarthExplorer](https://earthexplorer.usgs.gov/)

*Tu párrafo interpretativo debajo de esta
línea*

## EJERCICIO 2: Datación absoluta a partir del porcentaje isotópico remanente

Enviaste una muestra al laboratorio, y te reportaron que el porcentaje
remanente de tu isótopo asignado es 36%. Usa la fórmula
N<sub>0</sub>=Ne<sup>-λt</sup> y la tabla 6.1 de Anderson & Anderson
(2010).

¿Qué edad aproximada tiene la muestra? Interpreta el resultado.

*Tu párrafo interpretativo debajo de esta
línea*

## EJERCICIO 3: Vida media y semivida (periodo de semidesintegración) isotópica

Calcula e interpreta, según lo que conoces sobre los métodos de
datación, la vida media y la semivida de tu isótopo asignado. La tabla
6.1 de Anderson & Anderson (2010) te muestra el valor esperado, pero
debes demostrar aquí cómo calcularlo.

*Tu párrafo interpretativo debajo de esta línea*

# Unidad 3. Meteorización y formas resultantes

  - Tasa de denudación.
  - Tamaños de clastos por tipo de roca.

Para fines de referencia, la presentación correspondiente a este tema se
encuentra alojada
[aquí](https://github.com/geomorfologia-master/tema-3-meteorizacion-y-formas-resultantes/blob/gh-pages/meteorizacion_y_formas_resultantes.pdf).

## EJERCICIO 4: Tasa de denudación

Cálcula la tasa de denudación anual y la denudación al cabo de 30 años,
de tu cuenca asignada (ver arriba). Realiza tu cálculo utilizando la
fórmula de la tasa de denudación (*Td*):

*Td = (TTS/A)/ρ*

donde *TTS* es la tasa de transporte de sedimentos, *A* es el área de la
cuenca y *ρ* es la densidad promedio de las rocas de la cuenca.

Interpreta tu resultado comparando con otros casos o respondiendo a
preguntas tales como "Si la *TTS*, *A* o *ρ* fuesen menores o mayores,
¿sería mayor o menor la *Td*?

IMPORTANTE: no olvides transformar las unidades a un sistema común.

*Tu párrafo interpretativo debajo de esta
línea*

## EJERCICIO 5: Tamaños de clastos de tipos de rocas comunes en distintos tramos de río

Como indicador indirecto del potencial erosivo, utiliza los datos de
muestras de clastos tomadas en la cuenca del río Ocoa, que se encuentran
alojados en `data/clastos/clastos.csv`. Compararás el tamaño de los
clastos de los tipos de rocas que sean comunes entre tus dos muestras
asignadas (filtra según el campo `codigo_lugar`). Cada muestra contiene,
aproximadamente, 100 clastos de distintos tipos de litologías medidos en
tres ejes: largo, ancho y espesor. Una de tus muestras representa el
tramo alto del río, la otra el tramo bajo; en el próximo párrafo te
indico cómo cargar la posición de los puntos de muestras. Compara si los
tamaños en el eje de anchura (campo `ancho_en_mm`) difieren
significativamente entre la muestra de tramo alto y la de tramo bajo.
Para ello, primero determina cuántos clastos de cada roca hay por cada
muestra, luego obtén la media de la anchura, y evalúa dónde dicha media
es mayor o menor, si en la muestra de tramo alto o en la de tramo bajo.
Utiliza una prueba estadística para determinar si se trata de una
diferencia significativa (eso de la significancia, ¿qué es? ¿sirve para
algo aún?) Interpreta el resultado.

Para que puedas visualizar las posiciones de las muestras, descarga el
archivo KML `data/clastos/posiciones_muestras.kml`, el cual contiene los
puntos de muestras. Cárgalo en QGIS o en GoogleEarth. Dado que la
densidad de puntos por unidad de área puede ser muy grande en
determinadas zonas, debes acercarte mucho para visualizar tus puntos
asignados.

*Tu párrafo interpretativo debajo de esta línea*

# Referencias

<div id="refs" class="references">

<div id="ref-anderson2010geomorphology">

Anderson, R. S., & Anderson, S. P. (2010). *Geomorphology: The mechanics
and chemistry of landscapes*. Cambridge University Press.

</div>

</div>
