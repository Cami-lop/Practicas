##############Ejercicio para entregar######################
#Consigna:armar una lista de listas (array de listas) que contenga los datos correspondientes a cada estacion
#como ası tambien informacion asociada a cada estacon en particular: nombre, latitud, longitud,
#altura y codigo de identificacion. Convertir los valores de temperatura y temperatura de roc´ıo
#a grados centıgrados. La informacion sobre la ubicaci´on de cada estaci´on esta disponible en el
#archivo estaciones.txt
rm(list=ls())
getwd()
setwd("/home/clinux01/Escritorio/CamiLabo/Practicas/Datos Practica 3-20231003/")
#leo los datos y los asigno a una variable forzando a los datos a que sean una lista
#falta agregar lat y lon / unir las listas
datos_aerolist<-as.list(read.table("AEROPARQUE.txt",header = TRUE))
datos_aerolist<-list(Codigo=datos_aerolist$X875820,Fecha=datos_aerolist$X20000101,Temperatura=datos_aerolist$X75.9,Td=datos_aerolist$X57.7,Presion=datos_aerolist$X1014.9 )


datos_catalist<-as.list(read.table("CATAMARCA.txt",header = TRUE))
datos_catalist<-list(Codigo=datos_catalist$X875820,Fecha=datos_catalist$X20000101,Temperatura=datos_catalist$X75.9,Td=datos_catalist$X57.7,Presion=datos_catalist$X1014.9 )

datos_iguazulist<-as.list(read.table("IGUAZU.txt",header = TRUE))
datos_iguazulist<-list(Codigo=datos_iguazulist$X875820,Fecha=datos_iguazulist$X20000101,Temperatura=datos_iguazulist$X75.9,Td=datos_iguazulist$X57.7,Presion=datos_iguazulist$X1014.9 )

datos_chilelist<-as.list(read.table("CHILECITO.txt",header = TRUE))
datos_chilelist<-list(Codigo=datos_chilelist$X875820,Fecha=datos_chilelist$X20000101,Temperatura=datos_chilelist$X75.9,Td=datos_chilelist$X57.7,Presion=datos_chilelist$X1014.9 )

datos_mendozalist<-as.list(read.table("MENDOZA.txt",header = TRUE))
datos_mendozalist<-list(Codigo=datos_mendozalist$X875820,Fecha=datos_mendozalist$X20000101,Temperatura=datos_mendozalist$X75.9,Td=datos_mendozalist$X57.7,Presion=datos_mendozalist$X1014.9 )

datos_azullist<-as.list(read.table("AZUL.txt",header = TRUE))
datos_azullist<-list(Codigo=datos_azullist$X875820,Fecha=datos_azullist$X20000101,Temperatura=datos_azullist$X75.9,Td=datos_azullist$X57.7,Presion=datos_azullist$X1014.9 )



