getwd()
setwd("C:/Users/camil/OneDrive/Escritorio/Cami_Labo/Practicas/")
#Parcial 2019
#Ejercicio 1
X<-c("camila","cande","eze","eli","maite","ema","mati","esti","gasti","homero")
Y<-c(8,8,9,8,8,9,9,10,7,6)

alumnos <- function(notas, nombres) {
  orden <- order(notas, decreasing = TRUE)
  nombres_ordenados <- nombres[orden]
  notas_ordenadas <- notas[orden]
  
  df <- data.frame("nombres" = nombres_ordenados, "notas" = notas_ordenadas)
  return(df)
}

resultado <- alumnos(Y, X)
print(resultado)
#falta eliminar los que se repiten, 
#Ejercicio 2 

temp<-array(data=(rnorm(3650,mean=15, sd=5)),dim=c(3650,181,360))
lat<-seq(-90,90,1)
long<-seq(0,359,1)
dim(temp)
#Sudamérica (15N-60S, 275E-320E), quiero temp media anual y la anomalia para cada año en ese #periodo
#Tenga en cuenta que el arreglo puede contenter datos faltantes y estos están codicados con el #código -999.
temp[which(temp==-999)]<-NA #selecciono las posiciones de temp que sean igual a -999 y les pongo NA

#seleccione las coordenadas de america del sur
lat_sud<-which(lat %in% -15:-60)
lon_sud<-which(long %in% 275:320)
nanios<-3650/10
sud<-array(data=temp[,lat_sud,lon_sud],dim=c(365,10,45,45))

prom_anual<-apply(sud,c(2,3,4), mean)
#anomalia??

#Ejercicio 3
rm(list=ls())
#matrices por default se llena x columna 
a<-matrix(data=c(1:6),nrow=2, ncol=3)
b<-matrix(data=c(1:8),nrow=2, ncol=4)
funcion_matricial<-function(a,b) {
  if(ncol(a)==nrow(b)){
    C<-a%*%b
  }else if(ncol(a)==ncol(b)){
    C<-rbind(a,b) #para hacer rbin deben coincidir num de columnas
  }else if(nrow(a)==nrow(b)){
    C<-cbind(a,b) #para hacer cbin dbene coincidir num de filas
  } else{
    print("ERROR, dim no compatibles ")
  }
  return(C)
}
funcion_matricial(a,b)
#Ejercicio 4
rm=list(ls())  #esta mal, es rm(list=ls()) si el objetivo es borrar el enviroment
m=readline("Ingrese el nombre de una estacion  meteorologica: " )
#H=as.numeric(readline(" Ingrese la altura(en m)de la estacion:"))

repeat{
  H=as.numeric(readline(" Ingrese la altura(en m)de la estacion:"))
    if (H<0){
      print ( " el numero ingresado no es valido. Vuelva a intentarlo")
    } else if(H>=0){
      break
    }
  }
  #faltaria agregara un if(is.na(H))
  if (H>=0 & H<200){
    print( paste(" la estacion" ,m, " es cercana al nivel del mar", sep=" " ))
    
  } else if(H>=200 & H<=1000){
    print(paste( " la estacion ",m, "se encuentra en terremo elevado" , sep=" " ))
    
  } else if (H>1000 & H<=4000){
    print(paste (" la estacion " ,m, " se encuentra en una cadena montaniosa " , sep=" " ))
    
  } else if (H>4000){
    print(paste( " la estacion" ,m, " es de dificil acceso " , sep=" " ) )
 }
#cambia las cosas de lugar, el else if h<0 abajo no tenia sentido
#no tenia sentido que todo este dentro del repeat 
#Ejercicio 6
A<-c(TRUE, TRUE, FALSE, TRUE)
B = 4
C<- c(2,5,4,1) 
D = 3
!(B==D)
C<D
C[D]
C[A]
A | !(C>B) #no lo entiendo

#Ejercicio 7 
A<-matrix(c(2,-1,4,0,3,0,1,0,2,1,2,3),ncol=3)

A==2 # <- T,F,F,F,F,F,F,F,T,F,T,F
d<- A[(A<=0)] #<- -1,0,0,0
which(A==3) # me da  las posiciones en las que se cumple que A==3
rowMeans(A)   #me da el promedio por fila que son 4 
array(A[A>0], c(2, 4)) #una matriz de dim 2 filas y 4 columnas con los valores de A que cumple que  son mayores a 0

