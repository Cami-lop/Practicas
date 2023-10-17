#################### Practica 3 ###################
#Ejercicio 6
getwd()
setwd("/home/clinux01/Escritorio/CamiLabo/Practicas/Datos Practica 3-20231011/")
#a-
#Apply
load("temp_bsas.RData")

class(datos_dimensiones) #preguntar pq l hago en  variable y no en datos dimensiones
#Ciclos
nlong<-8
nlat<-14
nnivel<-4
ntiempo<-72
meses<-12
anios<-6
pto_reticula<-0
m<-0
tiempo<-0
datos<-array(data=variable, dim =c(8,14,4,12,6) )
promedio_m<-apply(datos,c(1,2,3,4),mean)
promedio<-array(NA,c(8,14,4,12)) #cuand hago el apply pongo dim que estan fijas y cuando armol el array las dim que tienen que tener
for(lon in nlong){
  for(l in nlat){
    for(n in nnivel){
     for(t in 1:12){
       promedio[lon,l,n,t]<-mean(datos[lon,l,n,t,])
     }
    }
  }
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
