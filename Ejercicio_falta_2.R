##############Ejercicio para entregar######################
#Consigna:armar una lista de listas (array de listas) que contenga los datos correspondientes a cada estacion
#como ası tambien informacion asociada a cada estacon en particular: nombre, latitud, longitud,
#altura y codigo de identificacion. Convertir los valores de temperatura y td
#a grados centıgrados. La informacion sobre la ubicaci´on de cada estaci´on esta disponible en el
#archivo estaciones.txt
rm(list=ls())
getwd()
#setwd("/home/clinux01/Escritorio/CamiLabo/Practicas/Datos Practica 3-20231003/")
setwd("C:/Users/DELL/Desktop/Cami/Datos Practica 3-20231008/")  #compu ezeiza
#falta agregar lat y lon / unir las listas
dato_faltante<- -999.9 #defini el dato faltante
#funciones para cambiar las unidades de las variables les T y Td
convertir_faren_centigrados <- function (Temperatura) {
  t <- (Temperatura - 32) * 5/9
  return(t)
}

#leo los datos y los asigno a una variable forzando a los datos a que sean una lista


resultados<-list()

dato_faltante<- -999.9

datos_estaciones<-read.table("estaciones.txt", header = FALSE)

for(i in 1:nrow(datos_estaciones)) {      
  
  nombre_aeropuerto<-datos_estaciones[i, 1]
  nombre_archivo <- paste0(nombre_aeropuerto,".txt")
  
  datos_aero<-read.table(nombre_archivo,header = TRUE)
  datos_aero[which(datos_aero==dato_faltante)]<-NA
  datos_aero[,3]<-convertir_faren_centigrados(datos_aero[,3])
  datos_aero[,4]<-convertir_faren_centigrados(datos_aero[,4])
  datos_aero[[1]]<-NULL
  #datos_estaciones$v5<-list()

  listaestaciones<-list(c(Nombre=nombre_aeropuerto,
                       Latitud=datos_estaciones[i,2],
                       Longitud=datos_estaciones[i,3],
                       Altura=datos_estaciones[i,4],
                       Datos=as.list(datos_aero ))
  

 resultados<-c(resultados, listaestaciones)
            
}


