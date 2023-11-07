#Practica integradora 3 
#setwd("")
load("./datos.Rdata")
#Ejercicio 1
#Miremos que dimensiones tiene el array
dimensiones<-dim(datos_PP)

#Veamos cual es el valor maximo
max(datos_PP)

#Ploteamos un histograma para ver como es la variable
hist(datos_PP,breaks=500,main="Histograma de frecuencias", xlab="Precipitacion [mm]",ylab="Frecuencia")

#Cuantos valores tengo arriba de un determinado umbral
length(which(datos_PP >= 1))/(prod(dim(datos_PP))) #1 mm
length(which(datos_PP >= 5))/(prod(dim(datos_PP))) #5 mm
length(which(datos_PP >= 10))/(prod(dim(datos_PP))) #10 mm
length(which(datos_PP >= 25))/(prod(dim(datos_PP))) #25 mm
length(which(datos_PP >= 100))/(prod(dim(datos_PP))) #100 mm
length(which(datos_PP >= 250))/(prod(dim(datos_PP))) #250 mm

#Ejercicio 2

estadistica<-function(array){
  media<-mean(array , na.rm=T)
  desvio<-sd(array,   na.rm=T)
  maximo<-max(array,  na.rm=T)
  
  datos_lista<-list("Media"=media,
                    "Desvio"=desvio,
                    "Maximo"=maximo)
  return(datos_lista)
}

#Ejercicio 3
#Especificamos el tamanio de las regiones (5x5)
tamanio <- 5

#Calculamos el numero de regiones en cada dimension
num_regiones_lons <- dim(datos_PP)[2] / tamanio
num_regiones_lats <- dim(datos_PP)[1] / tamanio

#Generamos las matrices para guardar los datos
medias <- array(NA, dim = c(num_regiones_lons,num_regiones_lats))
desvios <- array(NA, dim = c(num_regiones_lons,num_regiones_lats))
maximos <- array(NA, dim = c(num_regiones_lons,num_regiones_lats))

#Ciclos para recorrer las matrices
f <- 1 #Inicializo el contador para las filas
for (i in seq(1, dim(datos_PP)[1], by = 5) ) {
  c <- 1 #Inicializo y reseteo el contador de las columnas 
  for (j in seq(1, dim(datos_PP)[2], by = 5) ) {
    #Selecciono la region de 5x5 en la matriz
    region <- datos_PP[ i : (i + 4) , j : (j + 4) ,]
    
    #Calculo la media, desvio y maximos de la region para almacenarlo en la matriz de promedios
    estadisticos <- estadistica(region)
    medias[f, c] <- estadisticos$media
    desvios[f, c] <- estadisticos$desvio
    maximos[f, c] <- estadisticos$maximo
    
    c <- c + 1 #Avanzo una posicion en las columnas 
  }
  f <- f + 1 #Avanzo una posicion en las filas
}
