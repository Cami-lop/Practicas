##############Ejercicio para entregar######################
#Consigna:armar una lista de listas (array de listas) que contenga los datos correspondientes a cada estacion
#como ası tambien informacion asociada a cada estacon en particular: nombre, latitud, longitud,
#altura y codigo de identificacion. Convertir los valores de temperatura y td
#a grados centıgrados. La informacion sobre la ubicaci´on de cada estaci´on esta disponible en el
#archivo estaciones.txt
rm(list=ls())
getwd()
setwd("C:/Users/Fernando Cabrera/Desktop/Cami_Labo/Practica_3/Datos Practica 3-20231003/")

#funcion para cambiar las unidades de las variables les T y Td
convertir_faren_centigrados <- function (Temperatura) {
  t <- (Temperatura - 32) * 5/9
  return(t)
}

resultados<-list()

dato_faltante<- -999.9  #defini el dato faltante

datos_estaciones<-read.table("estaciones.txt", header = FALSE) #lee los datos del txt

#ciclo que recorre los datos de estaciones, lee los archivos correspondientes a cada estacion y arma una lista de lista

for(i in 1:nrow(datos_estaciones)){      
  
  nombre_aeropuerto<-datos_estaciones[i, 1]
  nombre_archivo <- paste0(nombre_aeropuerto,".txt")
  
  datos_aero<-read.table(nombre_archivo,header = FALSE)
  datos_aero[which(datos_aero==dato_faltante)]<-NA
  datos_aero[[1]]<-NULL
  colnames(datos_aero)[1]<-"Fecha"
  colnames(datos_aero)[2]<-"Temperatura"
  colnames(datos_aero)[3]<-"Td"
  colnames(datos_aero)[4]<-"Presion"
  datos_aero[,2]<-(convertir_faren_centigrados(datos_aero[,2]))
  datos_aero[,3]<-convertir_faren_centigrados(datos_aero[,3])
  

  listaestaciones<-list(c(Nombre=nombre_aeropuerto,
                       Latitud=datos_estaciones[i,2],
                       Longitud=datos_estaciones[i,3],
                       Altura=datos_estaciones[i,4],
                       Codigo=datos_estaciones[i,5],
                       as.list(datos_aero)))
  
 resultados<-c(resultados, listaestaciones)
 }
names(resultados)<-c("Azul","Aeroparque","Catamarca","Chilecito","Iguazu","Mendoza")
#ACLARACION<- modifique el txt de estaciones y agregue el codigo de verificacion


#Parte 2 
#ej 1) A partir del array, generar un resumen por pantalla con el nombre de las estaciones y la
#cantidad de datos presentes en cada una, los estadısticos basicos de cada serie 
#(media, desvio estandar, valor maximo y mınimo), la fecha inicial del perıodo abarcado y la fecha final.

Resumen_datos <- function(lista_estaciones) {
  
  for (estacion in lista_estaciones) {
    nombre_estacion <- estacion[[1]]
    t_media <- mean(estacion[[7]])
    t_desvio_estandar <- sd(estacion[[7]])
    t_max <- max(estacion[[7]])
    t_min <- min(estacion[[7]])
    td_media <- mean(estacion[[8]])
    td_desvio_estandar <- sd(estacion[[8]])
    td_max <- max(estacion[[8]])
    td_min <- min(estacion[[8]])
    fecha_inicial <- min(estacion[[6]])
    fecha_final <- max(estacion[[6]])
    
    cat("Estación:", nombre_estacion,"\n" )
    cat("Cantidad de datos:", length(estacion[[7]]),"\n")
    cat("Media T:", t_media ,"\n")
    cat("Desvío Estándar T:", t_desvio_estandar ,"\n")
    cat("Valor Máximo T:", t_max,"\n" )
    cat("Valor Mínimo T:", t_min,"\n")
    cat("Media Td:", td_media ,"\n")
    cat("Desvío Estándar Td:", td_desvio_estandar ,"\n")
    cat("Valor Máximo Td:", td_max,"\n" )
    cat("Valor Mínimo Td:", td_min,"\n")
    cat("Fecha Inicial:", fecha_inicial,"\n")
    cat("Fecha Final:", fecha_final,"\n\n")
    
  }
}
     
Resumen_datos()
#Parte 2 ej 2
#una funcion que permita obtener todas las estaciones que estan dentro de una
#determinada region definida por una latitud maxima, una latitud mınima, una 
#longitud maxima y una longitud mınima. En el caso que no haya, devuelva el
#mensaje ”No hay estaciones cercanas”
estaciones_cercanas <- function(estaciones, lat_max, lat_min, lon_max, lon_min) {
  estaciones_cercas <- list()
  
  for (estacion in estaciones) {
    latitud <- estacion$Latitud  
    longitud <- estacion$Longitud  
    if (latitud <= lat_max && latitud >= lat_min && longitud <= lon_max && longitud >= lon_min) {
      estaciones_cercas<- append(estaciones_cercas, list(estacion))
    }
   }
  
if (length(estaciones_cercas) > 0) {
    return(estaciones_cercas)
  } else{
    return("No hay estaciones cercanas")
  }
}

estaciones_cercanas()


#Parte 2 ej 3
guardar_rdata<- function (x) {
  save(x, file = "DatosEstaciones.RData") 
}
guardar_rdata(resultados,)


resultados$Azul$Latitud

