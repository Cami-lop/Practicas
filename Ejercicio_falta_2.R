##############Ejercicio para entregar######################
#Consigna:armar una lista de listas (array de listas) que contenga los datos correspondientes a cada estacion
#como ası tambien informacion asociada a cada estacon en particular: nombre, latitud, longitud,
#altura y codigo de identificacion. Convertir los valores de temperatura y td
#a grados centıgrados. La informacion sobre la ubicaci´on de cada estaci´on esta disponible en el
#archivo estaciones.txt
rm(list=ls())
getwd()
#setwd("/home/clinux01/Escritorio/CamiLabo/Practicas/Datos Practica 3-20231003/") compu facu
setwd("C:/Users/Fernando Cabrera/Desktop/Cami_Labo/Practicas/Datos Practica 3-20231003/")

#funcion para cambiar las unidades de las variables les T y Td
convertir_faren_centigrados <- function (Temperatura) {
  t <- (Temperatura - 32) * 5/9
  return(t)
}

resultados<-list()

dato_faltante<- -999.9  #defini el dato faltante

datos_estaciones<-read.table("estaciones.txt", header = FALSE)

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

#ACLARACION<- modifique el txt de estaciones y agregue el codigo de verificacion, se que no se hace asi  y no esta bien pero no sabia como agregarlo 
