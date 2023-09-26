#Parcialito Camila Lopez

getwd()   #veo donde esta mi directorio 
rm(list=ls())
#setwd("/home/clinux01/Escritorio/CamiLabo/")  #Lo seteo 
#setwd("C:/Users/Fernando Cabrera/Desktop/Cami_Labo/Practicas/") #compu casa

dias<-readline("Ingrese un dia del mes de Agosto")
agosto<-1:31  #dias del mes de agosto
temp<-0

#Verifico si el dia ingresado es correcto
repeat{
  if(dias<1 | dias>31 ){
    print("ERROR, EL NUMERO INGRESADO NO ES VALIDO")
    dias<-readline("Ingrese un dia del mes de Agosto")
  } else if( dias>=1 | dias<=31){
    break
  }
}

 for(dia in agosto){
    temperatura<-as.numeric(readline("Ingrese temperatura en °C"))
  while(is.na(temperatura)){   #puse el while para que se repita hasta que deje de cumplir la conicion de is.na
    temperatura<-as.numeric(readline("Ingrese la temperatura nuevamente en °C"))    
  }
    temp<-temp+temperatura
    if (dias==dia){
      temp_analisis<-temperatura 
  }
}    

#Promedio de la temperatura
promedio_temp<-temp/31


if(temp_analisis<promedio_temp){
    cat("El dia",dias,"del mes de Agosto la temperatura fue de",temp_analisis,"°C es decir debajo de la media mensual","\n")
 } else if(temp_analisis>promedio_temp) {
    cat("El dia",dias,"del mes de Agosto la temperatura fue de",temp_analisis,"ºC es decir por encima  de la  media mensual","\n")
  } else {
   cat("El dia",dias,"del mes de Agosto la temperatura fue de",temp_analisis,"ºC es decir igual a la media mensual","\n")
 }    


































































