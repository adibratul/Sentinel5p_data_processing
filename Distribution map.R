#packages installed 
library(ncdf4)
library(raster)
library(rasterVis)
library(rgdal)
###############################################################################DHAKA###############################################################################

############################################## NOX DISTRIBUTION MAP #######################################################

# Open nc files and write to tiff files 

nc_files=list.files("/mnt/drive/data nov 6/data/data analysis/", pattern = "*.nc$", recursive = TRUE, full.names =TRUE)
nc_files
shp<- readOGR("/mnt/drive/data nov 6/data/data analysis/", "dhaka")


#conversion loop 
for (i in nc_files){
  print(i)
  x=stack(i, varname="tropospheric_NO2_column_number_density")
  x[is.na(x)]<-0
  x<- mask(x,shp)
  #filename
  filename <- gsub("_", " ", i)
  filename <- gsub("/mnt/drive/data nov 6/data/data analysis//", " ",filename)
  filename <- gsub("*.nc", " ", filename)
  writeRaster(x,filename=filename,format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
  #y=levelplot(x,main = filename)
  #print(y)
}

for (i in nc_files)

#open tif files and stack and levelplot 
library(raster)
library(rgdal)
library(rasterVis)
wd = setwd("/mnt/drive/COVID AIR Nov 6/Method/R_CODES/COVID & AIR QUALITY -DHAKA DELHI/DHK_NOX_GTIFF")
tif_files <- list.files(paste0(wd), pattern = ".tif$",recursive = TRUE)
stack_files <- stack(tif_files)
names(stack_files)
rasterNames <- gsub("DHK_NO2_L3_", " ", names(stack_files))
rasterNames
dist_map= levelplot(stack_files, 
                    main = "WEEKLY TRPOSPHERIC NOx , JANUARY- DECEMBER 2020, DHAKA",
                    names.attr = rasterNames,
                    scales=list(draw=FALSE ),
                    xlab= NULL,
                    ylab= NULL)
dist_map


#################################################### AER DISTRIBUTION MAP #########################################################################

#AER

# Open nc files and write to tiff files 

nc_files=list.files("/mnt/drive/data nov 6/data/data analysis/", pattern = "*.nc$", recursive = TRUE, full.names =TRUE)
nc_files
shp<- readOGR("/mnt/drive/data nov 6/data/data analysis/", "dhaka")


#conversion loop 
for (i in nc_files){
  print(i)
  x=stack(i, varname="absorbing_aerosol_index")
  x[is.na(x)]<-0
  x<- mask(x,shp)
  #filename
  filename <- gsub("_", " ", i)
  filename <- gsub("/mnt/drive/data nov 6/data/data analysis//", " ",filename)
  filename <- gsub("*.nc", " ", filename)
  writeRaster(x,filename=filename,format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
  #y=levelplot(x,main = filename)
  #print(y)
}



#open tif files and stack and levelplot 
library(raster)
library(rgdal)
library(rasterVis)
wd = setwd("/mnt/drive/COVID AIR Nov 6/Method/R_CODES/COVID & AIR QUALITY -DHAKA DELHI/DHK_NOX_GTIFF")
tif_files <- list.files(paste0(wd), pattern = ".tif$",recursive = TRUE)
stack_files <- stack(tif_files)
stack_files
names(stack_files)
rasterNames <- gsub("DHK_AER_L3_", " ", names(stack_files))
rasterNames
dist_map= levelplot(stack_files, 
                    main = "WEEKLY ATMOSPHERIC AEROSOL INDEX, JANUARY- DECEMBER 2020, DHAKA",
                    names.attr = rasterNames,
                    scales=list(draw=FALSE ),
                    xlab= NULL,
                    ylab= NULL,
                    par.settings = RdBuTheme)
dist_map



                                                          #####CO DISTRIBUTION MAP#####


#packages installed 
library(ncdf4)
library(raster)
library(rasterVis)
library(rgdal)
# Open nc files and write to tiff files 
nc_files=list.files("/mnt/drive/data nov 6/data/data analysis/", pattern = "*.nc$", recursive = TRUE, full.names =TRUE)
nc_files
shp<- readOGR("/mnt/drive/data nov 6/data/data analysis/", "dhaka")


#conversion loop 
for (i in nc_files){
  print(i)
  x=stack(i, varname="CO_column_number_density")
  x[is.na(x)]<-0
  x[x<0]<-0
  x<- mask(x,shp)
  #filename
  filename <- gsub("_", " ", i)
  filename <- gsub("/mnt/drive/data nov 6/data/data analysis//", " ",filename)
  filename <- gsub("*.nc", " ", filename)
  writeRaster(x,filename=filename,format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
  #y=levelplot(x,main = filename)
  #print(y)
}



#open tif files and stack and levelplot 
library(raster)
library(rgdal)
library(rasterVis)
wd = setwd("/mnt/drive/COVID AIR Nov 6/Method/R_CODES/COVID & AIR QUALITY -DHAKA DELHI/DHK_NOX_GTIFF")
tif_files <- list.files(paste0(wd), pattern = ".tif$",recursive = TRUE)
tif_files
stack_files <- stack(tif_files)
stack_files
names(stack_files)
rasterNames <- gsub("DHK_CO_L3_", " ", names(stack_files))
rasterNames
dist_map= levelplot(stack_files, 
                    main = "CO COLUMN NUMBER DENSITY(mol/m2), JANUARY- DECEMBER 2020, DHAKA",
                    names.attr = rasterNames,
                    scales=list(draw=FALSE ),
                    xlab= NULL,
                    ylab= NULL,
                    par.settings = infernoTheme)
dist_map

                                                                      ######SOx DISTRIBUTION#####
#packages installed 
library(ncdf4)
library(raster)
library(rasterVis)
library(rgdal)
# Open nc files and write to tiff files 
nc_files=list.files("/mnt/drive/data nov 6/data/data analysis/", pattern = "*.nc$", recursive = TRUE, full.names =TRUE)
nc_files
shp<- readOGR("/mnt/drive/data nov 6/data/data analysis/", "dhaka")


#conversion loop 
for (i in nc_files){
  print(i)
  x=stack(i, varname="SO2_column_number_density")
  x[is.na(x)]<-0
  x[x<0]<-0
  x<- mask(x,shp)
  #filename
  filename <- gsub("_", " ", i)
  filename <- gsub("/mnt/drive/data nov 6/data/data analysis//", " ",filename)
  filename <- gsub("*.nc", " ", filename)
  writeRaster(x,filename=filename,format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
  #y=levelplot(x,main = filename)
  #print(y)
}



#open tif files and stack and levelplot 
library(raster)
library(rgdal)
library(rasterVis)
library(ncdf4)
wd = setwd("/mnt/drive/COVID AIR Nov 6/Method/R_CODES/COVID & AIR QUALITY -DHAKA DELHI/DHK_NOX_GTIFF")
tif_files <- list.files(paste0(wd), pattern = ".tif$",recursive = TRUE)
tif_files
stack_files <- stack(tif_files)
stack_files
names(stack_files)
rasterNames <- gsub("DHK_SO2_L3_", " ", names(stack_files))
rasterNames
dist_map= levelplot(stack_files, 
                    main = "SOx COLUMN NUMBER DENSITY(mol/m2), JANUARY- DECEMBER 2020, DHAKA",
                    names.attr = rasterNames,
                    scales=list(draw=FALSE ),
                    xlab= NULL,
                    ylab= NULL,
                    par.settings = infernoTheme)
dist_map

                            #############################DELHI NOx DISt###############################################

# Open nc files and write to tiff files 

nc_files=list.files("/media/mi/Backup drive/COVID AIR/data/Level 3 Data/Delhi", pattern = c("*NO2.","*.nc$"), recursive = TRUE, full.names =TRUE)
nc_files
shp<- readOGR("/mnt/drive/data nov 6/data/data analysis/", "delhi")
plot(shp)


#conversion loop 
for (i in nc_files){
  print(i)
  x=stack(i, varname="tropospheric_NO2_column_number_density")
  x[is.na(x)]<-0
  x<- mask(x,shp)
  #filename
  filename <- gsub("_", " ", i)
  filename <- gsub("/mnt/drive/data nov 6/data/data analysis//", " ",filename)
  filename <- gsub("*.nc", " ", filename)
  plot(x,main=filename)
  writeRaster(x,filename=filename,format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
  #y=levelplot(x,main = filename)
  #print(y)
}

#open tif files and stack and levelplot 
library(raster)
library(rgdal)
library(rasterVis)

wd = setwd("/mnt/drive/COVID AIR Nov 6/Method/R_CODES/COVID & AIR QUALITY -DHAKA DELHI/DHK_NOX_GTIFF")
tif_files <- list.files(paste0(wd), pattern = ".tif$",recursive = TRUE)
tif_files
stack_files <- stack(tif_files)
stack_files
names(stack_files)
rasterNames <- gsub("DEL_NO2_L3_", " ", names(stack_files))
rasterNames
dist_map= levelplot(stack_files, 
                    main = "WEEKLY TRPOSPHERIC NOx , JANUARY- DECEMBER 2020, DELHI",
                    names.attr = rasterNames,
                    scales=list(draw=FALSE ),
                    xlab= NULL,
                    ylab= NULL)
dist_map


##############################################DELHI SOx Dist##############################################################
# Open nc files and write to tiff files 

nc_files=list.files("/media/mi/Backup drive/COVID AIR/data/Level 3 Data/Delhi", pattern = c("*SO2.","*.nc$"), recursive = TRUE, full.names =TRUE)
nc_files
shp<- readOGR("/mnt/drive/data nov 6/data/data analysis/", "delhi")
plot(shp)

#conversion loop 
for (i in nc_files){
  print(i)
  x=stack(i, varname="SO2_column_number_density")
  x[is.na(x)]<-0
  x[x<0]<-0
  x<- mask(x,shp)
  #filename
  filename <- gsub("_", " ", i)
  filename <- gsub("/mnt/drive/data nov 6/data/data analysis//", " ",filename)
  filename <- gsub("*.nc", " ", filename)
  plot(x, main= filename)
  writeRaster(x,filename=filename,format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
  #y=levelplot(x,main = filename)
  #print(y)
}



#open tif files and stack and levelplot 
library(raster)
library(rgdal)
library(rasterVis)
wd = setwd("/mnt/drive/COVID AIR Nov 6/Method/R_CODES/COVID & AIR QUALITY -DHAKA DELHI/DHK_NOX_GTIFF")
tif_files <- list.files(paste0(wd), pattern = ".tif$",recursive = TRUE)
tif_files
stack_files <- stack(tif_files)
names(stack_files)
rasterNames <- gsub("DEL_SO2_L3_", " ", names(stack_files))
rasterNames
dist_map= levelplot(stack_files, 
                    main = "WEEKLY SOx COLUMN NUMBER DENSITY(mol/m2), JANUARY- DECEMBER 2020, DELHI",
                    names.attr = rasterNames,
                    scales=list(draw=FALSE ),
                    xlab= NULL,
                    ylab= NULL,
                    par.settings = infernoTheme)
dist_map

##########################################################################DELHI AER Dist   #################################################
# Open nc files and write to tiff files 

nc_files=list.files("/media/mi/Backup drive/COVID AIR/data/Level 3 Data/Delhi", pattern = c("*AER.","*.nc$"), recursive = TRUE, full.names =TRUE)
nc_files
shp<- readOGR("/mnt/drive/data nov 6/data/data analysis/", "delhi")
plot(shp)

#conversion loop 
for (i in nc_files){
  print(i)
  x=stack(i, varname="absorbing_aerosol_index")
  x[is.na(x)]<-0
  x<- mask(x,shp)
  #filename
  filename <- gsub("_", " ", i)
  filename <- gsub("/mnt/drive/data nov 6/data/data analysis//", " ",filename)
  filename <- gsub("*.nc", " ", filename)
  writeRaster(x,filename=filename,format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
  plot(x, main=filename)
  #y=levelplot(x,main = filename)
  #print(y)
}



#open tif files and stack and levelplot 
library(raster)
library(rgdal)
library(rasterVis)
wd = setwd("/mnt/drive/COVID AIR Nov 6/Method/R_CODES/COVID & AIR QUALITY -DHAKA DELHI/DHK_NOX_GTIFF")
tif_files <- list.files(paste0(wd), pattern ="*.tif$",recursive = TRUE)
tif_files
stack_files <- stack(tif_files)
stack_files
names(stack_files)
rasterNames <- gsub("DEL_AER_L3_", " ", names(stack_files))
rasterNames
dist_map= levelplot(stack_files, 
                    main = "WEEKLY ATMOSPHERIC AEROSOL INDEX(AQI) , JANUARY-DECEMBER 2020, DELHI",
                    names.attr = rasterNames,
                    scales=list(draw=FALSE ),
                    xlab= NULL,
                    ylab= NULL,
                    par.settings = RdBuTheme)
dist_map

###########################################################DELHI CO DIST####################################################################
# Open nc files and write to tiff files 

nc_files=list.files("/media/mi/Backup drive/COVID AIR/data/Level 3 Data/Delhi", pattern = c("*CO.","*.nc$"), recursive = TRUE, full.names =TRUE)
nc_files
shp<- readOGR("/mnt/drive/data nov 6/data/data analysis/", "delhi")
plot(shp)

#conversion loop 
for (i in nc_files){
  print(i)
  x=stack(i, varname="CO_column_number_density")
  x[is.na(x)]<-0
  x[x<0]<-0
  x<- mask(x,shp)
  #filename
  filename <- gsub("_", " ", i)
  filename <- gsub("/mnt/drive/data nov 6/data/data analysis//", " ",filename)
  filename <- gsub("*.nc", " ", filename)
  plot(x, main=filename)
  writeRaster(x,filename=filename,format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
  #y=levelplot(x,main = filename)
  #print(y)
}



#open tif files and stack and levelplot 
library(raster)
library(rgdal)
library(rasterVis)
wd = setwd("/mnt/drive/COVID AIR Nov 6/Method/R_CODES/COVID & AIR QUALITY -DHAKA DELHI/DHK_NOX_GTIFF")
tif_files <- list.files(paste0(wd), pattern = ".tif$",recursive = TRUE)
tif_files
stack_files <- stack(tif_files)
stack_files
names(stack_files)
rasterNames <- gsub("DEL_CO_L3_", " ", names(stack_files))
rasterNames
dist_map= levelplot(stack_files, 
                    main = "WEEKLY CO COLUMN NUMBER DENSITY , JANUARY- DECEMBER 2020, DELHI",
                    names.attr = rasterNames,
                    scales=list(draw=FALSE ),
                    xlab= NULL,
                    ylab= NULL,
                    par.settings = infernoTheme)
dist_map
