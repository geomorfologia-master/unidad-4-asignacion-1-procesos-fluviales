<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" maxScale="0" version="3.10.0-A Coruña" minScale="1e+8">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <customproperties>
    <property value="false" key="WMSBackgroundLayer"/>
    <property value="false" key="WMSPublishDataSourceUrl"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property value="Value" key="identify/format"/>
  </customproperties>
  <pipe>
    <rasterrenderer angle="45" multidirection="0" type="hillshade" zfactor="1" opacity="0.599" azimuth="315" alphaBand="-1" band="1">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0"/>
    <huesaturation colorizeRed="255" colorizeBlue="128" colorizeOn="0" colorizeGreen="128" saturation="0" grayscaleMode="0" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2" zoomedInResampler="cubic" zoomedOutResampler="bilinear"/>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
