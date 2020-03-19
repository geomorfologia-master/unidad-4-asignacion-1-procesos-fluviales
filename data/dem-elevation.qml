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
    <rasterrenderer classificationMax="3100" type="singlebandpseudocolor" opacity="1" classificationMin="100" alphaBand="-1" band="1">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader clip="0" classificationMode="2" colorRampType="DISCRETE">
          <colorramp name="[source]" type="cpt-city">
            <prop k="inverted" v="0"/>
            <prop k="rampType" v="cpt-city"/>
            <prop k="schemeName" v="grass/elevation"/>
            <prop k="variantName" v=""/>
          </colorramp>
          <item value="300" label="&lt;= 300" color="#00bfbf" alpha="255"/>
          <item value="500" label="300 - 500" color="#00d67b" alpha="255"/>
          <item value="700" label="500 - 700" color="#00ed36" alpha="255"/>
          <item value="900" label="700 - 900" color="#12ff00" alpha="255"/>
          <item value="1100" label="900 - 1100" color="#6dff00" alpha="255"/>
          <item value="1300" label="1100 - 1300" color="#c9ff00" alpha="255"/>
          <item value="1500" label="1300 - 1500" color="#ffed00" alpha="255"/>
          <item value="1700" label="1500 - 1700" color="#ffbf00" alpha="255"/>
          <item value="1900" label="1700 - 1900" color="#ff9100" alpha="255"/>
          <item value="2100" label="1900 - 2100" color="#f27f0d" alpha="255"/>
          <item value="2300" label="2100 - 2300" color="#db7f24" alpha="255"/>
          <item value="2500" label="2300 - 2500" color="#c47f3a" alpha="255"/>
          <item value="2700" label="2500 - 2700" color="#8e6032" alpha="255"/>
          <item value="2900" label="2700 - 2900" color="#513a23" alpha="255"/>
          <item value="inf" label="> 2900" color="#141414" alpha="255"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0"/>
    <huesaturation colorizeRed="255" colorizeBlue="128" colorizeOn="0" colorizeGreen="128" saturation="0" grayscaleMode="0" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2" zoomedInResampler="cubic" zoomedOutResampler="bilinear"/>
  </pipe>
  <blendMode>6</blendMode>
</qgis>
