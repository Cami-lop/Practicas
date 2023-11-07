#Ejercicio 1 #Recu 2018
getwd()
setwd("C:/Users/camil/OneDrive/Escritorio/Cami_Labo/Practicas")
A<-matrix(c(4,0,-4,1,2,3,8,5,-1,2,0,8) , ncol=3) #array de dos dimensiones 
B<- c(9,19,20) #array de una dimension

a<-matrix(data=c(rep(B[1],4),(rep(B[2],4)),rep(B[3],4)), ncol=4, nrow=3 , byrow=T)
b<-matrix(c(4,0,-4,1,2,3,8,5,-1,2,0,8) , ncol=2, byrow=TRUE)

#el c es raro
#el d lo que hace es poner N en las posiciones en las que C es igual a 8

#Ejercicio 2
pp<-c(rnorm(3784320,mean=0.7, sd=0.5))
lat<-seq(-90,90,2.5)
lon<-seq(0,359,2.5)
precip<-array(data=pp, dim=c(length(lon),length(lat),360))
#media mensual de todo el globo en el periodo de 1982-2011 #son 30 años

#calcular media anual <- un dato por año para la cuenca del plata 
#(38.75S-23.75S) (296.25E-308.75E)#hacerlo sin ciclos 

#busco las lat y lon respetivas a la cuenca del plata 
lat_plata<-which(lat %in% -37.5:-25.0) #cambie las dimensiones para aproximarlas
lon_plata<-which(lon %in% 295:307.5)

precip<-array(data=pp, dim=c(length(lon),length(lat),12,30)) #144 lon/filas // 74 lat/colum //12 meses // 30 años
pp_plata<-precip[lon_plata,lat_plata,,] #quiero todos los tiempos en esas longitudes
pp_media<-apply(pp_plata,c(4),mean) #un valor por año para toda la region 
#si dejo cte lat y lon voy a tener para cada punto un valor 

#Ejercicio 3
A<-matrix(c(25,2,3,1), ncol=2)
B<-c(TRUE,TRUE)
C<-3

(A==C)   #matriz de ncol=2 F,F//T,F
A[2,B]=C #asigna a la fila dos el valor de C
A<C      #F,F,F,F matriz con eso valores que se llena por columna teniendo en cuenta lo anterior
is.numeric(B) #FALSE
A*C      #cada componente de A por C// devuelve una matriz

#Ejercicio 4
vec<-c(12,15,48,16,13,14,15,14,15)
vec_funcion<-function(vector){
  media<-mean(vector)
  desvio<-sd(vector)
  percentiles<-quantile(vector)
  
  estadistica<-list("Media"=media,
                    "Desvio"=desvio,
                    "Cuartiles"=percentiles)
  return(estadistica)
}
vec_funcion(vec)

#Ejercicio 5
nombre<-readline("Ingrese su nombre")
edad<-as.numeric(readline("Ingrese su edad en numeros"))
                          
repeat{
if(is.na(edad) | edad<=0) {
  edad<-as.numeric(readline("Ingrese su edad en numeros"))
}else{
  break
}
}

 if (edad>=18 | edad<=65){
  print("Su edad corresponde a la de un trabajador activo")
}else{
  print("Su edad indica que no es trabajador activo")
}

#Ejercicio 6-Explicacion del codigo linea por linea
A<-matrix(c(1,25,NA,8,NA,20,5,40,1,6,NA,3), ncol=4) #cre una matriz de 4 columnas y tres filas qu ese llena por columnas 
B<-sum(is.na(A)) #suma la cantidad de NA que hay en A

#Ejercicio 8
V<-c(2,1,3,4,0,-1,1,-2,0,1)
D<-mean(V) #media de V, escalar 
E<-sd(V) #desvio de V
g<-V>=(D+E) #vector logico de longitud igual a la de V que almacena si la comparativa es T o F
C<-mean(V[g]) #la media de los valores de V que cumplen la condicion anterior (TRUE)

#Ejercicio 9
a<-as.numeric(readline("Ingrese un valor para a ")) #ingreso por consola un valor 
x<-as.numeric(a) #lo hace numerico para poder hacer operacione matematicas 

i<-1 #incia un contador 

while(abs(x-(x-((x*2-a)/(2*x)))) > 10e-4){ # Plantea un ciclo que solo entra si se cumple esa #condicion y termina cuandol se deje de cumplir 
  x<- x-((x*2-a)/(2*x)) #guarda en x esta operacion matematica 
  i<-i+1 #hace que el contador aumente en cada vuelta 
  if(i>10000){ #si el contar es mator a 10000 imprimi un cartel
    print("El metedo no converge")
  }else{ #de lo contrario imprime otro cartel por cada vuelta que de en el ciclo
    print(paste("La raiz cuadrada de a es ",x,"."))
  }
}



