#Parcial 2017
getwd()
setwd("C:/Users/camil/OneDrive/Escritorio/Cami_Labo/Practicas/")
#Ejercicio 1 
meteo<-function(Temp,Td) {
  if(Td>=Temp){
    aire<-"TRUE"
  }else{
    aire<-"FALSE"
  }
  return(aire)
}
#no calcula la presion de vapor porque no se cual es la formula

#Ejercicio 2
rm(list=ls()) #borra el enviromente
A<-c(5,12.1,7.2,8.2,3.5,2,5.8,10.4,1.7,6,5.3,0.5) #crea un vector llamado A
B<-mean(A)# <-B es el promedio de A por ende, es un escalar
C<-vector(mode="numeric", length=0)  #C es un vector numeric de longitud 0
D<-sd(A) #D es el escalar que representa el desvio estandar de A
d<-sum(abs(A)>(B+C))
#primero hace que los valores de A sean absolutos, suma B+C y hace una comparacion que tiene como resultado sumar todos los valores que cumple que a A es mayor que B+C
e<-A[which(abs(A)>(B+C))] #el which da las posiciones que cumple que A (valores absolutos) es mayor que B+C, pero al estar entre [] arroja como resultado los valores de A en esa posicion
print(paste("La suma de los valores que cumplen que abs(A)>(B+C) es  ",d,sep=" "))
print(paste("Los valores de A en las posiciones que se cumple que abs(A)>(B+C)",e,sep=" "))

#Ejercicio 3
C<-matrix(c(3,1,0,2,5,1,2,2,3,4,1,2),ncol = 3,nrow = 4)
a<-which(C>=2) #1,4,5,7,8,9,10,12
b<-apply(C,2,mean) #le aplica la media a las columnas 
c<-C(a) #C en las posiciones que cumple which(C>=2) (que seria a ) // 3,2,5,2,2,3,4,2
d<-apply(C,1,min) #Busco el minimoo de C en cada fila  
e<-rep(C[,2],2) #se repite la columna dos dos veces 

repeat {
  X<-as.numeric(readline( "Ingrese un numero real"))
  if (!is.na(as.numeric(X))){ #esta mal deberia pedir que si is.na sea falso se corte/si no al ingresar NA se corta
    break } } 
raiz<-sqrt(X)
if (is.na(raiz)) {
  print(paste("La raiz no pertenece a los reales",raiz, sep=" ")) #le agregue el raiz y sep porque sino, se imprime todo junto 
} else { print(paste("La raiz cuadrada del numero es",raiz, sep=" "))
}

#Ejercicio 5 
A<-c(10,3,-2,0)
g<-5 
D<-c(F,T,T,T) 

A <= g #F,T,T,T
(!A = g)|D #ERROR ??
#T,F,F,F | F,T,T,T <- F,F,F,F
A[D] #3,-2,0 A en los posiciones TRUE 
is.logical(D) #TRUE
is.logical(g) #FALSE

#Ejercicio 6
a<- c(1, 3, 7, 9, 6, 3, 5, 6)
b<- c(2, 3, 1, 2, 2, 3, 5, 7)
c<- NULL
jj<- 0

for (ii in 1:length(a)){ #ii recorre los numero de 1:largo de a 
  if( a[ii] > b[ii] & b[ii] < 5){ #no dice condicion si & ! |
    #si a en la posiicon ii es mayor que b en la posicion ii (y / o ) b en la posicion ii es menor a 5
    jj <- jj+1 #jj +1 lo que hace es avanzar en laposicion 
    c[jj] <- a[ii]-b[jj] }  #guarda en c en cada posicion jj la resta de a -b
 }          
  
#lo arregle como pude pero esta raro 
#Ejercicio 7
f <- 5
g<- 2 
w<- seq(10,2,by=-2)
!(f == g) #TRUE
(f > 2) | !(g <= 3) #TRUE // en el unico momento que da False es cuando ninguna condicion se cumple 
w == g #F,F,F,F,T
w > f  #T,T,T,F,F


#Ejercicio 8 
repeat{
edad<-as.numeric(readline("Ingrese su edad ")) 
  if(!is.na(edad)){
    break
  }
}
par<-edad%%2
  
