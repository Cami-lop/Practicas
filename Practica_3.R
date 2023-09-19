rm(list=ls())
getwd()
#setwd("C:/Users/Fernando Cabrera/Desktop/Cami_Labo/Practicas/")
setwd("/home/clinux01/Escritorio/CamiLabo/Practicas/") 
#Practica 3
#Ejercicio 1
#a
x<-1:1000
vector<-c()

for(numero in x){
  vector<-c(vector,numero)
}
print(vector)
#b
p_array<-array(data=c(1:600),dim=c(30,20))
p_array
#c- generar una matriz del punto anteriror pero como producto de dos matrices
matrizA<-matrix(1:25,5,5)  
matrizB<-matrix(1:20,4,5)

matrizC<-matrizA%%matrizB #COMO MULTIPLICO MATICIALMENTE



#Ejercicio 2
a <-c( 4 , -10, 7 , -2, 8 , -6, 1 , -15, 3 , -9)
i <-3
j <-5
b <-c( 1 , 5 , 7 )
c <-c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE)

a[ ]   #elementos de a 
a[i, j]
a[seq(i, i, 2)] #de a la posicion que cumple i=3
a[seq(i, j, 3)] #supongo que lo mismo 
a[i:length(a)]  #arranco en la posicion i=3 en adelante
a[c(1, 5, 7)]   #vector con la posicion 1,5 y 7 del vector a 
a[b]            #lo mismo que el anterior
a[c]            #me da los numeros que estan en la misma posicion que el TRUE en el vector c
a[a == -4]      #0 pq nunca se cumple

#Ejercicio 2 b
mi_matriz<-matrix(1:25,5,5)

mi_matriz[3, 2] #fila 3, coluna 2  
mi_matriz[3,]   #todo fila 3
mi_matriz[, 2]  #todo columna 2
mi_matriz[seq(1, 5, 2),] #la matriz compuesta por a secuencia que arranca en 1 y va sumando de a dos hasta completar todos los espacio
mi_matriz[,seq(2, 5, 2)] #matriz que contiene 5 filas y la columna 2 y 4 de mi matriz
mi_matriz[seq(1, 5, 2), seq(1, 5, 2)] #matriz 3x3 que contiene coluna 1, 3 y 5 pero va sumando de a dos
mi_matriz[10]   #posicion 10
mi_matriz[b]    #no lo entiendo


#Ejercicio 3
#a
rm(lis=ls())
A<-matrix(1:4,2,2)
A
B<-matrix(5:8,2,2)
B
c<-A%*%B
c
#b
rm(list=ls())
´a<-c()
while(length(a)<9){
  if(length(a)>=9){
    break
  } else{
    dat<-as.numeric(readline("Ingrese un numero"))
    a<-c(a,dat)
  }
}
matriz<-matrix(data=a,3,3)
matriz












