###########Ejercicio 10##########
rm(list=ls())
getwd()
setwd("C:/Users/Fernando Cabrera/Desktop/Cami_Labo/Practicas")
#Generar una celda con 10 elementos, donde cada elemento sea un nombre propio. Armar una funci´on
#que permita ingresar una lista con nombres (de cualquier dimensi´on) y una letra, y que devuelva una
#lista que contenga todos los nombres contenidos en la celda original que comiencen con dicha letra.

nombres<-c("Camila","Eliana","Maite","Candelaria","Ezequiel","Esteban","Matias","Emanuel")

funcion<-function(nombres,letra){
  nombres_letra<-list() #(1)
  j<-1 #(2)
  for (i in 1:length(nombres)){ #(3)
    if ((substr(nombres[i],1,1)) == (letra)){ #(4)
      nombres_letra[[j]]<-nombres[i]
      j=j+1
    }
  }
  if (length(nombres_letra)==0){ #(5)
    warning("La letra ingresada no tiene nombres asignados de la lista")
  }
  return(nombres_letra) #(6)
}
#(1) Se crea primero una lista que es la que me pide el enunciado
#(2) Se inicia el contador
#(3) Me muevo desde 1 hasta el numero que represente la longitud del vector
#(4) #Si la primer letra de cada nombre (tolower(substr(nombres[i],1,1)) es identicamente 
#igual a la letra ingresada por el usuario (letra), entonces abre un 
#vector donde se van almacenando esos nombres
#(5) Si ese vector queda vacio porque no hay nombres asociados, entonces devuelve
#un warning
#(6) Almaceno el resultado

##########Ejercicio 12#############
rm(list=ls())
archivo<-"C:/Users/Fernando Cabrera/Desktop/Cami_Labo/Practicas/Datos Practica 3-20231011/presiondesaturacion.txt"
datos_presion<-read.table(archivo, header=TRUE)
class(datos_presion) #data.frame
colnames(datos_presion)<-c("Temperatura","Presion de vapor")

p_vapor<-function(datos,t){ #(1)
  if(t < min(datos[1]) | t > (max(datos[1]))) { #(2)
    warning("La temperatura ingresada esta fuera del rango")
  }else{
    j=1
    while(t>datos[[1]][j]){ #recorre j
      j=j+1
    }
    t1<-datos[[1]][j-1] #Se queda con 1er columna, el dato anterior a j
    t2<-datos[[1]][j]   #Se queda con 1er columna, el dato j
    p1<-datos[[2]][j-1] #Se queda con 2da columna, el dato anterior a j
    p2<-datos[[2]][j]   #Se queda con 2da columna, el dato j
    p<-p1+(t-t1)*(p2-p1)/(t2-t1) #Calculo de regresion
    return(p)
  }
}
p_vapor(datos_presion,24)  
p_vapor(datos_presion,450)
