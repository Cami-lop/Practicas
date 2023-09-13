
getwd()
setwd("C:/Users/Fernando Cabrera/Desktop/Cami_Labo")


#EJEMPLO 4 CLASE INTEGRADORA
frase<-(readline(" ingrese una frase: "))
vocal<-readline("ingrese una vocal: ")
letras<-strsplit(frase,"")[[1]] #separa por letra  y me devuelve un vector con las letras depende de como separe
letras

print(letras[[1]]) #[[]] posicion
print(letras[[2]])


cantidad_letras<-0
for (letra in letras){
  if(vocal==letra){
    cantidad_letras<-cantidad_letras+1
}
} 
print(cantidad_letras)

#EJEMPLO 1
cantidad<-10
contador<-0
while{contador<cantidad}
frase<-(readline(" ingrese una frase: "))
contador<-contador+1
}

#EJEMPLO 2
x <- 1:20
frase<-c()

for( numeross in x ) {
  palabra<-readline("Ingrse una palabra")
  frase<-c(frase,palabra)
  if(palabra=="basta"){
    break
  }
}
print(frase )

#EJEMPLO 3


valor<-20

valor2<-23
valor3<-38




if(valor==3){
  print("vale 3")
}else if (valor==4){
  print("vale 4")
}else if (valor==5){
  print("vale 5")
}else{print("vale otra cosa")
}


#EJEMPLO 4
frase<-"hola cami"
print(paste(substr(frase,1,8),sep=" "))


print(nchar(frase))
cantidad<-c(1:nchar(frase))
for (indice in cantidad){
  print(paste0(substr(frase,1,indice)))
}


#EJEMPLO 5
pedido<-as.numeric(readline("Cuantos numeros va a ingresar: "))

valores<-c()
for(elemento in c(1:pedido)){
  numero<-as.numeric(readline("ingrese un numero"))
  valores<-c(valores,numero)
}
print(mean(valores))

#####EJERCICIO 8#####
numeros<-1:10
valores<-c()
for (elemento in numeros){
  valores<-c(valores,elemento**2)
}
print(valores)


numeros<-1:1000
valores<-c()
for (elemento in numeros){
  valores<-c(valores,elemento**2)
}
print(valores)











