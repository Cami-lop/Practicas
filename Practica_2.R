rm(list=ls())
getwd()
setwd("/home/clinux01/Escritorio/CamiLabo/Practica_ejercicios/")


####Ejercicio 5
x<-as.numeric(readline("Ingrese un numero positivo"))
a<-as.integer(x)

  repeat{if (x!=a){
  x<-as.numeric(readline("Error, ingrese numero entero"))
  a<-as.integer(x)
}else if (x==a){
  print("A ES UN  NUMERO ENTERO")
  break
}
  }
x1<-as.numeric(readline("Ingrese un numero positivo"))
b<-as.integer(x1)
 repeat{if(x1!=b){
   x1<-as.numeric(readline("Error,ingrese un numero entero"))
   b<-as.integer(x1)
 }else if(x1==b){   
 print("B ES UN NUMERO ENTERO")
   break
 }
 }   
div<-(a/b)
entero<-as.integer(a/b)
 if(div!=entero){
   print("A Y B NO SON MULTIPLOS")
 }else if (div== entero){
   print("A Y B NO SON MULTIPLOS")
 }
 
