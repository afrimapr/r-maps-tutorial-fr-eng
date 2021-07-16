#### RUN THE NEXT 2 LINES TO LOAD TUTORIAL IN VIEWER PANE ----
source("french/for_instructors/scripts/viewerpane_html.R")
viewerpane_html("french/for_learners/tutorials_pdf_html/1_tutorial_session_one.html")


#### SECTION B: LOADING PACKAGES AND DATA ----

# for vector data handling
library(sf)

# for raster data handling
library(raster)

# example spatial data for Africa
library(afrilearndata)

# for static and interactive mapping
library(tmap)

# to create RasterLayer object
library(rgdal)


#### SECTION D: SPATIAL DATA OBJECTS ----

# sf-points-str

str(africapitals)

# sf-points-head

head(africapitals)

# sf-points-names

names(africapitals)

# sf-points-class

class(africapitals)


#### SECTION E: FIRST MAPS WITH TMAP ----

## VECTOR DATA POINTS

tmap_mode('plot')

# tmap-points1a

tm_shape(africapitals) +
   tm_symbols()

# tmap-points1b

tm_shape(africapitals) +
   tm_symbols(col = "blue")

# tmap-points1c

tm_shape(africapitals) +
  tm_symbols(col = "pop")


## VECTOR DATA LINES

# tmap-lines1a

tm_shape(afrihighway) +
  tm_lines()

# tmap-lines1b

tm_shape(afrihighway) +
    tm_lines(col = "red")

# tmap-lines1c

tm_shape(afrihighway) +
   tm_lines(col = "Name")  # use a column name from the object


## VECTOR DATA POLYGONS

# tmap-polygons-1a

tm_shape(africountries) +
     tm_polygons()

# tmap-polygons-1b

tm_shape(africountries) +
      tm_polygons(col="pop_est")

# tmap-polygons-1c

tm_shape(africountries) +
      tm_polygons(col="income_grp")

# tmap-polygons-1d

tm_shape(africountries) +
  tm_polygons(col="income_grp", border.col = "white")


## RASTER DATA

# tmap-raster1a

tm_shape(afripop2020) +
  tm_raster()

# tmap-raster1b

tm_shape(afripop2020) +
  tm_raster(breaks=c(0,2,20,200,2000,25000))

# tmap-raster2
# changing the colour palette

tm_shape(afripop2020) +
  tm_raster(palette = rev(viridisLite::magma(5)), breaks=c(0,2,20,200,2000,25000))


#### SECTION F: MAPPING MULTIPLE LAYERS ----

# tmap-vector-raster1a

tmap::tm_shape(afripop2020) +
  tm_raster(palette = rev(viridisLite::magma(5)), breaks=c(0,2,20,200,2000,25000))

# tmap-vector-raster1b

tmap::tm_shape(afripop2020) +
  tm_raster(palette = rev(viridisLite::magma(5)), breaks=c(0,2,20,200,2000,25000)) +
  tm_shape(africountries) +
  tm_borders("white", lwd = .5) +
  tm_text("iso_a3", size = "AREA")

# tmap-vector-raster1c

tmap::tm_shape(afripop2020) +
  tm_raster(palette = rev(viridisLite::magma(5)), breaks=c(0,2,20,200,2000,25000)) +
  tm_shape(africountries) +
  tm_borders("white", lwd = .5) +
  tm_text("iso_a3", size = "AREA") +
  tm_shape(afrihighway) +
  tm_lines(col = "blue")

# tmap-vector-raster1d

tmap::tm_shape(afripop2020) +
  tm_raster(palette = rev(viridisLite::magma(5)), breaks=c(0,2,20,200,2000,25000)) +
  tm_shape(africountries) +
  tm_borders("white", lwd = .5) +
  tm_text("iso_a3", size = "AREA") +
  tm_shape(afrihighway) +
  tm_lines(col = "blue") + 
  tm_shape(africapitals) +
  tm_symbols(col = "green",  scale = .6 ) +
  tm_legend(show = FALSE)


#### SECTION G: INTERACTIVE MAPS ----

# tmap-interactive

tmap_mode('view')

tmap::tm_shape(afripop2020) +
  tm_raster(palette = rev(viridisLite::magma(5)), breaks=c(0,2,20,200,2000,25000)) +
  tm_shape(africountries) +
  tm_borders("white", lwd = .5) +
  tm_text("iso_a3", size = "AREA") +
  tm_shape(afrihighway) +
  tm_lines(col = "blue") + 
  tm_shape(africapitals) +
  tm_symbols(col = "green",  scale = .6 ) +
  tm_legend(show = FALSE)


