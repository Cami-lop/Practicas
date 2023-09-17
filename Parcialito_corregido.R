#Parcialito Camila Lopez

getwd()   #veo donde esta mi directorio 
#setwd("/home/clinux01/Descargas/CamiLabo/")  #Lo seteo para que est donde quiero

dias<-readline("Ingrese un dia del mes de Agosto")
agosto<-1:31  #dias del mes de agosto
temp<-c()


repeat{
  if(dias<1 | dias>31 ){
    print("ERROR, EL NUMERO INGRESADO NO ES VALIDO")
    dias<-readline("Ingrese un dia del mes de Agosto")
  } else if( dias>=1 | dias<=31){
    break
  }
}

if((dias>=1) | (dias<=31)){
 for(dia in agosto){
    temperatura<-as.numeric(readline("Ingrese temperatura en °C"))
    temp<-as.numeric(c(temp,temperatura))
 }    
}

print(temp)    
promedio_temp<-(mean(temp)) 
    
if(temperatura<promedio_temp){
    print(paste("El dia",dias,"del mes de Agosto la temperatura fue de",temperatura,"°C es decir debajo de la media mensual"))
 }else if(temperatura>promedio_temp){
    print(paste("El dia",dias,"del mes de Agosto la temperatura fue de",temperatura,"es decir por encima  de la  media mensual"))
  }else if(temperatura==promedio_temp){
    print(paste("El dia",dias, "del mes de Agosto la temperatura fue de",temperatura,"ºC es decir igual a la media mensual"))
}    
  
































































