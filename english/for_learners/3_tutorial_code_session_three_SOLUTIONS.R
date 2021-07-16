#### RUN THE NEXT 2 LINES TO LOAD TUTORIAL IN VIEWER PANE ----
source("english/for_instructors/scripts/viewerpane_html.R")
viewerpane_html("english/for_learners/tutorials_pdf_html/3_tutorial_session_three.html")


#### LOADING PACKAGES AND DATA ----

library(tmap)
library(mapview)
library(sf)
library(readr)
library(afrilearndata)


#### D. MAP YOUR OWN COORDINATE DATA ----

# Upload your data to RStudio Cloud: click on `Upload` in the Files pane 
# (typically the bottom right pane).

# We suggest you save to a `data` folder in the directory where you are running 
# the R script (for this tutorial it is `for_learners/data`)

# Remember, to map these data in R usually requires a 3 step process:

# 1. read the data file into R (hint: `readr` package; `read_csv`)

## NB: replace `[your_data].csv` below with the filename of your data

## If you're running this part of the tutorial on RStudio and R that is 
## installed on your own computer (not in RStudio Cloud), 
## remember to replace the directory path to your file 
## (i.e. '/cloud/project/english/for_learners/data/') 
## with the path to where the file is located on your computer.

dfhealth <- read_csv("/cloud/project/english/for_learners/data/[your_data].csv") 

# 2. convert the dataframe into an R spatial (package `sf`) object and set `crs` 
## (hint: `sf::st_as_sf`)

sfhealth <- sf::st_as_sf(dfhealth, 
                         coords=c("Long", "Lat"),
                         crs=4326)


# 3. plot the `sf` object (create a quick interactive plot using `mapview`)

mapview(sfhealth)


#### E. COORDINATE DATA FOUND ONLINE ----

# Download the online data to your computer. Then, upload this data to RStudio Cloud.
# Click on `Upload` in the Files pane (typically the bottom right pane). 
# We suggest you save to a `data` folder in the directory where you are running 
# the R script (for this tutorial it is `for_learners/data`)

# Remember, to map these data in R usually requires a 3 step process:

# 1. read the data file into R (hint: `readr` package; `read_csv`)

# NB: replace `[your_data].csv` below with the filename of your data

## If you're running this part of the tutorial on RStudio and R that is installed 
## on your own computer (not in RStudio Cloud), 
## remember to replace the directory path to your file 
## (i.e. '/cloud/project/english/for_learners/data/') 
## with the path to where the file is located on your computer.

dfhealth <- read_csv("/cloud/project/english/for_learners/data/[your_data].csv") 


# 2. convert the dataframe into an R spatial (package `sf`) object and set `crs` 
## (hint: `sf::st_as_sf`)

sfhealth <- sf::st_as_sf(dfhealth, 
                         coords=c("Long", "Lat"),
                         crs=4326)


# 3. plot the `sf` object (create a quick interactive plot using `mapview`)

mapview(sfhealth)



#### F. DATA WE HAVE PROVIDED ----

#  Remember, to map these data in R usually requires a 3 step process.

# 1. read the data file into R (hint: `readr` package; `read_csv`)

dfhealth <- read_csv("/cloud/project/english/for_learners/data/health_demo.csv")


# 2. convert the dataframe into an R spatial (package `sf`) object and set `crs` 
# (hint: `sf::st_as_sf`)

sfhealth <- sf::st_as_sf(dfhealth, 
                         coords=c("Long", "Lat"),
                         crs=4326)


# 3. plot the `sf` object (create a quick interactive plot using `mapview`)

mapview(sfhealth)



#### G. EXTRA STEPS ----

# 1. Practice exploring what the object contains 
# (hint: e.g. `head`, `str`, `names`, `class`). 
# Add / remove the # in front of the lines one by one to uncomment the lines

head(sfhealth)
#str(sfhealth)
#names(sfhealth)
#class(sfhealth)


# 2. Play with the arguments in `mapview` (e.g. `zcol`, `label`, `cex`)

sfhealth <- sf::st_as_sf(dfhealth, 
                         coords=c("Long", "Lat"),
                         crs=4326)

mapview(sfhealth, zcol='Admin1', label='Country', cex=5)


# 3. What happens when you exclude the `crs` argument?

sfhealth <- sf::st_as_sf(dfhealth, 
                         coords=c("Long", "Lat"))
mapview(sfhealth)

# When there is no `crs` argument, the sf object is still created but mapview is 
# unable to position it in the world. 
# The points still appear but there is no map background.

# Remember to recreate `sfhealth` with the `crs` argument
sfhealth <- sf::st_as_sf(dfhealth, 
                         coords=c("Long", "Lat"),
                         crs=4326)
mapview(sfhealth)


# 4. Try creating an interactive plot using `tmap` that is similar to a `mapview` 
# one (hint: `tmap_mode("plot")` for a static map; 
# `tmap_mode("view")` for the interactive viewing mode)

tmap_mode("view")
tmap::tm_shape(sfhealth) +
  tm_symbols(col = "black", scale = 1)


# 5. Add layers from the objects in `afrilearndata` to your own map data 
# e.g. `africapitals` `afriadmin` `africontinent`

tmap::tm_shape(sfhealth) +
  tm_symbols(col = "black", scale = 1) +
  tm_shape(afripop2020) +
  tm_raster(palette = rev(viridisLite::magma(5)), breaks=c(0,2,20,200,2000,25000)) +
  tm_shape(africountries) +
  tm_borders("white", lwd = .5) +
  #   tm_text("iso_a3", size = "AREA") +
  tm_shape(afrihighway) +
  tm_lines(col = "red") +
  tm_shape(africapitals) +
  tm_symbols(col = "blue", alpha=0.4, scale = .6 ) +
  tm_legend(show = FALSE) 


