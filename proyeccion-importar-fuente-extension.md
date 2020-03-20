Definir proyección de la región de GRASS GIS, importar fuente y utilizarla para definir extensión y resolución. Cómo ver la ayuda de las funciones
================

<!-- Este .md fue generado a partir del .Rmd homónimo. Edítese el .Rmd -->
<!-- ## Retomar región de GRASS GIS creada en pasos previos -->
Definir proyección basado en una fuente externa, en este caso, el DEM MERIT
---------------------------------------------------------------------------

-   [Fuente del DEM](http://hydro.iis.u-tokyo.ac.jp/~yamadai/MERIT_DEM/)

``` r
#Muestra la definición de la región
#Si no se ha definido antes, la región mostrará extensión y proyección indefinidas
gmeta()
## gisdbase    /home/jr/unidad-4-asignacion-1-procesos-fluviales/grass-data-test 
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
  cmd = 'g.proj',
  flags = c('t','c'),
  georef=dem)
## Default region was updated to the new projection, but if you have multiple
## mapsets `g.region -d` should be run in each to update the region from the
## default
## Projection information updated

#Muestra la definición de la región modificada
gmeta()
## gisdbase    /home/jr/unidad-4-asignacion-1-procesos-fluviales/grass-data-test 
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
## +towgs84=0.000,0.000,0.000 +type=crs +to_meter=1
```

Importar mapa raster
--------------------

``` r
#r.in.gdal importa la fuente a GRASS
execGRASS(
  cmd = 'r.in.gdal',
  flags=c('overwrite','quiet'),
  parameters=list(
    input=dem,
    output='dem'
  )
)
```

Actualizar la extensión de la región al DEM, sólo por precaución
----------------------------------------------------------------

``` r
execGRASS(
  cmd = 'g.region',
  parameters=list(
    raster = 'dem',
    align = 'dem'
  )
)
```

Mostrar la definición de la región
----------------------------------

``` r
gmeta()
## gisdbase    /home/jr/unidad-4-asignacion-1-procesos-fluviales/grass-data-test 
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
## +towgs84=0.000,0.000,0.000 +type=crs +to_meter=1
```

Para completar, importar un mapa vectorial también
--------------------------------------------------

``` r
demext <- 'data/dem-extension.geojson'
execGRASS(
  cmd = 'v.in.ogr',
  flags=c('overwrite','quiet'),
  parameters=list(
    input=demext,
    output='dem_extent'
  )
)
```

Imprimir lista de mapas ráster y vectoriales dentro en la región/localización activa
------------------------------------------------------------------------------------

``` r
execGRASS(
  'g.list',
  flags = 't',
  parameters = list(
    type = c('raster', 'vector')
  )
)
## raster/dem
## vector/dem_extent
```

Ver los addons disponibles en el repositorio oficial de GRASS GIS, incluyendo descripción
-----------------------------------------------------------------------------------------

``` r
execGRASS(
  cmd = 'g.extension',
  flags = 'c'
)
## d.explanation.plot - Draw a plot of multiple rasters to explain a raster operation for example a + b = c
## d.frame - Manages display frames on the user's graphics monitor.
## d.mon2 - Starts a graphics display monitor which can be controlled from the command line.
## d.vect.colbp - Draws the boxplot of values in a vector attribute column
## d.vect.colhist - Draws the histogram of values in a vector attribute column
## d.vect.thematic2 - Displays thematic map created from vector features and numeric attributes.
## db.join - Joins a database table to another database table.
## g.citation - Provide scientific citation for GRASS modules and add-ons.
## g.cloud - Connects a local GRASS GIS session to another one in a cluster system.
## g.compare.md5 - Checks if two GRASS GIS maps are identical.
## g.copyall - Copies all or a filtered subset of files of selected type from another mapset to the current working mapset.
## g.download.location - Download GRASS Location from the web Get GRASS Location from an URL or file path
## g.isis3mt - Generates an ISIS3 map template file according to the current GRASS GIS coordinate reference system.
## g.proj.all - Reprojects raster and vector maps from given location and mapset to current mapset.
## g.proj.identify - Autoidentifies EPSG code from WKT CRS definition.
## g.rename.many - Renames multiple maps in the current mapset.
## i.ann.maskrcnn - 
## i.cutlines - Creates semantically meaningful tile borders
## i.cva - Performs Change Vector Analysis (CVA) in two dimensions.
## i.destripe - Destripes regularly, about vertical, striped image using Fourier.
## i.eb.deltat - Computes the difference of temperature between surface skin temperature and air temperature at 2m as part of sensible heat flux calculations.
## i.eb.hsebal95 - Performs sensible heat flux iteration (SEBAL 95).
## i.eb.z0m - Computes momentum roughness length (z0m) and surface roughness for heat transport (z0h) after Bastiaanssen (2004).
## i.eb.z0m0 - Computes momentum roughness length (z0m) and surface roughness for heat transport (z0h) after Bastiaanssen (2004).
## i.edge - Canny edge detector.
## i.evapo.potrad - Potential evapotranspiration, radiative method after Bastiaanssen (1995)
## i.evapo.senay - Actual evapotranspiration, method after Senay (2007)
## i.evapo.zk - Computes global evapotranspiration calculation after Zhang, Kimball, Nemani and Running formulation, 2010.
## i.feotio2 - Calculates the FeO or TiO2 contents from the Clementine project Moon data.
## i.fusion.brovey - Brovey transform to merge multispectral and high-res panchromatic channels.
## i.fusion.hpf - 
## i.gcp - Manages Ground Control Points (GCPs) non-interactively.
## i.gravity - Bouguer gravity anomaly computation (full slab).
## i.histo.match - Calculate histogram matching of several images.
## i.image.bathymetry - Estimates Satellite Derived Bathymetry (SDB) from multispectral images.
## i.in.probav - Imports PROBA-V NDVI data in netCDF format into a raster map with real NDVI data range.
## i.landsat8.qc - Reclassifies Landsat8 QA band according to acceptable pixel quality as defined by the user.
## i.landsat8.swlst - Practical split-window algorithm estimating Land Surface Temperature from Landsat 8 OLI/TIRS imagery (Du, Chen; Ren, Huazhong; Qin, Qiming; Meng, Jinjie; Zhao, Shaohua. 2015)
## i.lmf - Performs Temporal Local Maximum Fitting of vegetation indices, works also for surface reflectance data.
## i.lswt - Computes Lake Surface Water Temperatures (inland water bodies) from TOA Brightness Temperatures.
## i.modis - 
## i.nightlights.intercalibration - 
## i.ortho.corr - Corrects orthophoto taking part of the adjacent orthophotos using a camera angle map.
## i.points.auto - Generate ground control points for image group to be rectified.
## i.pr - 
## i.pysptools.unmix - Extract endmembers from imagery group and perform spectral unmixing using pysptools
## i.rh - Water in atmosphere: relative humidity, water vapour (saturated, actual)
## i.rotate - Rotates the image around the centre of the computational window
## i.sar.speckle - Remove speckle from SAR image
## i.segment.gsoc - Outputs a single segmented map (raster) based on input values in an image group.
## i.segment.hierarchical - 
## i.segment.stats - Calculates statistics describing raster areas.
## i.segment.uspo - Unsupervised segmentation parameter optimization
## i.sentinel - 
## i.signature.copy - Copies signature file from a group/subgroup to another group/subgroup.
## i.signature.list - Lists signature file of a group/subgroup.
## i.signature.remove - Removes signature file in a group/subgroup.
## i.spec.sam - Performs Spectral angle mapping on satellite/aerial images
## i.spec.unmix - Performs Spectral mixture analysis of satellite/aerial images
## i.superpixels.slic - Perform image segmentation using the SLIC segmentation method.
## i.theilsen - 
## i.variance - Analyses variation of variance with variation of resolution
## i.vi.mpi - 
## i.water - Water detection from satellite data derived indices, 1 if found, 0 if not
## i.wavelet - Decompostion/Recomposition in temporal dimension using wavelets
## i.wi - Calculates different types of water indices.
## m.gcp.filter - Filter Ground Control Points (GCPs).
## m.printws - Opens a workspace file and creates a map sheet according to its visible contents.
## r.accumulate - Calculates weighted flow accumulation, stream networks, and the longest flow path using a flow direction map.
## r.agent - 
## r.area - 
## r.basin - Morphometric characterization of river basins
## r.bioclim - Calcuates bioclimatic indices.
## r.bitpattern - Compares bit patterns with a raster map.
## r.catchment - Creates a raster buffer of specified area around vector points using cost distances using r.walk.
## r.category.trim - Export categories and corresponding colors as QGIS colour file or csv file. Non-existing categories and their colour definitions will be removed.
## r.cell.area - Calculate cell sizes within the computational region
## r.change.info - Landscape change assessment
## r.clip - Extracts portion of the input map which overlaps with current region Extracts portion of the input raster map which is in the current computational region
## r.colors.contrastbrightness - Change the contrast/brightness of a raster.
## r.colors.cubehelix - Create or apply a cubehelix color table to a GRASS raster map
## r.colors.matplotlib - Convert or apply a Matplotlib color table to a GRASS raster map
## r.colors.out_sld - Exports the color table associated with a raster map layer in SLD format.
## r.confusionmatrix - Calculates a confusion matrix and accuracies for a given classification using r.kappa.
## r.connectivity - 
## r.convergence - Calculate convergence index.
## r.cpt2grass - Convert or apply a GMT color table to a GRASS raster map
## r.crater - Creates meteorites from craters (-c) or craters from meteorites (default).
## r.damflood - Estimate the area potentially inundated in case of dam break
## r.denoise - r.denoise - denoise topographic data
## r.divergence - Computes divergence of a vector field defined by magnitude and direction
## r.diversity - Calculate diversity indices based on a moving window using r.li packages
## r.droka - Calculates run-out distance of a falling rock mass
## r.edm.eval - Computes evaluation statistics of an environmental distribution model, based on a layer with observed and a layer with predicted values
## r.estimap.recreation - 
## r.euro.ecosystem - Sets colors and categories of European ecosystem raster data set
## r.exdet - Quantification of novel uni- and multi-variate environments
## r.fidimo - Calculating fish dispersal in a river network from source populations with species specific dispersal parameters
## r.fill.category - Replaces the values of pixels of a given category with values of the surrounding pixels.
## r.fill.gaps - 
## r.findtheriver - Find the stream pixel nearest the input coordinate
## r.flexure - Computes lithospheric flexural isostasy
## r.flip - Flips an image. Flips an image.
## r.flowfill - 
## r.forestfrag - Computes the forest fragmentation index (Riitters et al. 2000)
## r.futures - 
## r.fuzzy.logic - Performs logical operations on membership images created with r.fuzzy or different method. Use families for fuzzy logic.
## r.fuzzy.set - Calculate membership value of any raster map according user's rules.
## r.fuzzy.system - Full fuzzy logic standalone classification system with few fuzzy logic families implication and defuzzification and methods.
## r.gdd - Makes each output cell value a function of the values assigned to the corresponding cells in the input raster map layers.
## r.geomorphon - Calculates geomorphons (terrain forms) and associated geometry using machine vision approach.
## r.gradient - Create a gradient map
## r.green - 
## r.grow.shrink - Generates a raster map layer with contiguous areas grown by one cell.
## r.gsflow.hydrodem - Creates hydrologically correct MODFLOW DEM from higher-res DEM
## r.gwr - Calculates geographically weighted regression from raster maps.
## r.hants - Approximates a periodic time series and creates approximated output.
## r.hazard.flood - Fast procedure to detect flood prone areas.
## r.houghtransform - Performs Hough transformation and extracts line segments from image. Region shall be set to input map. Can work only on small images since map is loaded into memory.
## r.hydrodem - Hydrological conditioning, sink removal
## r.hypso - Outputs a hypsometric and hypsographic graph.
## r.in.arc - Converts an ESRI ARC/INFO ascii raster file (GRID) into a GRASS raster map.
## r.in.nasadem - Creates a DEM from 1 arcsec NASADEM tiles.
## r.in.pdal - Creates a raster map from LAS LiDAR points using univariate statistics and r.in.xyz.
## r.in.srtm.region - Creates a DEM from 3 arcsec SRTM v2.1 or 1 arcsec SRTM v3 tiles.
## r.in.usgs - Download user-requested products through the USGS TNM API
## r.in.wcs - Downloads and imports coverage from WCS server.
## r.jpdf - From two series of input raster maps, calculates the joint probability function and outputs the probabilities of occurrence in the specified bins.
## r.lake.series - Fills lake at given point(s) to given levels.
## r.landscape.evol - Simulates the cumulative effect of erosion and deposition on a landscape over time.
## r.le.patch - Calculates attribute, patch size, core (interior) size, shape, fractal dimension, and perimeter measures for sets of patches in a landscape.
## r.le.pixel - Contains a set of measures for attributes, diversity, texture, juxtaposition, and edge.
## r.le.setup - 
## r.le.trace - 
## r.learn.ml - Supervised classification and regression of GRASS rasters using the python scikit-learn package
## r.lfp - Calculates the longest flow paths for given outlet points using the r.stream.distance addon.
## r.local.relief - Creates a local relief model from elevation map.
## r.los - Line-of-sight raster analysis program.
## r.mapcalc.tiled - Runs r.mapcalc in parallel over tiles.
## r.massmov - Estimates run-out and deposition of landslide phenomena over a complex topography.
## r.maxent.lambdas - Computes raw and/or logistic prediction maps from MaxEnt lambdas files
## r.mblend - Blends two rasters of different spatial resolution.
## r.mcda.ahp - Generates a raster map classified with analytic hierarchy process (AHP).
## r.mcda.electre - Multicirtieria decision analysis based on ELECTRE method
## r.mcda.input - Generates a raster map classified with Dominance Rough Set Approach. Use *.rls file from JAMM, 4eMka2 etc.
## r.mcda.output - Exports criteria raster maps and decision raster map in a *.isf file (e.g. 4eMka2, jMAF) for dominance rough set approach analysis.
## r.mcda.promethee - Multicirtieria decision analysis based on PROMETHEE method
## r.mcda.roughset - Generates a MCDA map from several criteria maps using Dominance Rough Set Approach.
## r.mcda.topsis - Generates a MCDA map based on TOPSIS algorthm.
## r.meb - Compute the multivariate environmental bias (MEB)
## r.mess - Computes multivariate environmental similarity surface (MES)
## r.mregression.series - Calculates multiple regression between time series: Y(t) = b1*X1(t) + ... + bn*Xn(t).
## r.mwprecip - Module for working with microwave links
## r.neighborhoodmatrix - Calculates geometry parameters for raster objects.
## r.niche.similarity - Computes niche overlap or similarity
## r.northerness.easterness - Calculation of northerness, easterness and the interaction between northerness and slope
## r.null.all - Manages NULL values of raster maps in a mapset or their subset.
## r.object.activelearning - Active learning for classifying raster objects
## r.object.geometry - Calculates geometry parameters for raster objects.
## r.object.spatialautocor - Spatial autocorrelation of raster objects
## r.object.thickness - Evaluates minimum, maximum and mean thickness of objects of a given category on a raster map.
## r.out.arc - Converts a raster map layer into an ESRI ARCGRID file.
## r.out.kde - Exports raster with variable transparency into an image file
## r.out.legend - Create an image file showing the legend of a raster map
## r.out.ntv2 - Exports NTv2 datum transformation grid
## r.out.tiff - Exports a GRASS raster map to a 8/24bit TIFF image file.
## r.patch.smooth - Module for patching rasters with smoothing along edges
## r.pi - 
## r.popgrowth - Set of population models (fisheries science)
## r.pops.spread - A dynamic species distribution model for pest or pathogen spread in forest or agricultural ecosystems
## r.quantile.ref - Determines quantile for input value from reference raster map layers.
## r.random.weight - Generates a binary raster layer with a random selection of raster cells depending on the weight of each cell in the input weight layer.
## r.recode.attr - Recode raster using attribute table (csv file) as input.
## r.regression.series - Makes each output cell value a function of the values assigned to the corresponding cells in the input raster map layers.
## r.resamp.tps - Performs thin plate spline interpolation with regularization and covariables.
## r.richdem.breachdepressions - 
## r.richdem.filldepressions - 
## r.richdem.flowaccumulation - 
## r.richdem.resolveflats - 
## r.richdem.terrainattribute - 
## r.rock.stability - A tool for preliminary rock failure susceptibility mapping.
## r.roughness.vector - Calculates surface roughness in a moving-window, as the orientation of vectors normal to surface planes.
## r.sample.category - Create sampling points from each category in a raster map
## r.scatterplot - Creates a scatter plot of raster maps Creates a scatter plot of two or more raster maps as a vector map
## r.seasons - Extracts seasons from a time series.
## r.series.decompose - Calculates decomposition of time series X.
## r.series.diversity - Compute diversity indici over input layers
## r.series.filter - Performs filtering of raster time series X (in time domain).
## r.series.lwr - Approximates a time series and creates approximated, gap-filled output.
## r.shaded.pca - Creates relief shades from various directions and combines them into RGB composition. The combined shades highlight terrain features which wouldn't be visible using standard shading technique.
## r.shalstab - A model for shallow landslide susceptibility.
## r.sim.terrain - Dynamic landscape evolution model
## r.sim.water.mp - Overland flow hydrologic simulation using path sampling method (SIMWE).
## r.skyview - Computes Sky-View Factor visualization technique
## r.slope.direction - Calculates slope following a direction raster.
## r.smooth.seg - Generates a piece-wise smooth approximation of the input raster and a discontinuity map.
## r.soillossbare - Calculates annual soil loss [t/(ha*a)] for bare soil. Use r.soillosscropland.py afterwards for grown soil.
## r.soils.texture - Define soil texture from sand and clay grid.
## r.stream.basins - Delineates basins according stream network. Input can be stream network, vector point map with outlets or outlet coordinates.
## r.stream.channel - Calculates local parameters for individual streams.
## r.stream.distance - Calculates distance to and elevation above streams and outlet. The module can work in stream mode where target are streams and outlets mode where targets are outlets.
## r.stream.order - Calculates Strahler's and more streams hierarchy. Basic module for topological analysis of drainage network.
## r.stream.segment - Divides network into near straight-line segments and calculate its order.
## r.stream.slope - Calculates local parameters for slope subsystem.
## r.stream.snap - Snap point to modelled stream network. Input can be stream network, point vector map with outlets or outlet coordinates.
## r.stream.stats - Calculates Horton's statistics for Strahler and Horton ordered networks created with r.stream.order.
## r.stream.variables - Calculation of contiguous stream-specific variables that account for the upstream environment (based on r.stream.watersheds).
## r.stream.watersheds - Sub-watershed and sub-stream delineation based on the drainage direction and a gridded stream network.
## r.subdayprecip.design - Computes subday design precipitation totals.
## r.sun.daily - Runs r.sun for multiple days in loop (mode 2)
## r.sun.hourly - Runs r.sun in loop for given time range within one day (mode 1 or 2)
## r.sun.mp - Solar irradiance and irradiation model. Computes direct (beam), diffuse and reflected solar irradiation raster maps for given day, latitude, surface and atmospheric conditions. Solar parameters (e.g. sunrise, sunset times, declination, extraterrestrial irradiance, daylight length) are saved in the map history file. Alternatively, a local time can be specified to compute solar incidence angle and/or irradiance raster maps. The shadowing effect of the topography is optionally incorporated.
## r.surf.idw2 - Provides surface interpolation from raster point data by Inverse Distance Squared Weighting.
## r.surf.nnbathy - Interpolates a raster map using the nnbathy natural neighbor interpolation program.
## r.terrain.texture - Unsupervised nested-means algorithm for terrain classification
## r.texture.tiled - Runs r.texture in parallel over tiles
## r.threshold - Find optimal threshold for stream extraction
## r.to.vect.lines - Convert raster rows to vector lines.
## r.to.vect.tiled - Converts a raster map into vector tiles.
## r.traveltime - Estimation of travel times/isochrones. Computes the travel time of surface runoff to an outlet
## r.tri - Terrain Ruggedness Index
## r.univar2 - Calculates univariate statistics from the non-null cells of a raster map.
## r.valley.bottom - Calculation of Multi-resolution Valley Bottom Flatness (MrVBF) index
## r.vect.stats - Bin vector points into a raster map
## r.vector.ruggedness - Vector Ruggedness Measure
## r.viewshed.cva - Undertakes a "cumulative viewshed analysis" using a vector points map as input "viewing" locations, using r.viewshed to calculate the individual viewsheds.
## r.vif - To calculate the stepwise variance inflation factor.
## r.vol.dem - Creates a 3D raster model (voxels) from a series of raster DEMs
## r.wateroutlet.lessmem - Creates watershed basins from a drainage direction map.
## r.width.funct - Calculates the Width Function of a watershed basin.
## r.zonal.classes - Calculates zonal classes proportion describing raster areas's composition, e.g., in terms of land-cover classes.
## r3.count.categories - Count categories in vertical direction
## r3.forestfrag - Computes the forest fragmentation index (Riitters et al. 2000)
## r3.profile - Outputs the raster map layer values lying on user-defined line(s).
## r3.scatterplot - Creates a scatter plot of 3D raster maps Creates a scatter plot of two or more 3D raster maps as a vector map
## r3.to.group - Convert a 3D raster map to imagery group
## r3.what - Queries 3D raster in specified 2D or 3D coordinates.
## t.rast.kappa - Calculate kappa parameter in a space time raster dataset
## t.rast.null - Manages NULL-values of a given space time raster dataset.
## t.rast.out.xyz - Export space time raster dataset to a CSV file.
## t.rast.patch - Patches multiple space time raster maps into a single raster map using r.patch.
## t.rast.what.aggr - Sample a space time raster dataset at specific vector point map returning aggregate values and write the output to stdout or to attribute table
## t.rast.whatcsv - Sample a space time raster dataset at specific space-time point coordinates from a csv file and write the output to stdout
## t.upgrade - Upgrades the version of a space time dataset (TGRASS DB).
## v.area.stats - Populates attribute values from vector features.
## v.area.weigh - Rasterize vector areas using weights
## v.build.pg - Builds PostGIS topology for vector map linked via v.external.
## v.centerline - Creates a central line of a map of lines
## v.centerpoint - Calculate center points
## v.civil - 
## v.class.ml - 
## v.class.mlR - Provides supervised support vector machine classification
## v.class.mlpy - Vector supervised classification tool which uses attributes as classification parametres (order of columns matters, names not), cat column identifies feature, class_column is excluded from classification parametres.
## v.clean.ogr - Imports vector data into a GRASS vector map, cleans the data topologically, and exports them again using OGR library.
## v.clip - Extracts features of input map which overlay features of clip map.
## v.colors2 - Sets color rules for features in a vector map using a numeric attribute column.
## v.concave.hull - Creates a concave hull around points.
## v.convert - Imports older versions of GRASS vector maps.
## v.convert.all - Converts all older versions of GRASS vector maps in current mapset to current format.
## v.delaunay3d - Creates a 3D triangulation from an input vector map containing points or centroids.
## v.ellipse - Computes the best-fitting ellipse for given vector data.
## v.explode - "Explode" polylines, splitting them to separate lines (uses v.split + v.category)
## v.external.all - Links all OGR layers available in given OGR datasource.
## v.faultdirections - Creates a polar plot of fault directions
## v.fixed.segmentpoints - segment points along a vector line with fixed distances
## v.flexure - Lithospheric flexure: gridded deflections from scattered point loads
## v.gsflow.export - Export databse tables and pour point for GSFLOW input and control files
## v.gsflow.gravres - Set parameters for GSFLOW Hydrologic Response Units (HRUs)
## v.gsflow.grid - Builds grid for the MODFLOW component of GSFLOW
## v.gsflow.hruparams - Set parameters for GSFLOW Hydrologic Response Units (HRUs)
## v.gsflow.mapdata - Upload data to PRMS data
## v.gsflow.reaches - Build stream "reaches" that link PRMS segments to MODFLOW cells
## v.gsflow.segments - Prepares stream segments for PRMS and GSFLOW
## v.habitat.dem - Calculates DEM derived characteristics of habitats.
## v.in.gbif - importing of GBIF species distribution data
## v.in.geopaparazzi - Imports data from Geopaparazzi database.
## v.in.gns - Imports US-NGA GEOnet Names Server (GNS) country files into a GRASS vector points map.
## v.in.gps - Import waypoints, routes, and tracks from a GPS receiver or GPS download file into a vector map.
## v.in.natura2000 - importing of Natura 2000 spatial data of protected areas
## v.in.osm - Imports OpenStreetMap data into GRASS GIS.
## v.in.ply - Creates a vector map from a PLY file.
## v.in.pygbif - Search and import GBIF species distribution data
## v.in.redlist - importing of IUCN Red List Spatial Data
## v.in.redwg - 
## v.in.survey - Creates multiple vector layers from just one textfile
## v.in.wfs2 - Downloads and imports data from WFS server.
## v.isochrones - Creates isochrones from a road map and starting points
## v.krige - 
## v.kriging - Interpolates 2D or 3D raster based on input values located on 2D or 3D point vector layer (method ordinary kriging extended to 3D).
## v.label.sa - Create optimally placed labels for vector map(s)
## v.lidar.mcc - Reclassifies points of a LiDAR point cloud as ground / non-ground using a multiscale curvature based classification algorithm.
## v.link.precip - Links time-windows to vector link map.
## v.mapcalc - Vector map calculator.
## v.maxent.swd - Export raster values at given point locations as text file in SWD format for input in Maxent
## v.median - Return the barycenter of a cloud of point.
## v.mrmr - Perform Minimum Redundancy Maximum Relevance Feature Selection on a GRASS Attribute Table
## v.neighborhoodmatrix - Exports the neighborhood matrix of polygons in a vector map
## v.net.curvedarcs - Draws curved arcs between points (e.g. flows)
## v.net.salesman.opt - Creates a cycle connecting given nodes (Traveling salesman problem). Note that TSP is NP-hard, heuristic algorithm is used by this module and created cycle may be suboptimal
## v.nnstat - Indicates clusters, separations or random distribution of point set in 2D or 3D space.
## v.out.gps - Exports a vector map to a GPS receiver or file format supported by GPSBabel.
## v.out.ply - Exports a vector map to a PLY file.
## v.out.png - Export vector map as PNG
## v.ply.rectify - Imports PLY points, georeferences and exports them.
## v.profile - Vector map profiling tool
## v.profile.points - Creates a profile (transect) from points
## v.rast.bufferstats - Calculates statistics of raster map(s) for buffers around vector geometries. 
## v.sort.points - Sorts a vector point map according to a numeric column
## v.stats - 
## v.strds.stats - Calculates univariate statistics from given space-time raster datasets based on a vector map
## v.stream.inbasin - Subset a stream network into just one of its basins
## v.stream.network - Build a linked stream network: each link knows its downstream link
## v.stream.order - Compute the stream order of stream networks stored in a vector map at specific outlet vector points
## v.stream.profiler - Build a linked stream network: each link knows its downstream link
## v.surf.icw - IDW interpolation, but distance is cost to get to any other site.
## v.surf.mass - Performs mass-preserving area interpolation.
## v.surf.nnbathy - Interpolates a raster map using the nnbathy natural neighbor interpolation program.
## v.surf.tps - Performs thin plate spline interpolation with regularization and covariables.
## v.tin.to.rast - Converts (rasterize) a TIN map into a raster map
## v.transects - Creates transect lines or quadrilateral areas at regular intervals perpendicular to a polyline.
## v.vol.idw - Interpolates point data to a 3D raster map using Inverse Distance Weighting (IDW) algorithm.
## v.what.rast.multi - Uploads values of multiple rasters at positions of vector points to the table.
## v.what.spoly - Queries vector map with overlaping "spaghetti" polygons (e.g. Landsat footprints) at given location. Polygons must have not intersected boundaries.
## v.what.strds.timestamp - Uploads space time raster dataset values to the attribute table at positions of vector points in space and time.
## wx.mwprecip - 
## wx.stream - 
## wx.wms - 
## List of available extensions (modules):
```

Consultar la ayuda de una función
---------------------------------

-   Alternativa 1

``` r
parseGRASS("r.in.gdal")
## Command: r.in.gdal 
## Description: Imports raster data into a GRASS raster map using GDAL library. 
## Keywords: raster, import, create location 
## Parameters:
##   name: input, type: string, required: yes, multiple: no
##   keydesc: name, keydesc_count: 1
## [Name of raster file to be imported]
##   name: output, type: string, required: yes, multiple: no
##   keydesc: name, keydesc_count: 1
## [Name for output raster map]
##   name: band, type: integer, required: no, multiple: yes
## [Band(s) to select (default is all bands)]
##   name: memory, type: integer, required: no, multiple: no
##   default: 300
## [Cache size for raster rows]
##   name: target, type: string, required: no, multiple: no
##   keydesc: name, keydesc_count: 1
## [Name of location to create or to read projection from for GCPs transformation]
##   name: title, type: string, required: no, multiple: no
##   keydesc: phrase, keydesc_count: 1
## [Title for resultant raster map]
##   name: offset, type: integer, required: no, multiple: no
##   default: 0
## [If 0, no offset is added and the first band is 1]
##   name: num_digits, type: integer, required: no, multiple: no
##   default: 0
## [If 0, length will be adjusted to 'offset' number without leading zeros]
##   name: map_names_file, type: string, required: no, multiple: no
##   keydesc: name, keydesc_count: 1
## [Name of the output file that contains the imported map names]
##   name: location, type: string, required: no, multiple: no
##   keydesc: name, keydesc_count: 1
## [Name for new location to create]
##   name: table, type: string, required: no, multiple: no
##   keydesc: file, keydesc_count: 1
## [The band number and ".csv" will be appended to the file prefix]
##   name: gdal_config, type: string, required: no, multiple: no
## [Comma-separated list of key=value pairs]
##   name: gdal_doo, type: string, required: no, multiple: no
## [Comma-separated list of key=value pairs]
## Flags:
##   name: o [Assume that the dataset has same projection as the current location] {FALSE}
##   name: j [Perform projection check only and exit] {TRUE}
##   name: e [Also updates the default region if in the PERMANENT mapset] {FALSE}
##   name: f [List supported formats and exit] {TRUE}
##   name: l [Force Lat/Lon maps to fit into geographic coordinates (90N,S; 180E,W)] {FALSE}
##   name: a [Attempt to fix small precision errors in resolution and extents] {FALSE}
##   name: k [Keep band numbers instead of using band color names] {FALSE}
##   name: c [Create the location specified by the "location" parameter and exit. Do not import the raster file.] {FALSE}
##   name: r [Limit import to the current region] {FALSE}
##   name: p [Print number of bands and exit] {TRUE}
##   name: overwrite [Allow output files to overwrite existing files] {FALSE}
##   name: help [Print usage summary] {FALSE}
##   name: verbose [Verbose module output] {FALSE}
##   name: quiet [Quiet module output] {FALSE}
```

-   Alternativa 2

``` r
system('r.in.gdal --help')

Imports raster data into a GRASS raster map using GDAL library.

Usage:
 r.in.gdal [-ojeflakcrp] input=name output=name
   [band=value[,value,...]] [memory=value] [target=name] [title=phrase]
   [offset=value] [num_digits=value] [map_names_file=name] [location=name]
   [table=file] [gdal_config=string] [gdal_doo=string] [--overwrite]
   [--help] [--verbose] [--quiet] [--ui]

Flags:
  -o   Override projection check (use current location's projection)
  -j   Perform projection check only and exit
  -e   Extend region extents based on new dataset
  -f   List supported formats and exit
  -l   Force Lat/Lon maps to fit into geographic coordinates (90N,S; 180E,W)
  -a   Auto-adjustment for lat/lon
  -k   Keep band numbers instead of using band color names
  -c   Create the location specified by the "location" parameter and exit. Do not import the raster file.
  -r   Limit import to the current region
  -p   Print number of bands and exit

Parameters:
           input   Name of raster file to be imported
          output   Name for output raster map
            band   Band(s) to select (default is all bands)
          memory   Maximum memory to be used (in MB)
                   default: 300
          target   Name of GCPs target location
           title   Title for resultant raster map
          offset   Offset to be added to band numbers
                   default: 0
      num_digits   Zero-padding of band number by filling with leading zeros up to given number
                   default: 0
  map_names_file   Name of the output file that contains the imported map names
        location   Name for new location to create
           table   File prefix for raster attribute tables
     gdal_config   GDAL configuration options
        gdal_doo   GDAL dataset open options
```

Limpiar archivo de bloqueo del conjunto de mapas de GRASS
---------------------------------------------------------

``` r
unlink_.gislock()
```

Referencias
-----------
