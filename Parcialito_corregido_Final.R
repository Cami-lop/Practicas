#Parcialito Camila Lopez

getwd()   #veo donde esta mi directorio 
#setwd("/home/clinux01/Descargas/CamiLabo/")  #Lo seteo 
#setwd("C:/Users/Fernando Cabrera/Desktop/Cami_Labo/Practicas/") #compu casa

#setwd("C:/Users/usuario/Downloads/")  #compu casa 2

dias<-readline("Ingrese un dia del mes de Agosto")
agosto<-1:31  #dias del mes de agosto
temp<-0


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
    temp[dia]<-temperatura 
    if(dias==dia){
      temp_analisis<-temperatura
  }
}    


print(temp)    

promedio_temp<-round(mean(temp)) 


if(temp_analisis<promedio_temp){
    print(paste("El dia",dias,"del mes de Agosto la temperatura fue de",temp_analisis,"°C es decir debajo de la media mensual"))
 }else if(temp_analisis>promedio_temp){
    print(paste("El dia",dias,"del mes de Agosto la temperatura fue de",temp_analisis,"ºC es decir por encima  de la  media mensual"))
  }else if(temp_analisis==promedio_temp){
    print(paste("El dia",dias,"del mes de Agosto la temperatura fue de",temp_analisis,"ºC es decir igual a la media mensual"))
 }    


































































