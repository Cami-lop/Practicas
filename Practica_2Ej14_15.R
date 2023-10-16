###########EJ 14 P2###########
rm(list=ls())
getwd()
#Realizar un programa en el cual se ingresen N valores (N se ingresa por pantalla al iniciarse el
#programa) y calcular su media y su desviacion estandar.

valores<-c()
x<-0

while(length(valores)<16){
  x<-readline("Ingrese un valor numerico")
  if(is.na(x)){
    repeat{
      x<-readline("Ingrese un valor numerico") 
    }
  }
valores<-as.numeric(c(valores,x))
}

media<-mean(valores, na.rm=TRUE)
desvio<-sd(valores, na.rm=TRUE)


################Ejercicio 15#################
#Hacer un programa que pida el ingreso del nombre y apellido de un estudiante y la cantidad de materias que aprob´o. Luego debe pedir el ingreso del nombre de cada materia y la nota que obtuvo en
#cada caso. Finalmente, el programa debe imprimir el siguiente mensaje (Sin las comillas):
rm(list=ls())
getwd()

nombre<-readline("Ingrese su nombre")
apellido<-readline("Ingrese su apellido")
nombre_completo<-paste(nombre,apellido, sep=" ")
materias<-as.numeric(readline("Ingrese la cantidad de materias aprobadas (final aprobado)"))
promedio_hist<-8.41
notas<-c() 

while(length(notas)< materias){
  n<-readline("Ingrese cada nota de los examenes aprobados")
   while(is.na(n)){
     n<-readline("Ingrese nuevamente la nota del examen aprobado")
    }
  notas<-as.numeric(c(notas,n))
}
promedio<-mean(notas)

if(promedio<promedio_hist){
  cat("El alumno",nombre_completo,"aprobo",materias,"materias","y su promedio es menor al historico")
}else if (promedio==promedio_hist){
  cat("El alumno",nombre_completo,"aprobo",materias,"materias","y su promedio es igual al historico")
}else if (materias == 0){
  cat("El alumno",nombre_completo,"aun no aprobo materias")
} else{
  cat("El alumno",nombre_completo,"aprobo",materias,"materias","y su promedio es mayor al historico")
}

