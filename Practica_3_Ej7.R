getwd()
rm(list=ls())
setwd("C:/Users/Fernando Cabrera/Desktop/Cami_Labo/Practicas/")
#setwd("/home/clinux01/Escritorio/CamiLabo/Practicas/")
############Ejercicio 7###########

#Temp_media <-scan("datos_tmedia_SABE_2010.txt",sep="") #en casa no me corre esta pero en la facu si 
#datos_temp<-data.frame(Temp_media)
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
  valores_erroneos<-c(valores_erroneos,valores_antes,valores_desp)
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

for(valores in Temp_media){
  if(!is.na(valores)){
    valor_max<-max(datos_temp[,1], na.rm = T)
    valor_min<-min(datos_temp[,1], na.rm= T)
    extremos<-c(valor_min,valor_max)
  }else{
    print("Error")
  }
}  

#c)Ordenar la serie de menor a mayor y calcular su mediana.
rm(list=ls())
datos_temp[,1]
datos_temp_ordenado<-sort(Temp_media)
print(datos_temp_ordenado) 
#mediana 
datos_temp_ordenado_df<-data.frame(datos_temp_ordenado)
mediana_temp<-apply(datos_temp_ordenado_df,2,median) 
#aclaracion<- no se porque no saca los datos NA

#d)Generar una serie de medias semanales a partir de los datos medios diarios de un data frame de dimensiones [1,1]
x<-seq(1,365, by=7)
media_semanal<-c()
for (valor in x) {
  semana <- datos_temp[valor:(valor + 6), 1]
  media <- mean(semana, na.rm = TRUE)
  media_semanal <- c(media_semanal,media)
}

#e)Dividir el rango de la variable en N intervalos de igual longitud y calcular el numero de elementos
#de la serie que cae dentro de cada intervalo. Repetir el ejercicio utilizando la funcion intrınseca
#“hist”

#trabajo con los datos ordenados
datos_temp_ordenado_df[,1][datos_temp_ordenado_df[,1]==dato_faltante]<-NA
datos_temp_ordenado_df[,1][datos_temp_ordenado_df[,1]>40]<-NA

y<-seq(10,365,by=5)  #son 72 datos
intervalo<-c()
for (valor in y) {
  intervalo<- datos_temp_ordenado_df[valor:(valor + 4.96), 1]
  
  while(length(intervalo)<=5){
    espacio[valor]<-c(intervalo,espacio)
  }
}

rango<-(valor_max - valor_min )/5
#tengo que contar el largo de cada intervalo y ver los valores de temp que caen en cada intervalo



resultados <- numeric(0)
incremento <- 4.96

# Usar un bucle for para generar los valores
for (valor in seq(valor_min, valor_max, by = incremento)) {
  resultados <- c(resultados, valor)
}
attach(datos_temp_ordenado_df)
#variables 
primer_intervalo <- c()
segundo_intervalo<- c()
tercer_intervalo <- c()
cuarto_intervalo <- c()
quinto_intervalo <- c()

for (i in 1:(length(resultados) - 1)) {
  interval <- datos_temp_ordenado_df$datos_temp_ordenado >= resultados[i] & datos_temp_ordenado_df$datos_temp_ordenado < resultados[i + 1]
  
  if (i == 1) {
    primer_intervalo <- c(primer_intervalo, datos_temp_ordenado_df$datos_temp_ordenado[interval])
    print(paste("El",i,"intervalo tiene",length(primer_intervalo),"elementos"))
  } else if (i == 2) {
    segundo_intervalo <- c(segundo_intervalo, datos_temp_ordenado_df$datos_temp_ordenado[interval])
    print(paste("El",i,"intervalo tiene",length(segundo_intervalo),"elementos"))
  } else if (i == 3) {
    tercer_intervalo <- c(tercer_intervalo, datos_temp_ordenado_df$datos_temp_ordenado[interval])
    print(paste("El",i,"intervalo tiene",length(tercer_intervalo),"elementos"))
  } else if (i == 4) {
    cuarto_intervalo <- c(cuarto_intervalo, datos_temp_ordenado_df$datos_temp_ordenado[interval])
    print(paste("El",i,"intervalo tiene",length(cuarto_intervalo),"elementos"))
  } else {
    quinto_intervalo <- c(quinto_intervalo, datos_temp_ordenado_df$datos_temp_ordenado[interval])
    print(paste("El",i,"intervalo tiene",length(quinto_intervalo),"elementos"))
  }
}

histograma<-list(primer_intervalo,segundo_intervalo,tercer_intervalo,cuarto_intervalo,quinto_intervalo)
  
    
