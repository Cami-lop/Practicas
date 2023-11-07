#Ejercicio 1
D<-c("BsAs Salta Jujuy Neuquen Chaco")
E<-C("2","1","15","7")

paste(substr(D,6,9),E[1]) #Salt 2
D==E[3] #False valor logico
as.numeric(E[2])/as.numeric(E[1]) #1/2 es un escalar 
sub("Chaco",E[3],D) #BsAs Salta Jujuy Neuquen 15
                            
#Ejercicio 2                            
a<-as.numeric(readline(" Ingrese un valor {a} ")) #pide por consola el ingreso de un valor para a
x<-as.numeric(a) #lo convierte en numerico para poderhacer operaciones mate

i<-1 #iniciael contador
while(abs(x-(x-((x*2-a)/2*x))) > 10e-4){  #a no es numerico, no se puede hacer la cuenta
  x<- x-((x*2-a)/(2*x)) #idem, a no es numerico
  i<-i+1 #avanza el contador
  if( i>10000){
    print("El metodo no converge")
  }else{
    print(paste("La raiz cuadrada de (a), es,", x ))
  }
}
#la exponencial esta rara, yo pondria e*-4
#x*2 para hacer el cuadrado tiene que ser ** 
#es importante que x se redefina en cada ciclo porque sino, la condicion se cumple siempre


#Ejercicio 3
A<-matrix(c(4,0,4,1,2,3,8,5,-1,2,0,8), ncol=3)
B<-c(9,19,29)

a<-matrix(rep(B,c(4,4,4)), ncol=4 , nrow=3, byrow=T)
b<-matrix(c(4,0,4,1,2,3,8,5,-1,2,0,8), ncol=2 , byrow=T)
            
A[2:4,1]<-B #de la fila 2:4 va B
A[c==8]<-NA

#Ejercicio 4
nombres<-c("Cande","Camila","Maite","Eli")
edad<-c(22,21,22,23) #decia año de nacimiento
nacionalidad<-c(F,T,T,F)

for(persona in 1:length(nombres)){
  anios<-edad[persona]<18
  if(anios==TRUE){
    if(nacionalidad[persona]==T){
      print(paste(nombres[persona],"No puede votar por ser menor de edad "))
    }else {
      print(paste(nombres[persona],"No puede votar por ser menor de edad y no ser Argentina"))
    }
  }else{
    if(nacionalidad[persona]==T){
      print(paste(nombres[persona]," puede votar por ser mayor de edad y Argentina/o"))
    }else {
      print(paste(nombres[persona],"No puede votar por  no ser Argentina"))
    }
  }
}

#Ejercicio 5 
#a) La lista puede tener distintas longitudes de cada elemento
#el df puede tener distintos tipos pero de igual longitud

LE<-c("Aeroparque","Macachin", "MDQ")
altura<-c(6,231,8)
T<-c(rnorm(36,mean=20, sd=5))
ciclo_anual<-matrix(data=c(T) ,nrow=3 , ncol=12, byrow=T) 
rownames(ciclo_anual)<-c("Aeroparque","Macachin", "MDQ")
colnames(ciclo_anual)<-c("Enero","Feb","Mar","Abril","Mayo","j","jul","agos","sep","oct","nov","diciembre")

A1<-diff(range(ciclo_anual[1,]))
A2<-diff(range(ciclo_anual[2,]))
A3<-diff(range(ciclo_anual[3,]))

ciclo_anual_df<-data.frame("Estaciones"=LE,
                         "Altura"=altura,
                         "Amplitud"=c(A1,A2,A3),
                         "mean"=c(rowMeans(ciclo_anual)),
                         "Desvio"=c(sd(ciclo_anual[1,]),sd(ciclo_anual[2,]),sd(ciclo_anual[3,])))


#Ejercicio 6
numero<-readline("Ingrese un numero")
funcion_cuadratica<-function(numero) {
  if(is.na(numero)){
    numero<-as.numeric(readline("Ingrese un numero"))
  }
  F<-2*(numero**2)-0.9*numero-1
  return(F)
}


#Ejercicio 7
#serie temporal de febrero para cordoba, un dato de febrero por año 1981-2020 (40 años)
pp<-c(rnorm(123895200,mean=0.7,sd=0.2))

datos<-361*715*480

lat<-seq(-90,90,0.5) 
lon<-seq(0,357,0.5)  
tiempo<-480 #40 anios*12 meses

pp_datos<-array(pp, dim=c(length(lon),361,480)) 

#Sacamos las lat y lon de cordoba
lat_cordoba<-which(lat == -31.5)
lon_cordoba<-which(lon == 64)

#serie temporal para el mes de febrero
pp_datos<-array(pp, dim=c(715,361,12,40)) #redifinimos nuestro array para separa años de meses

anios<-1:40 #40 años 
media_febrero<-c() #donde se guardan los datos 
for(anio in anios){
  febrero_cordoba<-pp_datos[lon_cordoba,lat_cordoba,2,anio]
  media_febrero<-c(media_febrero,febrero_cordoba)
}
