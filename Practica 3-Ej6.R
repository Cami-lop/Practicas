#################### Practica 3 ###################
#Ejercicio 6
getwd()
setwd("/home/clinux01/Escritorio/CamiLabo/Practicas/Datos Practica 3-20231003/")
#a-
#Apply
load("/home/clinux01/Escritorio/CamiLabo/Practicas/Datos Practica 3-20231003/temp_bsas.RData")
class(datos_dimensiones) #preguntar pq l hago en  variable y no en datos dimensiones
punto_de_reticula<-8*14
prom_men<- matrix(data= datos_dimensiones, ncol = 4, nrow = 112) #manera 2
dim(prom_men)
prom_men

#Ciclos
nlong<-8
nlat<-14
nnivel<-4
ntiempo<-72
lat<-0
m<-0
tiempo<-0
for( tiempo in variable){
  for(n in nnivel){
    for(lat in nlat){
     lat<-lat*nlong 
    }
  }
  m<-matrix(variable,ncol=lat, nrow = n)
}
dim(m)
#b)Obtener la temperatura media anual en el perıodo analizado para cada nivel y cada punto de retıcula.
nanios<-ntiempo/12
datos_array<- array(data = variable, dim = c(nlong, nlat,nnivel,nanios))

prom_anual<-apply(datos_array,c(3),mean) #son seis años pero 4 niveles no entiedo como me tienen que dar las dimensiones

#c)Utilizando la indexacion logica seleccione el nivel de 850hPa e imprima por pantalla el promedio de temperatura sobre el dominio para cada año
prom<-apply(datos_array,c(1,2,3),mean)
prom_850<-prom[,,2]

#d)Utilizando la indexacion logica seleccione el punto de ret´ıcula m´as cercano a la localidad de Olavarrıa y obtenga la temperatura promedio para cada a˜no en el nivel de 1000hPa.
#Busque la coor de Olavarria -36.89272 S, -60.32254 O
latitudes<-seq(90,-90, by=-1)
lat_olavarria<-which(latitudes==-36)
longitudes<-seq(-90,90, by=1)
lon_olavarria<-which(longitudes==-60)
attach(datos_dimensiones)
altura<-which(datos_dimensiones$isobaricInhPa==1000)
datos_olavarria<-variable[lon_olavarria,lat_olavarria,altura,]
