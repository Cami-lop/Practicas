#Practica integradora 1 y 2
#Ejercicio 1
contraseña<-"homero624"
contra<-readline("Ingrese la contraseña")

repeat{
  if(contraseña!=contra){
    contra<-readline("Ingrese nuevamente la contraseña")
  }else{
    print("Ha entrado al sistema")
  }
}

#Ejercicio 2

while(TRUE){
  entrada<-readline (" Introduce algo ( escribe ’salir ’ para finalizar ): ")
  
  if (entrada == "salir"){
    print("Logro salir de sistema")
  }else {
    cat("ECO:",entrada, "/n")
  }
}

#Ejercicio 3 
#cuando le pide que ingrese un numero no lo hace numerico entonces no corre despues de eso

#Ejercicio 4
frase<-readline("Ingrese una frase")
l<-readline("Ingrese una letra")
frase_separada<-strsplit(frase,"")[[1]]

cantidad<-0

for(letra in frase_separada){
  if(l==letra){
    cantidad<-cantidad+1
    print(paste("La letra",letra, "se encontro en la frase", cantidad, "veces")) #si lo pongo ahi se imprime la misma cantidad de veces que l==letra
  }
}
print(cantidad)
#Ejercicio 5
numero<-as.numeric(readline("Ingrese un numero"))

par<-numero%%2 #falla porque hay num no primos que se dividen por 5 
par_2<-numero%%5

if(par==0 | par_2==0){
  print("El numero no es primo")
}else {
  print("El numero es primo")
}


#Ejercicio 6 

n<-as.integer(readline("Ingrese un numero entero"))

# Verificar si el n m e r o es positivo
if ( n <= 0) {
  cat("Por favor , introduce un n m e r o entero positivo .")
} else {
  # Generar el t r i n g u l o r e c t n g u l o
  for ( i in seq (1 ,n ,2) ) {
    for ( j in seq (i ,1 , -2) ) {
      cat(j ," ")
    }
    cat ("\n")
  }
}
  