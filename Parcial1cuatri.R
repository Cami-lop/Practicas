rm(list=ls())
getwd()
setwd("/home/clinux01/Escritorio/CamiLabo/Practicas/")
#########################1° Parcial 2023#####################

fecha<-as.numeric(readline("Ingrese la fecha en el formato DDMMAA"))
estaciones<-as.numeric(readline("Ingrese la cantidad de estaciones que va a informar"))
while(is.na(fecha) | is.na(estaciones)){
  fecha<-readline("Ingrese la fecha en el formato DD-MM-AA")
  estaciones<-readline("Ingrese la cantidad de estaciones que va a informar")
}
 
nombres<-c() 
presion<-c()

while (length(nombres)<estaciones) {
  nombre<-readline("Ingrese  el nombre de la estacion")
  pres<-as.numeric(readline("Ingrese la presion en hPa para la estacion"))
  while (is.na(nombre) | is.na(pres)) {
    nombre<-readline("Ingrese nuevamente el nombre de la estacion") 
    pres<-as.numeric(realine("Ingrese nuevamente la presion en hPa para la estacion")) 
 }
  nombres<-c(nombres,nombre)
  presion<-c(presion,pres)
}

for(valor in presion){
  if(valor>1013.5){ #FALTA CALCULAR EL EXCEDENTE
    print(paste("La estacion",nombres[which(presion>1013.5)],"el dia",substr(fecha,1,2),"de",substr(fecha,3,4),"del",substr(fecha,5,6),"se encuentra bajo condiciones de ALTA PRESION superando los 1013.5 hPa en",valor,"hPa"))
  }else if(valor==1013.5){
    print(paste("La estacion",nombres[which(presion==1013.5)],"el dia",substr(fecha,1,2),"de",substr(fecha,3,4),"del",substr(fecha,5,6),"se encuentra bajo condiciones de NORMALES DE PRESION"))
  }else{#FALTA EL DEFICIT
    print(paste("La estacion",nombres[which(presion<1013.5)],"el dia",substr(fecha,1,2),"de",substr(fecha,3,4),"del",substr(fecha,5,6),"se encuentra bajo condiciones de BAJA PRESION por debajo los 1013.5 hPa en",valor,"hPa"))
  }
}  
