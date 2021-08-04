library(ncdf4)
library(raster)
library(rasterVis)
library(rgdal)
wd <- "/media/mi/Backup drive/COVID AIR/data/GTiff/DELHI_GTiff/DEL AER L3 2020/"
wd
AER_tif=list.files("/media/mi/Backup drive/COVID AIR/data/GTiff/DELHI_GTiff/DEL AER L3 2020/", pattern = c("*AER.","*.tif$"), recursive = TRUE, full.names = TRUE)
SO2_tif=list.files("/media/mi/Backup drive/COVID AIR/data/GTiff/DELHI_GTiff/DEL SO2 L3 2020/", pattern = c("*SO2.","*.tif$"), recursive = TRUE, full.names =TRUE)
CO_tif=list.files("/media/mi/Backup drive/COVID AIR/data/GTiff/DELHI_GTiff/DEL CO L3 2020/", pattern = c("*CO.","*.tif$"), recursive = TRUE, full.names =TRUE)
NO2_tif=list.files("/media/mi/Backup drive/COVID AIR/data/GTiff/DELHI_GTiff/DEL NO2 L3 2020/", pattern = c("*NO2.","*.tif$"), recursive = TRUE, full.names =TRUE)

stak_AER= stack(AER_tif)
stak_SO2= stack(SO2_tif)
stak_CO=  stack(CO_tif)
stak_NO2= stack(NO2_tif)

del_mean_AER = mean(stak_AER)
del_mean_CO = mean(stak_CO)
del_mean_NO2 = mean(stak_NO2)
del_mean_SO2= mean(stak_SO2)

writeRaster(del_mean_AER,filename="Aerosol Index Delhi 2020",format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
writeRaster(del_mean_CO,filename="Carbon Monoxide Delhi 2020",format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
writeRaster(del_mean_NO2,filename="Nitrogen Di Oxide  Delhi 2020",format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
writeRaster(del_mean_SO2,filename="Sulpher Di Oxide Delhi 2020",format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)


#####DEL_MAP####
del_no2= levelplot(del_mean_NO2, 
                    main = "Annual Average, Delhi")

del_SO2= levelplot(del_mean_SO2, 
                   main = "Annual Average, Delhi",
                   par.settings = infernoTheme)
del_AER= levelplot(del_mean_AER, 
                   main = "Annual Average, Delhi",
                   par.settings = RdBuTheme)
del_AER= levelplot(del_mean_AER, 
                   main = "Annual Average, Delhi",
                   par.settings = )


DEL_AVG= list.files("/mnt/drive/COVID AIR Nov 6/Method/R_CODES/COVID & AIR QUALITY -DHAKA DELHI/DHK_NOX_GTIFF/", pattern ="*.tif$", recursive = TRUE, full.names = TRUE)
DEL_AVG
st_avg = stack(DEL_AVG)
levelplot(st_avg)
plot(st_avg)

#####DHK####

AER_tif=list.files("/media/mi/Backup drive/COVID AIR/data/GTiff/Dhaka_GTiff/DHK AER L3 2020//", pattern = c("*AER.","*.tif$"), recursive = TRUE, full.names = TRUE)
SO2_tif=list.files("/media/mi/Backup drive/COVID AIR/data/GTiff/Dhaka_GTiff/DHK SO2 L3 2020/", pattern = c("*SO2.","*.tif$"), recursive = TRUE, full.names =TRUE)
CO_tif=list.files("/media/mi/Backup drive/COVID AIR/data/GTiff/Dhaka_GTiff/DHK CO L3 2020/", pattern = c("*CO.","*.tif$"), recursive = TRUE, full.names =TRUE)
NO2_tif=list.files("/media/mi/Backup drive/COVID AIR/data/GTiff/Dhaka_GTiff/DHK NO2 L3 2020/", pattern = c("*NO2.","*.tif$"), recursive = TRUE, full.names =TRUE)

stak_AER= stack(AER_tif)
stak_SO2= stack(SO2_tif)
stak_CO=  stack(CO_tif)
stak_NO2= stack(NO2_tif)

dhk_mean_AER = mean(stak_AER)
dhk_mean_CO = mean(stak_CO)
dhk_mean_NO2 = mean(stak_NO2)
dhk_mean_SO2= mean(stak_SO2)

writeRaster(del_mean_AER,filename="Aerosol Index Dhaka 2020",format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
writeRaster(del_mean_CO,filename="Carbon Monoxide Dhaka 2020",format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
writeRaster(del_mean_NO2,filename="Nitrogen Di Oxide Dhaka 2020",format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)
writeRaster(del_mean_SO2,filename="Sulpher Di Oxide Dhaka 2020",format="GTiff" ,option="INTERLEAVE=BAND", overwrite=T)


#####DEL_MAP####
del_no2= levelplot(del_mean_NO2, 
                   main = "Annual Average, Delhi")

del_SO2= levelplot(del_mean_SO2, 
                   main = "Annual Average, Delhi",
                   par.settings = infernoTheme)
del_AER= levelplot(del_mean_AER, 
                   main = "Annual Average, Delhi",
                   par.settings = RdBuTheme)
del_AER= levelplot(del_mean_AER, 
                   main = "Annual Average, Delhi",
                   par.settings = )


DHK_AVG= list.files("/mnt/drive/COVID AIR Nov 6/Method/R_CODES/COVID & AIR QUALITY -DHAKA DELHI/DHK_NOX_GTIFF/", pattern ="*.tif$", recursive = TRUE, full.names = TRUE)
DHK_AVG
st_avg = stack(DHK_AVG)
levelplot(st_avg)
plot(st_avg)
