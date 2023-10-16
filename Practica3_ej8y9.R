################ Ejercicio 8#############
rm(list=ls())
getwd()

#crear una funcion a la cual se le entrega la longitud y devuelva datos basicos estadisticos
#no tiene sentido porque  calcularia un promedio de longitudes espaciales
Estadistica<-function(longitudes){
  for(elemento in names(datos_temp_ordenado)){
    if(elemento ==  longitudes){
      media<-mean(datos_temp_ordenado$datos_temp_ordnado, na.rm=TRUE)
      desvio<-sd(datos_temp_ordenado$datos_temp_ordenado, na.rm = TRUE)
      max<-max(datos_temp_ordenado$datos_temp_ordenado, na.rm = TRUE)
      min<-min(datos_temp_ordenado$datos_temp_ordenado, na.rm = TRUE)
      return(list("media" = media, "desvio" = desvio, "maximo" = max,"min"=min))}
    else{
      print("Error")
    }
  }
}
#longitud de datos
Estadistica<-function(x){
      media<-mean(datos_temp_ordenado$datos_temp_ordnado, na.rm=TRUE)
      desvio<-sd(datos_temp_ordenado$datos_temp_ordenado, na.rm = TRUE)
      max<-max(datos_temp_ordenado$datos_temp_ordenado, na.rm = TRUE)
      min<-min(datos_temp_ordenado$datos_temp_ordenado, na.rm = TRUE)
      return(list("media" = media, "desvio" = desvio, "maximo" = max,"min"=min))

    }
#Ejercicio 9
setwd("C:/Users/Fernando Cabrera/Desktop/Cami_Labo/Practicas/Datos Practica 3-20231011/")
load("t_media_EF.RData")
class(estaciones)
dim(estaciones) #5 filas y 3 columnas
rownames(estaciones)<-c("Estacion Buenos Aires","Estacion Viedma" ,"Estacion Rosario","Estacion San Luis", "Estacion Resistencia")
colnames(estaciones)<-c("Estacion","Tmedia_enero","Tmedia_febrero")
estaciones_df<-data.frame(estaciones)
attach(estaciones_df)



for(variable in names(estaciones_df)){
  if(variable=="Tmedia_enero"){
    for(i in 1:nrow(estaciones_df)){
  maximo<-as.numeric(max(estaciones_df[[i,2]]))
  anio<-which(estaciones_df[[i,2]]== maximo)
    if(i==1){
       print(paste("El maximo fue de",maximo,"ºC en el año", anio,"en",estaciones[i]))
     }else if (i==2){
       print(paste("El maximo fue de",maximo,"ºC en el año", anio,"en",estaciones[i]))
     }else if (i==3){
       print(paste("El maximo fue de",maximo,"ºC en el año", anio,"en",estaciones[i]))
     }else if (i==4){
       print(paste("El maximo fue de",maximo,"ºC en el año", anio,"en",estaciones[i]))
     }else{
       print(paste("El maximo fue de",maximo,"ºC en el año", anio ,"en",estaciones[i]))
     }
   }
  }  
}
attach(estaciones_df)
# Para cada estaci´on: Calcular la media y el desvıo estandard para el mes de febrero. Imprimir
#luego un cartel que se˜nale para cada estacion en qe a˜nos la temperatura estuvo por encima de
#la media mas un desvıo standar.

datos_estadisticos<-list()
for(variable in names(estaciones_df)){
  if(variable=="Tmedia_febrero"){
    for(i in 1:nrow(estaciones_df)){
      media<-mean(estaciones_df[[i,2]], na.rm=TRUE)
      desvio<-sd(estaciones_df[[i,2]], na.rm = TRUE)
      max<-max(estaciones_df[[i,2]], na.rm = TRUE)
      min<-min(estaciones_df[[i,2]], na.rm = TRUE)
      estadisticos<-list(
      "estacion" = estaciones_df[[1]][[i]],
      "media" = media,
      "desvio" = desvio,
      "maximo" = max,
      "minimo" = min
      )
   datos_estadisticos<-c(datos_estadisticos,list(estadisticos))
   
     }
  }
}
#preguntar si lo puedo hacer adentro del mismo for lo de nombre cada variable de la lista

names(datos_estadisticos)<-c("Buenos Aires","Viedma","Rosario","San Luis","Resistencia")
posiciones<-which(estaciones_df$Tmedia_febrero$`Estacion Buenos Aires`>datos_estadisticos$`Buenos Aires`$media)


anio<-0
for(i in 1:nrow(estaciones_df)){
  posiciones<-which(estaciones_df[[3]][[i]]>datos_estadisticos[[i]][[2]])
  anio<-1981+posiciones
  print(paste("En la estacion",estaciones_df[[1]][[i]],"en los anios",anio,"la temperatura supero la media"))
}


#c) Escribir una funcion que, dado un vector de longitud N con los datos de temperatura calcule
#el rango de la serie y la mediana. Utilizar dicha funcion en los datos de enero y guardar los
#resultados en una nueva matriz que lleve como nombre en cada columna el de cada una de las
#estaciones.

estadistica_2<-function(x){
  rango<-c()
  resultados<-matrix(nrow = nrow(x), ncol = 3)
  for (i in 1:nrow(x)){
    if(variable=="Tmedia_enero"){
      valor_max<-max(x[[2]][[i]], na.rm=TRUE)
      valor_min<-min(x[[2]][[i]], na.rm=TRUE)
      diferencia<-(valor_max-valor_min)/2
      rango<-c(rango,diferencia)
      mediana<-median(x[[2]][[i]], na.rm=TRUE)
      
      resultados[i,]<-c(x[[1]][[i]],rango[i],mediana) # se lo asigno a una fila especifica
    
      } 
    }
    return(resultados) 
  }

##corregido, siempre el if iba a dar falso por ende le preguntas si hay una variable que se llama asi y ahi entra 
estadistica_2 <- function(x){
  rango <- c()
  resultados <- matrix(nrow = nrow(x), ncol = 3)
  for (i in 1:nrow(x)){
    if ("Tmedia_enero" %in% names(x)) { # el operador %in% me dice si existe esa variable en x 
      valor_max <- max(x[[2]][[i]], na.rm = TRUE)
      valor_min <- min(x[[2]][[i]], na.rm = TRUE)
      diferencia <- (valor_max - valor_min) / 2
      rango <- c(rango, diferencia)
      mediana <- median(x[[2]][[i]], na.rm = TRUE)
      
      resultados[i,] <- c(x[[1]][[i]], rango[i], mediana)
      rownames(resultados)<-c("Estacion 1","Estacion 2","Estacion 3","Estacion 4","Estacion 5")
      colnames(resultados)<-c("Estaciones","Rango","Mediana")
    }
  }
  return(resultados) 
}








