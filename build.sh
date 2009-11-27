#!/bin/sh
var=$(date '+%d%m%Y%H%M%S')
rm -r -f build
mkdir build
cat js/lib/jquery-1.3.2.js js/lib/jquery-ui-1.7.2.custom.min.js js/lib/ext-2.2.1.js js/lib/humanMsg.js js/lib/mapfish-1.1.js js/lib/openlayers-2.8.js js/lib/mapfish-1.1.en.js js/lib/mapfish-1.1.layertree.js js/lib/ext-2.2.1.slider-tip.js js/lib/ext-2.2.1.dynamic-grid.js js/lib/ext-2.2.1.theme-combo.js js/lib/ags/AgsTiled.js js/lib/ags/AgsDynamic.js js/lib/ags/AgsImageService.js js/lib/ags/AgsUtil.js js/lib/ags/AgsControl.js js/lib/ags/AgsGeometryService.js js/lib/ags/AgsGeoprocessor.js js/lib/ags/AgsIdentifyTask.js js/lib/ags/AgsFindTask.js js/lib/ags/AgsQueryTask.js js/lib/ags/AgsLocator.js js/lib/ags/AgsRouteTask.js js/lib/ags/AgsJsAdapter.js js/WGX/Control/IdentifyFeature.js js/WGX/Control/DeleteFeature.js js/WGX/Control/ActiveMeasure.js js/WGX/Control/InsertLabel.js js/WGX/Control/QueryFeature.js js/WGX/Init.js js/WGX/Config.js js/WGX/Util.js js/WGX/MapTools.js js/WGX/MapStyle.js js/WGX/Map.js js/WGX/MapLabel.js js/WGX/MapLabelFactory.js js/WGX/LayerTree.js js/WGX/Popup.js js/WGX/InfoPopup.js js/WGX/ReportWindow.js js/WGX/Toolbar.js js/WGX/Query.js js/WGX/Search.js js/WGX/Result/Parcel.js js/WGX/Result/MailLabel.js js/WGX/Result/Feature.js js/WGX/Result/SearchAnything.js js/WGX/Result/Advanced.js js/WGX/ResultManager.js js/WGX/ReportPanel.js js/WGX/Tool/ZoomFull.js js/WGX/Tool/ZoomIn.js js/WGX/Tool/ZoomOut.js js/WGX/Tool/Pan.js js/WGX/Tool/Identify.js js/WGX/Tool/ParcelInfo.js js/WGX/Tool/SimpleParcelInfo.js js/WGX/Tool/Measure.js js/WGX/Tool/MeasureArea.js js/WGX/Tool/ZoomToScale.js js/WGX/Tool/XYCoordinate.js js/WGX/Tool/Navigation.js js/WGX/Tool/NavigationHistory.js js/WGX/Tool/NavigationWidget.js js/WGX/Tool/Print.js js/WGX/Tool/DrawPoint.js js/WGX/Tool/DrawLine.js js/WGX/Tool/DrawPoly.js js/WGX/Tool/InsertLabel.js js/WGX/Tool/ModifyFeature.js js/WGX/Tool/DeleteFeature.js js/WGX/Tool/ClearMarkup.js js/WGX/Tool/Stroke.js js/WGX/Tool/Fill.js js/WGX/Tool/Point.js js/WGX/Tool/Label.js js/WGX/Tool/ToggleStandard.js js/WGX/Tool/ToggleDrawing.js js/WGX/Tool/Bookmark.js js/WGX/Tool/Query.js js/WGX/Search/Address.js js/WGX/Search/Parcel.js js/WGX/Search/QuickSearch.js js/WGX/Search/Advanced.js js/WGX/Search/Buffer.js js/WGX/Print/Advanced.js js/WGX/Tab/Main.js js/WGX/Tab/GIS.js js/WGX/Tab/Text.js js/WGX/Tab/Dynamic.js js/WGX/Tool/MapViews.js js/WGX/TabSwitcher.js js/WGX/Layout.js js/WGX/Login.js | java -jar yuicompressor.jar --type js -o build/WGX.js
cat css/lib/openlayers-2.8.css css/lib/humanMsg.css css/lib/mapfish-1.1.css css/Base.css css/Map.css css/Navigation.css css/Toolbar.css css/Overrides.css css/Report.css css/Print.css | java -jar yuicompressor.jar --type css -o build/WGX.css
cp -r img build/
cp -r fragments build/
cp .htaccess build/
cp index.html build/
cp print-config.json build/
cp pngbehavior.htc build/
cp export.php build/
cp download.php build/
cp login.php build/
sed -i '/<!--\[REMOVE\]-->/,/<!--\[ENDREMOVE\]-->/d' build/index.html
sed -i 's/<!--\[BUILD\]\(.*\)-->/\1/g' build/index.html
sed -i "s/\[APPVERSION\]/$var/" build/index.html