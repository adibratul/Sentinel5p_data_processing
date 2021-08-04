library(rgdal)
library(raster)
library(sp)
library(colorRamps)
library(ggmap)
library(ggplot2)



bdpop = raster("/mnt/drive/COVID AIR Nov 6/Method/R_CODES/COVID & AIR QUALITY -DHAKA DELHI/DHK_NOX_GTIFF/bgd_ppp_2020.tif")
bdpop
plot(bdpop)


dhk_shp= readOGR("/mnt/drive/data nov 6/data/Shapefiles/cities shapefile/Dhaka/Dhaka District/Dhaka", "dhaka")

crop_dhk=mask(bdpop,dhk_shp)
crop_dhk[is.na(crop_dhk)]<-0
crop_dhk<-log10(crop_dhk)
crop_dhk<- mask(crop_dhk,dhk_shp)
plot(crop_dhk)
plot(crop_dhk,xlim=c(90.0,90.5),ylim=c(23.5,24.05),colNA=NA, col=colorRampPalette(c("#121212", "#123620", "#108650", "#80D6C0", "#DFDF3B"),0.5)(110))
e <- drawExtent()
zoom(crop_dhk,e)


gmap = get_map(location=c(90.4125,23.8103), zoom=12, scale=1, maptype = "roadmap", source="google", color="bw")
gmapbbox = attr(gmap, "bb")
subpop <- crop_dhk
subpopDF = data.frame(rasterToPoints(subpop))
colnames(subpopDF) = c("lon", "lat", "z")
bm = ggmap(gmap)
bm = bm + geom_raster(data = subpopDF, aes(y=lat, x=lon, fill=z), alpha=0.6) + 
  scale_fill_gradientn(colours=rev(c("#FF1202FF", "#FDAD22FF", "#FDFD22FF", "#00000077")), values = c(0,0.1,0.5,1) ) + coord_cartesian()
plot(bm)
