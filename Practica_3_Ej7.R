getwd()
setwd("C:/Users/Fernando Cabrera/Desktop/Cami_Labo/Practicas/")
############Ejercicio 7###########

#temp <-scan("datos_tmedia_SABE_2010.txt",sep="") no me corre con esta funcion 
archivo<-"C:/Users/Fernando Cabrera/Desktop/Cami_Labo/Practicas/Datos Practica 3-20231011/datos_tmedia_SABE_2010.txt"

datos_temp<- read.table(archivo,header = TRUE, col.name="Temp_media")
#a)Dado que se trata de temperaturas medias mensuales para la Ciudad de Buenos Aires, valores
#superiores a 40◦C son, muy probablemente, erroneos de acuerdo con el comportamiento climatologico de esta variable. Dise˜nar y programar un algoritmo que identifique la posici´on dentro
#de la serie de los dıas donde el valor de la temperatura media supera los 40◦C, pero que ademas
#muestre el valor del dıa anterior y del dıa siguiente. Obtener la cantidad total de elementos
#erroneos.
class(datos_temp)
posiciones_erroneas<-which(datos_temp>40)
attach(datos_temp)
dim(datos_temp)
length(posiciones_erroneas) #cdantidad de datos erroneos

valores_erroneos<-c()
valor_error<-datos_temp$Temp_media[datos_temp>40] #valores erroneos

valores_desp<-c()
valores_antes<-c()
for(valor in posiciones_erroneas){
 valores_antes<-datos_temp[valor-1,]
 valores_desp<-datos_temp[valor+1,]
  valores_erroneos<-c(valores_antes,valores_desp,valores_erroneos)
}  

print(valores_erroneos)# preguntar porque se guarda de atras para adelante 

#b)Calcular el valor maximo y el mınimo de la serie teniendo en cuenta los puntos err´oneos y sin
#tenerlos en cuenta. Calcular la cantidad total de datos faltantes. Remover los elementos faltantes
#y los erroneos de la serie de temperatura.
valor_max<-c()
valor_min<-c()
extremos<-c()
dato_faltante<- -999.0 
datos_temp[,1][datos_temp[,1]==dato_faltante]<-NA
datos_temp[,1][datos_temp[,1]>40]<-NA
for(valores in datos_temp[,1]){
  if(as.numeric(valores) >40){
    valor_max<-max(datos_temp[,1], na.rm = T)
    valor_min<-min(datos_temp[,1], na.rm= T)
    extremos<-c(valor_min,valor_max)
  }else{
    print("Error")
  }
}  

#no entiendo porque se traba

#c)Ordenar la serie de menor a mayor y calcular su mediana.
rm(list=ls())
datos_temp[,1]
datos_temp_ordenado<-datos_temp[order(datos_temp$Temp_media,)]
print(datos_temp_ordenado)

#no da y deberia dar
dim(datos_temp)
