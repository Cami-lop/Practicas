getwd()
#########Ejercicio 3##########
v<-c(seq(1,120, by=2))
valor_max<-max(v) #valor max
v[5] #posicion 5
v[3:7] #valor de v en las posiciones de 3 a 7
vm<-mean(v)
which(v>vm) #posiciones donde v es mayor al la media
########Ejercicio 4###########
rm(list=ls())
diciembre<-as.numeric(c(20,30,10))
enero<-(c(NA,70,30 ))
febrero<-c(NA,90,40)
verano<-matrix(data =c(diciembre,enero,febrero),nrow=3 , ncol=3, byrow=T)
rownames(verano)<-c("Diciembre","Enero","Febrero")
colnames(verano)<-c("PP media (mm)","PP max (mm)", "PP min (mm)")
#como lo hago con los mm


rango<-c()
for( mes in 1:nrow(verano)){
  r<-(verano[mes,2]-verano[mes,3])
  rango<-c(rango,r)
}

verano<-cbind(verano,rango)
posiciones_na<-which(is.na(verano))
#4)ii)
sum(verano[verano>30],na.rm = T)
#Suma los valores de verano que cumplen que son mayores a 3o y ademas, esta ignorando a los datos faltantes (NA)
apply(verano,c(2),mean, na.rm=TRUE)
#aplica a todas las columnas la funcion mean

familia <- list(madre = "Maria", tia = "Juana",
                casados = 10,hijos = c("Hugo","Paula"),
                edades = c(8, 6))

lapply(familia, function(x) length(x))
#longitud de cada elemento de la lista

iniciales<-c("a","b","c","d","e")
for(x in iniciales){
  if(x=="r"){
    break}
  print(x)
  }
