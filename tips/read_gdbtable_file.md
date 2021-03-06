# How to read .gdbtable file

## Method
Read it out and put it into a SQL database

## Reference
 - <a href='https://vallandingham.me/shapefile_to_geojson.html#converting-to-geojson-using-gdal'>Converting from shapefile to GeoJSON using GDAL</a>
 - <a href='https://morphocode.com/using-ogr2ogr-convert-data-formats-geojson-postgis-esri-geodatabase-shapefiles/'>Using ogr2ogr to convert data between GeoJSON, PostGIS and Esri Shapefile</a>
 - <a href='https://www.statsilk.com/maps/convert-esri-shapefile-map-geojson-format'>Convert ESRI Shapefile Map to GeoJSON format</a>
 - https://github.com/webmapp/gdal-docker/tree/master/examples
 - https://gis.stackexchange.com/questions/184013/read-a-table-from-an-esri-file-geodatabase-gdb-using-r
 - http://www.postgresqltutorial.com/postgresql-create-table/
 - https://catalogue.data.gov.bc.ca/dataset/parcelmap-bc-parcel-fabric/resource/6dd5db5c-c080-474c-9a8d-631a42e5b1d1

## Tools needed
 - bitnami/postgresq docker
 - fenglc/pgadmin4 docker
 - gdal-bin && vessel
```
sudo snap install vessel
sudo apt install gdal-bin
```

## Setup PostgreSQL database
- docker-compose file
```
version: '3'

services:
  postgresql:
    image: 'bitnami/postgresql:latest'
    container_name: postgresql
    hostname: postgresql
    ports:
      - '5432:5432'
    volumes:
      - $PWD/postgresql:/bitnami/postgresql
    environment:
      - POSTGRESQL_USERNAME=user
      - POSTGRESQL_PASSWORD=123456
      - POSTGRESQL_DATABASE=gdal
    networks:
      - psqlnet

  pgadmin4:
    image: 'fenglc/pgadmin4:latest'
    container_name: pgadmin4
    hostname: pgadmin4
    links:
      - postgresql:gdal
    depends_on:
      - postgresql
    ports:
      - '80:5050'
    environment:
      - DEFAULT_USER=admin
      - DEFAULT_PASSWORD=admin
    networks:
      - psqlnet

networks:
  psqlnet:
    driver: bridge
```
 - Start the dockers
```
docker-compose up
```

## Get info of the datafile
- Link: https://catalogue.data.gov.bc.ca/dataset/parcelmap-bc-parcel-fabric/resource/6dd5db5c-c080-474c-9a8d-631a42e5b1d1

- Commands to get info of the file
```
wget https://pub.data.gov.bc.ca/datasets/4cf233c2-f020-4f7a-9b87-1923252fbc24/pmbc_parcel_fabric_poly_svw.zip
unzip pmbc_parcel_fabric_poly_svw.zip
ogrinfo pmbc_parcel_fabric_poly_svw.gdb
```

## Read the data out and put it into database
 - Get postgresql docker container's ip (172.30.0.2) with the following command
```
docker network inspect gdal_psqlnet
```

 - Start copy data to PostgreSQL database
```
ogr2ogr -f "PostgreSQL" PG:"host=172.30.0.2 user=user dbname=gdal password=123456" pmbc_parcel_fabric_poly_svw.gdb pmbc_parcel_fabric_poly_svw
```

## Use pgadmin4 to get the data
<img src='https://user-images.githubusercontent.com/15996047/62485258-3e4b4180-b78a-11e9-87be-ddcc256936c2.jpeg'/>

## Convert shapefile to geoJSON
Common command:
```
ogr2ogr -f geoJSON <output-json-file> <input-shp-file>
```
But if the original shape file contains UTM coordinates instead of latitude and longitude, use the following command to convert shape file to geoJSON and convert UTM coordinates to latitude and longitude at the same time:
```
ogr2ogr -f geoJSON <output-json-file> <input-shp-file> -t_srs EPSG:4326
```

## Convert geoJSON file to the format simpli.fi can identify
Use vim to edit the json file and:
```
:%s/", "STREETNAME": "/ /g
:%s/CIVIC_NO/name/g
:%s/"SITE_ID"/"geoFenceType": "Event", "SITE_ID"/g
```
