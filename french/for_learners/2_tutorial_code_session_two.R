#### RUN THE NEXT 2 LINES TO LOAD TUTORIAL IN VIEWER PANE ----
source("french/for_instructors/scripts/viewerpane_html.R")
viewerpane_html("french/for_learners/tutorials_pdf_html/2_tutorial_session_two.html")


#### SECTION B: LOADING PACKAGES AND DATA ----

# for working with vector data
library(sf) 

# for raster data handling
library(raster) 

# example spatial data for Africa
library(afrilearndata)

# for static and interactive mapping
library(tmap)

# for interactive mapping
library(mapview)

# for reading text files
library(readr)            


#### SECTION C: READ SPATIAL DATA FROM FILES AND PREVIEW WITH `mapview` ----

# read files vector

library(sf)
filename1 <- system.file("extdata","africountries.shp", package="afrilearndata", mustWork=TRUE)
myobject1 <- sf::st_read(filename1)

# read files raster

library(raster)
filename2 <- system.file("extdata","afripop2020.tif", package="afrilearndata", mustWork=TRUE)
myobject2 <- raster::raster(filename2)

# r mapview1

library(mapview)
mapview(myobject1)

# r mapview2

mapview(myobject2)


#### SECTION D: .CSV, .TXT or .XLS FILE WITH COORDINATES ----

# r csv-airports1

filename <- system.file("extdata", "afriairports.csv", package="afrilearndata", mustWork=TRUE)
mydf <- readr::read_csv(filename)

mydf <- mydf[(1:100), ] # select first 100 rows just to make analysis quicker here


# r csv-airports2

mysf <- sf::st_as_sf(mydf, 
                     coords=c("longitude_deg", "latitude_deg"),
                     crs=4326)

# r csv-airports3

mapview(mysf)    


# r csv-crs-missing

# Step 1.
filename <- system.file("extdata", "afriairports.csv", package="afrilearndata", mustWork=TRUE)
mydf <- readr::read_csv(filename)

mydf <- mydf[(1:100), ] # select first 100 rows just to make quicker online

# Step 2.
mysf <- sf::st_as_sf(mydf, 
                     coords=c("longitude_deg", "latitude_deg"))

# Step 3.
mapview(mysf)    


#### SECTION E. DIRECTLY CREATE AN R OBJECT ----

# r dataframe-sf

# Step 1.
mydf <- data.frame(x=c(-10,10,30),
                   y=c(20,0,-20),
                   attribute=c("a","b","c"))
# Step 2.
mysf <- sf::st_as_sf(mydf, 
                     coords=c("x", "y"),
                     crs=4326)
# Step 3.
mapview(mysf)    


#### SECTION F. SHAPEFILES (.SHP) ----

# r shp-countries

# read file into a spatial object
filename <- system.file("extdata","africountries.shp", package="afrilearndata", mustWork=TRUE)
africountries <- sf::read_sf(filename)

# quick interactive plot
mapview(africountries)


#### SECTION G. .KML, .GPKG and .JSON ----

# r kml-highways

filename <- system.file("extdata","trans-african-highway.kml", package="afrilearndata", mustWork=TRUE)

afrihighway <- sf::read_sf(filename)

# quick interactive plot
#mapviewOptions(fgb = FALSE) # to fix error with mapview rendering the plot on mac
mapview(afrihighway)


#### SECTION H. RASTER TIFF ----

# r rast1

filename <- system.file("extdata","afripop2020.tif", package="afrilearndata", mustWork=TRUE)

myrast <- raster::raster(filename)

# quick interactive plot
mapview(myrast)
#mapview(myrast, at=c(0,1,10,100,1000,10000,100000))


#### SECTION I. `mapview` OPTIONS ----

# r mapview-options-airports

# 1. read into dataframe
filename <- system.file("extdata", "afriairports.csv", package="afrilearndata", mustWork=TRUE)
mydf <- readr::read_csv(filename)

mydf <- mydf[(1:100), ] #select first 100 rows just to make quicker online

# or can select a single country:
# mydf <- mydf[which(mydf$country_name == "Cameroon"), ]

# 2. convert to sf object
mysf <- sf::st_as_sf(mydf, 
                     coords=c("longitude_deg", "latitude_deg"),
                     crs=4326)

# 3. quick interactive plot
#mapview(mysf)
mapview(mysf, zcol='type', label='name', cex=2)   




