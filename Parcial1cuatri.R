rm(list=ls())
getwd()
#setwd("/home/clinux01/Escritorio/CamiLabo/Practicas/")
setwd("C:/Users/Fernando Cabrera/Desktop/Cami_Labo/Practicas/")
#########################1° Parcial 2023#####################

fecha<-as.numeric(readline("Ingrese la fecha en el formato DDMMAA"))
estaciones<-as.numeric(readline("Ingrese la cantidad de estaciones que va a informar"))
while(is.na(fecha) | is.na(estaciones)){
  fecha<-readline("Ingrese la fecha en el formato DD-MM-AA")
  estaciones<-readline("Ingrese la cantidad de estaciones que va a informar")
}
 
nombres<-c() 
presion<-c()

while(length(nombres)<estaciones) {
  nombre<-readline("Ingrese  el nombre de la estacion")
  pres<-as.numeric(readline("Ingrese la presion en hPa para la estacion"))
  while (is.na(nombre) | is.na(pres)) {
    nombre<-readline("Ingrese nuevamente el nombre de la estacion") 
    pres<-as.numeric(realine("Ingrese nuevamente la presion en hPa para la estacion")) 
 }
  nombres<-c(nombres,nombre)
  presion<-c(presion,pres)
}

for(i in 1:length(nombres)){
  if(presion[i]>1013.5){ 
    excedente<-(presion[i]-1013.5)
    print(paste("La estacion",nombres[i],"el dia",substr(fecha,1,2),"de",substr(fecha,3,4),"del",substr(fecha,5,6),"se encuentra bajo condiciones de ALTA PRESION superando los 1013.5 hPa en",excedente,"hPa"))
  }else if(presion[i]==1013.5){
    print(paste("La estacion",nombres[i],"el dia",substr(fecha,1,2),"de",substr(fecha,3,4),"del",substr(fecha,5,6),"se encuentra bajo condiciones de NORMALES DE PRESION"))
  }else{
    deficit<-( 1013.5-presion[i])
    print(paste("La estacion",nombres[i],"el dia",substr(fecha,1,2),"de",substr(fecha,3,4),"del",substr(fecha,5,6),"se encuentra bajo condiciones de BAJA PRESION por debajo los 1013.5 hPa en",deficit,"hPa"))
  }
}  

################# 2 Ejercicio#####################
set.seed(123)
datos<-rnorm(19716,mean = 25,sd=5)
long<-seq(51,64,by=0.25)
lat<-seq(23,38,by=0.5)
datos_array<-array(data =datos,c(53,31,12))
long_ordenada<-sort(long,decreasing=T)
lat_ordenada<-sort(lat,decreasing = T)
tiempo<-1:12
dimnames(datos_array)<-list(long_ordenada,lat_ordenada,tiempo)

#2bi) seleccionar datos de marzo
datos_array[,,3] #mes 3
max_marzo<-max(datos_array[,,3])
min_marzo<-min(datos_array[,,3])
pos_max<-which(datos_array[,,3]==max_marzo, arr.ind = TRUE)
pos_min<-which(datos_array[,,3]==min_marzo, arr.ind = TRUE)

#busque las posiciones y luego busco el valor en los datos ordenados
valor_max_lon<-long_ordenada[6]
valor_max_lat<-lat_ordenada[22]

valor_min_lon<-long_ordenada[37]
valor_min_lat<-lat_ordenada[3]

#2bii)
marzo_df<-data.frame("Longitudes"=c(valor_min_lon,valor_max_lon),
                     "Latitudes"=c(valor_min_lat,valor_max_lat),
                     "Temperaturas"=c(min_marzo,max_marzo))
rownames(marzo_df)<-c("Tmin","Tmax")
marzo_df$Temperaturas<-round(marzo_df$Temperaturas, 1) # , el numero de decimales que quiero. sino tengo el espacio no me lo toma



#2c)Campo medio para la primavera
datos_primavera<-datos_array[,,9:11]
campo_medio_primavera<-apply(datos_primavera,c(1,2),mean)

#mediana y desvio
mediana_primavera<-median(campo_medio_primavera)
desvio_primavera<-sd(campo_medio_primavera)

estadisticos<-list("Mediana"=mediana_primavera,
                   "Desvio"=desvio_primavera)
media<-mean(campo_medio_primavera)

estadisticos[3]<-media
names(estadisticos)[3]<-"Media"
