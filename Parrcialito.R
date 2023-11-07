#Parcialito
agosto<-1:31
dias<-as.numeric(readline("Ingrese un dia del mes de agosto"))

repeat{
  if((dias<1) | (dias>31)){
  dias<-as.numeric(readline("Ingrese un dia del mes de agosto"))
  }
  else{
  break
  }
}
  
temp<-0
  
for(dia in agosto){
 t<-as.numeric(readline("Ingrese la temperatura en °C"))
 while(is.na(t)){
      t<-as.numeric(readline("Ingrese nuevamente la temperatura en °C"))
} 
 temp<-temp+t
if (dias==dia){
  temp_analisis<-t
}
}
  
promedio<-temp/31
    
if(temp_analisis<promedio){
      print(paste("El dıa" ,dias ,"del mes de Agosto la temperatura fue de", temp_analisis,"°C, es decir debajo de la media mensual"))
    }else if(temp_analisis==promedio){
      print(paste("El dıa" ,dias ,"del mes de Agosto la temperatura fue de", temp_analisis,"°C, es decir igual a la media mensual"))
    }else{
      print(paste("El dıa" ,dias ,"del mes de Agosto la temperatura fue de", temp_analisis,"°C, es decir por encima  de la media mensual"))
    }