if(par==0){
    print("su edad es par")
 }else {
    print("su edad es impar")
}

#Ejercicio 9 
nombres<-c("Bs As", "Salta","Rosario","Cordoba","Viedma")
u<-c(10,2,7,6,13)
v<-c(-3,-8,-12,0,4)
estaciones<-matrix(data=c(nombres,u,v), ncol=3)
datos_df<-data.frame(estaciones)
colnames(datos_df)<-c("Nombres","U","V")

velocidad<-c()
#arreglo de tipo lista ?? o es un arreglo o es una lista
for(i in 1:length(nombres)){
  modulo<-sqrt(u[i]**2+v[i]**2)
  velocidad<-c(velocidad, modulo )
                       
} 
velocidad<-round(velocidad, 2)
data<-matrix(data=NA, nrow=5 , ncol = 2)
for(i in 1:length(estaciones)){
    data[i,1]<-nombres[i]
    data[i,2]<-velocidad[[i]]
}
#Hablarlo con Gasti

#Ejercicio 10
A<-matrix(c(3,1,0,2,5,1,2,2,3),ncol=3) 
b<-c(1,2,2)
cbind(A,b) # se pega como columna el vector b
b*A[,1] #multiplica la primer columna de A con el vecto b
rbind(A[1,],b) #pega  la primer fila de A  con el vector b 
A==rep(b,3) #repite b tres veces y luego compara si es igual o no a A
#F,F,F,F,F,F,F,T,F // me devuelve una matriz con esos valores logicos 
which(b==A[2,3]) #arroja las posiciones de b que cumplen que b == a la fila dos columna tres 


#Ejercicio 11
A<-matrix(c(1,1,0,-2,-1,0,0,1,1),ncol=3,nrow=3) 
b<-c(2,3,5)

A[which(A<=0)]<-NA
e<-c(T,F,T,F,T,F,F,F,F)
A[e]
C<-cbind(A[,1],b,A[,3])
#me falto el ultimo

#Ejercicio 12
nombres<-c("Paula","Alejandra","Cande","Sergio","Daniel")
edad<-c(40,50,22,51,69)
vec<-c(TRUE,TRUE,TRUE,FALSE,FALSE)


for(i in 1:length(nombres)){
  if(edad[i]>=65){
    if(vec[i]==TRUE){
      print(paste(nombres[i], "esta jubilada", sep=" "))
    }else {
      print(paste(nombres[i], "esta jubilado", sep=" "))
    }
}else{
   if(vec[i]==TRUE){
     print(paste(nombres[i], "no esta jubilada", sep=" "))
   }else{
     print(paste(nombres[i], "no esta jubilado", sep=" "))
      }
 }
}  
#Ejercicio 13
A<-matrix(c(0,-1,5,6,9,-5,10.5,3,1),nrow=3)
mA<-min(min(A)) #minimo del minimo de A?
tmp<-which(A==mA) #las posciones/la posiciones¿ en las que se cumple que A es igual al minimo de A
a<-arrayInd(tmp,c(3,3)) #una matriz de 3 filas y 3 columnas con los datos del la locacion en la matriz del minimo de A(fila 3 columna 2 )

#Ejercicio 14
D<-c("BsAs Salta Jujuy Neuquen Chaco") 
E<-c("2","1","15","7") 
paste(substr(D,6,9),E[1]) #Salt 2 me lo da separado
D==E[3] #FALSE
as.numeric(E[2])/as.numeric(E[1]) #1/2
sub("Chaco", E[3],D) #de D me da todo menos Chaco y E en la posicion 3

#Ejercio 15
M<-matrix(c(-1,2,0,3,-2,1),ncol=2)
N<-matrix(c(1,0,0,1,1,1),ncol=2) 
b<-1

A<-M<b #T,F,T,F,T,F EN MATRIZ 
B<-M[!A] #2 3 1
C<-is.logical(A) #TRUE
D<-is.logical(B) #FALSE 
E<-xor(A,N) 
#Esto comparará cada elemento de la matriz lógica A con el elemento correspondiente de la matriz N. 
#Si ambos son VERDADERO,  el resultado será FALSO, de lo contrario, será VERDADERO
#TRUE ES 1 
#FALSE ES 0