#PRACTICA 3

setwd("C:/Users/HP/Desktop/LABO")

#EJERCICIO 1##########################################################
 
#a
#Generar un vector que contenga los nros del 1 al 1000. Generarlo utilizando
#un ciclo for

rm(list = ls())

#Forma abreviada 

vector1<-c(1:1000)

#Con el FOR: Necesito un vector con NA (vacio) para poder ir llenandolo con el ciclo
#Luego en cada posicion del vector se transforma con la repeticion.
#Al final se muestra el resultado con print.

vector2<-rep(NA,1000)
for (i in 1:1000){
  vector2[i]<-i
}
print(vector2)

#b
#Generar un array de dos dimensiones que tenga 20 columnas y 30 filas. Cada 
#componente debe tener el resultado de i*j

#La idea va a ser armar un doble ciclo con FOR para que vaya recorriendo tanto
#las filas como las columnas para hacer i*j
#con i=1 voy a tener 1*1=1, 1*2=2, etc
#con i=2 voy a tener 2*1=2, 2*2=4,2*3=6, etc
#con i=30 voy a tener 30*1=30, 30*2=60,30*3=90, etc

rm(list = ls())
x<-matrix(1:600,nrow=30,ncol=20) #Tiene 600 lugares, 30 filas, 20 columnas
for(i in 1:30){
  for(j in 1:20){
    x[i,j]=i*j
  }
}
print(x) #Sale lo que yo esperaba

#c
#Generar la misma matriz pero como producto punto a punto de dos matrices

rm(list=ls())
i<-1:30 #Filas
j<-1:20 #Columnas
m1<-matrix(i, nrow=30, ncol=20) #Hago que se llene por columnas
m2<-matrix(j, nrow=30, ncol=20, byrow=TRUE) #Hago que se llene por filas
m3<-m1*m2
print(m3) #Veo el resultado
resultado<-m3==x #Es m3 igual a la matriz x anterior? #SI, en todas las posiciones

#d
#Guardar la quinta columna del array mencionado en el punto anterior en un vector B

B<-c(m3[,5]) #Selecciona la 5ta columna con todas las filas
B

#e
#Generar un array de 3 dimensiones. El valor de cada componente debe ser igual a
#i*j*k .
#Generar un array de dos dimensiones que contenga la componente k=4 del array de 
#3 dimensiones (Tamaño 20,30,10)

rm(list = ls())
a<-array(NA,dim=c(20,30,10))
for (i in 1:20){
  for (j in 1:30){
    for (k in 1:10){
      a[i,j,k]=i*j*k
    }
  }
}
print(a)

#EJERCICIO 2##########################################################

#a)

rm(list = ls())
a<-c(4,-10,7,-2,8,-6,1,-15,3,-9)
i<-3
j<-5
b<-c(1,5,7)
c<-c(TRUE,TRUE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE)

a[]                 #Me muestra todo lo que tiene a
a[i,j]              #Numero incorrecto de dimensiones, a es un vector
a[seq(i,i,2)]       #
a[seq(i,j,3)]       #
a[i:length(a)]      #
a[c(1,5,7)]         #Me muestra los valores de las posiciones 1,5,7
a[b]                #Es igual a la sentencia anterior
a[c]                #Me muestra los valores de las posiciones donde hay TRUE en c
a[a==-4]            #Me devuelve si a=-4

#b)

rm(list=ls())
mi_matriz<-matrix(1:25,nrow=5,ncol=5,byrow=TRUE) #Creo la matriz de la guia

mi_matriz[3,2]                    #valor de 3er fila, 2da columna
mi_matriz[3,]                     #los valores de la 3er fila y todas las columnas
mi_matriz[,2]                     #los valores de la 2da columna y todas las filas
mi_matriz[seq(1,5,2),]            #de la fila 1 a la 5 de 2 en 2, con todas las columnas
mi_matriz[,seq(1,5,2)]            #de la columna 1 a la 5 de 2 en 2, con todas las filas
mi_matriz[seq(1,5,2),seq(1,5,2)]  #1ra fila 1er columna, 3er fila 3er columna, 5ta fila 5ta columna
mi_matriz[10]                     #10mo valor (contando por columnas)
mi_matriz[b]                      #1er valor, 5to valor, 7mo valor

#EJERCICIO 3##########################################################

#a) Escribir un programa para calcular el producto matricial entre dos matrices
#A y B. Verificar los resultados utilizando la funcion “%*%” para el producto 
#de arrays en R.


rm(list=ls())
A<-matrix(1:4,2,2) #Creo una matriz A
B<-matrix(5:8,2,2) #Creo una matriz B
M<-matrix(NA,nrow(A),ncol(B)) #Creo una matriz donde guardar los datos

#Uso los indices A[i,j] y B[k,l], M se va a ir llenando como M[i,l]
#Fijo la fila de A y la columna de B, me muevo en esa fila de A y 
#esa columna de B sumando

for(i in 1:nrow(A)){    #Recorro filas de A
  for(l in 1:ncol(B)){  #Recorro columnas de B
    M[i,l]=sum(A[i,1:ncol(A)]*B[1:nrow(B),l])
  }
}
print(M)

print(A%*%B) #Hago de la otra forma que me piden

M==A%*%B     #Es TRUE en todas sus posiciones


#b) Realizar un programa que calcule el producto componente a componente entre
#dos matrices A y B. Verificar los resultados utilizando la funcion “*” para
#el producto componente a componente de arrays en R.

rm(list=ls())
A<-matrix(1:10,2,5)              #Creo una matriz A
B<-matrix(11:20,2,5)             #Creo una matriz B
AxB<-matrix(0,nrow(A),ncol(A))   #MATRIZ VACIA
for(i in 1:nrow(A)){             #Quiero que recorra filas de A, col de B
  for(j in 1:ncol(A)){           #Y que el resultado lo multiplique
    AxB[i,j]=A[i,j]*B[i,j]
  }
}

print(AxB)
print(A*B)
AxB==A*B                        #Es TRUE en todas sus posiciones

#c) Aplicar los programas anteriores al producto entre matrices de mas de 100
#filas/columnas y comparar los tiempos involucrados. Comparar la eficicienca 
#de las funciones de R con la de los programas realizados.

rm(list=ls())

#Armo las matrices que necesito

A<-matrix(1:10000,100,100)
B<-matrix(1:10000,100,100)
M<-matrix(NA,nrow(A),ncol(B))

#Para la primer cuenta (a)

for(i in 1:nrow(A)){
  for(l in 1:ncol(B)){
    M[i,l]=sum(A[i,1:ncol(A)]*B[1:nrow(B),l])
  }
}

print(M)
print(A%*%B)

#Para la segunda cuenta (b)

for(i in 1:nrow(A)){
  for(j in 1:ncol(A)){
    AxB[i,j]=A[i,j]*B[i,j]
  }
}
print(AxB)
print(A*B)

#Como comparo la eficencia?

#d) Agregar a los programas mencionados en los puntos a) y b) un chequeo que 
#determine antes de realizar los calculos si las dimensiones de los arrays 
#son compatibles para los calculos que se quieren llevar a cabo y que en caso
#de que las dimensiones no sean compatibles, muestre un mensaje por pantalla y 
#que termine el programa.

#e) Al programa del ejercicio anterior agregar una seccion que identifique las 
#componentes negativas del producto de ambas matrices y las convierta en cero.

#d y e juntos

#Para la primer cuenta (a)

rm(list=ls())

A<-matrix(1:4,2,2)
B<-matrix(5:8,2,2)

which(B<0) ; which (A<0)
{replace (A,A<0,0)} #Reemplazo
{replace (B,B<0,0)} #Reemplazo
M=matrix(NA,nrow(A),ncol(B))

if(ncol(A)==nrow(B)){
  for(i in 1:nrow(A)){
    for(l in 1:ncol(B)){
      M[i,l]=sum(A[i,1:ncol(A)]*B[1:nrow(B),l])
    }
  }
}else{print("Las dimensiones no son compatibles")}

print(M)
print(A%*%B)

#Para la segunda cuenta (b)

rm(list=ls())

A<-matrix(1:10,2,5)
B<-matrix(11:20,2,5)

which(B<0) ; which (A<0)
{replace (A,A<0,0)}
{replace (B,B<0,0)}
AxB=matrix(0,nrow(A),ncol(A))
if(dim(A)==dim(B)){
  for(i in 1:nrow(A)){
    for(j in 1:ncol(A)){
      AxB[i,j]=A[i,j]*B[i,j]
    }
  }
}else{print("Las dimensiones no son compatibles ")}

print(AxB)
print(A*B)


#EJERCICIO 4##########################################################

#a) Desarrollar y programar un algoritmo que resuelva el siguiente sistema de
#ecuaciones lineales:A ∗ X = B donde A es una matriz de 2x2 y B es un vector.
#Probar el algoritmo.

rm(list = ls())
a<-matrix(NA,2,2) #Matrix vacía de 2x2
b<-matrix(NA,2,1) #Matrix vacía de 2x1 (vector)
#Le digo al usuario que llene la primer matriz
for(i in 1:4){
  a[i] <- as.numeric(readline("Ingrese los valores de A, se completa por columna: "))
}
#Le digo al usuario que llene el vector
for(j in 1:2){
  b[j] <- as.numeric(readline("Ingrese los valores de B: "))
}

#Idea

#(a,b) * (x1) = (e)
#(c,d)   (x2)   (f)

#x1) =inversa de(a b)*(e)
#(x2)           (c d) (f)

#Matriz con valores de la inversa,2filas,2columnas 

inversa <- (1/det(a))*matrix(c(a[4],-a[2],-a[3],a[1]),2,2) 

#Hago la multiplicacion de matrices

x <- inversa%*%b

#El vector final es (x1,x2) el resultado

print(x)

#b) Resolver el punto a) utilizando la funcion intrınseca “solve”.

print(solve(a,b)) #Da lo mismo 

#EJERCICIO 5##########################################################

#a) Se tienen datos de temperatura tomados cada 3 horas en una estacion de 
#superficie comenzando a las 00 y terminando a las 21 
#(serie <-c( 25, 20, 18, 22, 27, 31, 32, 28)). 

#Armar un script de R que permita 
#ingresar la serie de datos por pantalla, la guarde en un vector y muestre por
#pantalla la hora en la que ocurrio el maximo valor medido y el valor de la 
#temperatura maxima medida.

T<-proc.time() #para ver el tiempo del punto b
rm(list = ls())
t<-matrix(NA,1,8) #Armo vector vacío de 8 valores NA, 1 fila,8 columna
for(i in 1:8){    #Con un for lleno los espacios NA. 
  t[i] <- as.numeric(readline("Ingrese los valores de temperatura: "))
  if(i==1){       #Si t es 1, entonces ese valor es maximo
    max=t[i]
  }else if (t[i]>max){ #Si la dim de t>1, busca el máximo
    max=t[i]
  }
}
proc.time()-T
hora<-which(t==max) #Veo en que posicion se cumplió el maximo
#Armo el print con el horario
print(paste("El valor maximo de temperatura fue de:",max,"°C y ocurrio a las",(hora*3)-3,"hs."))

#b) Repetir el inciso anterior utilizando la funcion intrınseca “max”. 
#Comparar los tiempos involucrados con los del inciso anterior.

T<-proc.time()      #Para ver el tiempo del punto b
t2<-matrix(NA,1,8)  #Armo vector vacío de 8 valores NA, 1 fila,8 columna
for(i in 1:8){      #Con un for lleno los espacios NA. 
  t2[i]=as.numeric(readline("Ingrese los valores de temperatura:"))
}
m<-max(t2)           #Me quedo con el valor máximo
proc.time()-T        #Para ver el tiempo del punto b
hora2<-which(t2==m)
print(paste("La temperatura maxima fue de",m,"a las",(hora2*3)-3,"horas."))

#Es mas rapido este codigo que el anterior

#c) Calcular la suma de todos los elementos de la serie de temperaturas y 
#comparar los resultados utilizando la funcion intrınseca “sum”.
#Idem con el promedio de las temperaturas (verificar utilizando la funcion
#intrınseca “mean”).

##SUMA 

#Con un for a mano

rm(list=ls())
t = matrix(NA,1,8) #Vector vacío como antes
suma <- 0          #Arranco una variable en cero
for(i in 1:8){     #Armo un for que vaya sumando las componentes
  t[i]=as.numeric(readline("Ingrese los valores de temperatura: "))
  suma <- suma+t[i] #En cada iteracion i suma el elemento siguiente a lo que ya habia acumulado
}
print(suma)

#Con la funcion sum

print(sum(t)) #Sumo directamente los valores que se ingresaron y almacenaron en t

##PROMEDIO

#Con un for a mano

t = matrix(NA,1,8) #Vector vacío como antes
suma <- 0          #Arranco una variable en cero
for(i in 1:8){     #Armo un for que vaya sumando las componentes
  t[i]=as.numeric(readline("Ingrese los valores de temperatura: "))
  suma <- suma+t[i] #En cada iteracion i suma el elemento siguiente a lo que ya habia acumulado
}
prom<-suma/8       #Divido la suma por la cantidad de valores
print(prom)

#Con la funcion mean

print(mean(t)) #Promedio directamente los valores que se ingresaron y almacenaron en t

#d) Extender el programa anterior, para que permita mostrar la suma pero 
#solamente de las temperaturas que estan por encima de 20◦C. (Resolver este 
#inciso probando dos maneras, una utilizando arrays logicos y otra utilizando
#la funcion intrınseca “which”).

t<-matrix(NA,1,8)            #Matriz de elementos vacíos
for(i in 1:8){               #Con un for lleno los espacios NA. 
  t[i]=as.numeric(readline("Ingrese los valores de temperatura: "))
}
mayores<-t[which(t>20)]      #Los which son las posiciones, t[] los valores
print(sum(mayores))          #Sumo todos los valores de t>20

#EJERCICIO 6##########################################################

#A partir del archivo “temp bsas.Rdata” con datos de temperatura mensual para 
#diferentes niveles durante el perıodo 2000-2005 sobre la provincia de Buenos
#Aires. (Cargar el archivo utilizando la funcion “load()”)

#Limpio enviroment y cargo los datos

setwd("C:/Users/HP/Desktop/LABO/Datos para ejercicios")
rm(list=ls())
datos<-load("temp_bsas.Rdata")

#Viene dado en formato longitud, latitud, presion (altura) y tiempo (72 meses
#que vienen dados de a 30 dias dias)

#a) Obtener el promedio mensual de temperatura en el perıodo analizado para cada
#nivel y cada punto de retıcula. Hagalo por un lado utilizando ciclos y por
#otro reacomodando el arreglo utilizando la funcion “apply()”.

##Con apply

#De "variable" me quedo con longitud, latitud, presion, y transformo el tiempo:
#12 meses en 6 años

temp_mensual<-array(variable,c(8,14,4,12,6))       #Armo el array para aplicar el apply
media_mensual<-apply(temp_mensual,c(1,2,3,4),mean) #Dejo fijo todo menos los años
media_mensual 

##Con ciclos

temp_mensual<-array(variable,c(8,14,4,12,6))       #Armo el array para aplicar el apply
prom_mensual<-array(NA,c(8,14,4,12))
for(i in 1:8){
  for(j in 1:14){
    for(l in 1:4){
      for(k in 1:12){
        prom_mensual[i,j,l,k]<-mean(temp_mensual[i,j,l,k,]) #Aplico la media
      }
    }
  }
}

#Si chequeo me da igual para todas las posiciones con ambos programas

prom_mensual==media_mensual

#b) Obtener la temperatura media anual en el perıodo analizado para cada nivel
#y cada punto de retıcula.

##Con ciclos

temp_anual <- array(variable,c(8,14,4,12,6)) #Ahora me pide anual
prom_anual <- array(NA,c(8,14,4,6)) #No dejo los meses
for(i in 1:8){
  for(j in 1:14){
    for(l in 1:4){
      for(k in 1:6){
        prom_anual[i,j,l,k]<-mean(temp_anual[i,j,l,,k]) #Dame todos los meses
      }
    }
  }
}

##Con apply

temp_anual<-array(variable,c(8,14,4,12,6))     #Armo el array para aplicar el apply
media_anual<-apply(temp_anual,c(1,2,3,5),mean) #Dejo fijo todo menos los meses y aplico mean
media_anual

#Si chequeo me da igual para todas las posiciones con ambos programas
prom_anual==media_anual

#c) Utilizando la indexacion logica seleccione el nivel de 850hPa e imprima 
#por pantalla el promedio de temperatura sobre el dominio para cada anio.

prom_anual[,,2,]

#d) Utilizando la indexacion logica seleccione el punto de retıcula mas 
#cercano a la localidad de Olavarrıa y obtenga la temperatura promedio para 
#cada anio en el nivel de 1000hPa.

#Coordenadas de Olavarria de internet:
#Longitud: Oeste 60°19'
#Latitud: Sur 36°53'

#Pido por pantalla las latitudes y longitudes para ver a que corresponde

datos_dimensiones$longitude
datos_dimensiones$latitude

#Para la latitud el valor mas cercano es el 7 y para la longitud es el 6 (360-60.2)

Longitud_Ol<- -60.2+360 #elemento 6 de longitud.
Latitud_Ol<- -36.9      #elemento 7 de latitud

#Creo un matriz llena de NA
matriz <- matrix(NA, nrow=8, ncol=14)

for (i in 1:8) {
  for (j in 1:14) {
    matriz[i,j] = sqrt((datos_dimensiones$latitude[j]-Latitud_Ol)^2 +
                         (datos_dimensiones$longitude[i]-Longitud_Ol)^2) #Ecuacion distancia dada por la práctica
  }
}

which(matriz==min(matriz), arr.ind = TRUE)

prom.anual[6,7,1,]

#EJERCICIO 7##########################################################

#El archivo “datos tmedia SABE 2010.txt” contiene la serie de temperaturas 
#medias diarias de la estacion Aeroparque correspondiente al 2010.
#Utilizando el comando “scan” cargar los datos en una variable de R.
#Por ejemplo: TEMP <− scan( ’ d a t o s tmedia SABE 2 0 1 0. t x t ’ , sep=” ” )

setwd("C:/Users/HP/Desktop/LABO/Datos para ejercicios")
rm(list=ls())
temperatura<-scan("datos_tmedia_SABE_2010.txt")
temperatura

#Me devuelve 365 datos datos diarios

#a) Dado que se trata de temperaturas medias diarias para la Ciudad de Buenos
#Aires, valores superiores a 40C son, muy probablemente, erroneos de acuerdo 
#con el comportamiento climatogico de esta variable.

#Diseniar y programar un algoritmo que identifique la posicion dentro 
#de la serie de los dıas donde el valor de la temperatura media supera
#los 40C, pero que ademas muestreel valor del dıa anterior y del dıa siguiente.

#Obtener la cantidad total de elementos erroneos.

#Armo un ciclo que recorra la cantidad de datos del archivo cargado. Si el valor
#es mayor a 40 grados entonces entra al FOR, el cual va a imprimir por pantalla
#el valor redondeado de ese día, el del siguiente y el anterior.

for (i in 1:365){
  if (temperatura[i]>40){
    print(paste("En el dia",i,"hay una T media de",temperatura[i],"°C"))
    print(paste("En el dia anterior a",i,"hay una T media de",(temperatura[i-1]),"°C"))
    print(paste("En el dia siguiente a",i,"hay una T media de",(temperatura[i+1]),"°C"))
  }
}

#Luego la cantidad de elementos erroneos seran

print(paste("Cantidad de datos erroneos:", length(which(temperatura>40))))

#b) Calcular el valor maximo y el mınimo de la serie teniendo en cuenta los
#puntos erroneos y sin tenerlos en cuenta. 

#Calcular la cantidad total de datos faltantes. Remover los elementos faltantes 
#y los erroneos de la serie de temperatura.

#Si tengo en cuenta los datos erroneos puedo aplicar a todo los datos completos
#la funcion max y min. Luego muestro el resultado

maximo<-max(temperatura)
minimo<-min(temperatura)

#Printeo redondeando el valor
print(paste("El valor maximo de temperatura corresponde a:",maximo,digits = 1,
            "°C el valor minimo corresponde a:",minimo,"°C"))


#Si no tengo en cuenta los datos erroneos, tengo que cambiar los faltantes y
#los mayores a 40

temperatura2<-replace(temperatura,temperatura==-999,NA) #Reemplazo aquellos que son =999 con NA
temperatura2<-replace(temperatura2,temperatura>40,NA) #Reemplazo aquellos que son >40 con NA
maximo2<-max(temperatura2,na.rm=T) #Aca saco el max diciendo que son TRUE los NA
minimo2<-min(temperatura2,na.rm=T) #Aca saco el min diciendo que son TRUE los NA

#Printeo redondeando el valor
print(paste("El valor maximo de temperatura corresponde a:",maximo2,
            "°C el valor minimo corresponde a:",minimo2,"°C"))

#Ahora me devuelve valores mas coherentes

#c) Ordenar la serie de menor a mayor y calcular su mediana.

#Ordeno con la funcion sort
temperatura3<-sort(temperatura2)

#Utilizo la funcion mediana de R
mediana3<-print(median(temperatura3))

#d) Generar una serie de medias semanales a partir de los datos medios diarios.

#Genero una matriz con los datos de temperatura2,para luego usar apply.
#Esta matriz tiene 7 filas (cada dia de la semana), y se necesita que haya 365 datos.
#Pero van a sobrar porque 365:7 no es entero. El mas proximo es 7x53=371

temperatura4<-matrix(temperatura2,7,53)

#Lleno de NA los lugares que sobran 371-365=6

for(i in 366:length(temperatura4)){ #Me muevo desde 366 hasta el final
  temperatura4[i]<-NA
}

#Aplico la media a la matriz, dejando fijo la dimension 2 y tomando validos los NA
media<-print(apply(temperatura4,2,mean,na.rm=T))

#Devuelve el valor medio para las 53 semanas

#e) Dividir el rango de la variable en N intervalos de igual longitud y calcular
#el numero de elementos de la serie que cae dentro de cada intervalo. Repetir 
#el ejercicio utilizando la funcion intrınseca “hist”.

#Primero veo el rango que contiene todos los datos usando la función range()
#en var3 (vector sin datos erróneos (+40) o faltantes (-999))

range(temperatura3,na.rm = TRUE) #Uso temperatura 3 que son los que estan ordenados

#El rango va de 5,4 a 30,28, elijo el rango de 5 a 35 y los divido de a 5
#Propongo los contadores y el ciclo con FOR que guarda los intervalos (i)
#uso i_n de intervalos e i el contador inicial

i=0
i1=0
i2=0
i3=0
i4=0
i5=0
i6=0

for(i in 1:length(temperatura3)){
  if (temperatura3[i]>=5 & temperatura3[i]<10){
    i1=i1+1
  }else if (temperatura3[i]>=10 & temperatura3[i]<15){
    i2=i2+1
  }else if (temperatura3[i]>=15 & temperatura3[i]<20){
    i3=i3+1
  }else if (temperatura3[i]>=20 & temperatura3[i]<25){
    i4=i4+1
  }else if (temperatura3[i]>=25 & temperatura3[i]<30){
    i5=i5+1
  }else if (temperatura3[i]>=30 & temperatura3[i]<35){
    i6=i6+1
  }
}
{print(paste0("Cantidad de valores entre 5°C y 10°C: ",i1))
  print(paste0("Cantidad de valores entre 10°C y 15°C: ",i2))
  print(paste0("Cantidad de valores entre 15°C y 20°C: ",i3))
  print(paste0("Cantidad de valores entre 20°C y 25°C: ",i4))
  print(paste0("Cantidad de valores entre 25°C y 30°C: ",i5))
  print(paste0("Cantidad de valores entre 30°C y 35°C: ",i6))
  print(paste0("Valores totales: ",i1+i2+i3+i4+i5+i6))
}

#Uso la funcion intrinseca hist genera un histograma, y grafica.

hist(temperatura3,main="Temperatura media",xlab="Temperatura",plot=T)

#Puedo observar que arma mas cantidad de intervalos que los propuestos

#EJERCICIO 8##########################################################

#a) En base al programa anterior, desarrollar una funcion que reciba una serie
#de longitud N y entregue como resultado su media, valor maximo, valor mınimo 
#y desviacion estandar. Evaluar el desempeno de esta funcion con la serie 
#utilizada en el ejercicio anterior.

rm(list=ls())

#Se arma la función que calcula todos los datos

funcion_resumen <- function(serie) {
  media<-mean(serie)
  minimo<-min(serie)
  maximo<-max(serie)
  desvio<-sd(serie)
  return(list(media, minimo, maximo, desvio))
}

#Se piden los N valores para probar el programa, con la función scan

serie<-scan()
funcion_resumen(serie)

#Utilizo los datos del ejercicio 7, las temperaturas para probar el programa con
#mas volumen de datos

funcion_resumen(temperatura)

#b) Armar una funcion a la que se le ingrese una serie de longitud N y una 
#cantidad de intervalos I,y que calcule un histograma usando I intervalos
#iguales que abarquen la totalidad del rango de la serie.

funcion_histograma<-function(datos,intervalos){
  maximo<-max(datos,na.rm=T)
  minimo<-min(datos,na.rm=T)
  ancho<-(maximo-minimo)/intervalos
  grafico<-hist(datos,intervalos,plot = T)
  return(grafico)
}

funcion_histograma(temperatura3,6)

#EJERCICIO 9##########################################################

#El archivo t media EF.RData contiene un array de tipo lista con la
#temperatura media del mes de Enero y Febrero desde 1982 a 2012 para 5 
#estaciones argentinas (usar la sentencia load(“t media EF.RData”) para abrirlo). 

#La primera columna del array contiene el nombre de cada estacion, la segunda 
#contiene la serie para el mes de enero y la tercera para el mes de febrero. 

#Cada fila del array esta asociada a una estacion:

setwd("C:/Users/HP/Desktop/LABO/Datos para ejercicios")
rm(list=ls())
load("t_media_EF.RData")

#Osea tengo 5 estaciones, 30 años, 2 meses= 300 datos

colnames(estaciones)<-c("Estaciones", "Enero", "Febrero")
rownames(estaciones)<-c("1", "2", "3", "4", "5" )

#a) Para cada estacion: Obtener la anomalıa mensual maxima de enero y el anio
#en que se alcanzo. Almacenarlo en un data frame donde la primer variable 
#sea el nombre de cada estacion, la segunda el anio de la anomalia y la tercera
#dicho valor.

#Genero los vectores vacios que voy a necesitar para el ciclo
nombre<-c()
anomalias.max.anio<-c()
anomalias.max.valor<-c()
a<-0

for (i in 1:5) {
  estacion<-sapply(estaciones[i,2:3], mean)       #Pido la media para las columnas 2 y 3 (ene y feb), en todas las filas (estaciones)
  anomalia.enero<-(estaciones[[i,2]]-estacion[1]) #Me quedo con la columna 1 (ene), escribiendo estacion[1]
  posicion<-which.max(abs(anomalia.enero))        #Busco el maximo de anomalia de enero
  anomalias.max.anio[i]<-1981+posicion            #Busco el anio de esa anomalia max
  nombre[i]<-estaciones[[i,1]]                    #Voy llenando los nombres de las estaciones
  a<-anomalias.max.valor[i]<-(anomalia.enero[posicion]) #Busco el valor de la posicion del max
  print(paste("Para la estacion",nombre[i],"la anomalia mensual maxima de enero se alcanzo en el anio",anomalias.max.anio[i],"con un valor de",a))
}
est<-data.frame(nombre,anomalias.max.anio,anomalias.max.valor)
est

#b) Para cada estacion: Calcular la media y el desvıo estandard para el mes de
#febrero. Imprimir luego un cartel que seale para cada estacion en que los anios la
#temperatura estuvo por encima de la media mas un desvıo standar.

media<-sapply(estaciones[,3], mean) #Me quedo en la columna 3 que corresponde a feb
desvio<-sapply(estaciones[,3], sd)

anio <- 0

#Con este ciclo le pido imprimirme en oracion los resultado

for (i in 1:5){ #las 5 estaciones
  for (j in 1:31) { #los datos de febrero
    if (estaciones[[i,3]][j]>(media[i]+desvio[i])) {
      anio <- 1981+j #desde 1981 en adelante (1982,1983,etc)
      print(paste("Para la estacion",estaciones[i,1],"la temperatura por encima de la media mas un desvio estandar se alcanzo en el anio",anio))
    }
  }
}

#c) Escribir una funcion que, dado un vector de longitud N con los datos de 
#temperatura calcule el rango de la serie y la mediana. Utilizar dicha funcion
#en los datos de enero y guardar los resultados en una nueva matriz que lleve
#como nombre en cada columna el de cada una de las estaciones.

funcion_rango_mediana<-function(vector) { #El argumento es un vector
  a<-array(list(), c(2,1)) #Array de listas de 2 filas y 1 columna
  a[[1,1]]<-range(vector) #En la primer fila primer columna pongo el rango
  a[[2,1]]<-median(vector) #En la segunda fila primer columna pongo la mediana
  return(a)
}

#Aplico la funcion a enero de todas las estaciones

final<-sapply(estaciones[,2], funcion_rango_mediana)
colnames(final)=c("Buenos Aires", "Viedma", "Rosario", "San Luis", "Resistencia")
rownames(final)=c("Rango", "Mediana")

#Si quiero ver el rango de alguna estacion escribo 

final[1,1]
final[1,2]
final[1,3]
final[1,4]
final[1,5]

#Si quiero ver la mediana de alguna estacion escribo 

final[2,1]
final[2,2]
final[2,3]
final[2,4]
final[2,5]

#EJERCICIO 10##########################################################

#Generar una celda con 10 elementos, donde cada elemento sea un nombre propio.
#Armar una funcion que permita ingresar una lista con nombres (de cualquier 
#dimension) y una letra, y que devuelva una lista que contenga todos los
#nombres contenidos en la celda original que comiencen con dicha letra.

#Armo un vector con una sentencia facil

#Nombres propios con mayuscula
nombres<-c("Angelina", "Valeria", "Ruben", "Julieta", "Francisca", "Paula", "Anastasia")

#Armo una funcion que tiene 2 argumentos: el vector de nombres y una variable
#letra

#(1) Se crea primero una lista que es la que me pide el enunciado
#(2) Se inicia el contador
#(3) Me muevo desde 1 hasta el numero que represente la longitud del vector
#(4) #Si la primer letra de cada nombre (tolower(substr(nombres[i],1,1)) es identicamente 
#igual a la letra ingresada por el usuario (letra), entonces abre un 
#vector donde se van almacenando esos nombres
#(5) Si ese vector queda vacio porque no hay nombres asociados, entonces devuelve
#un warning
#(6) Almaceno el resultado

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

#Pruebo el resultado con letras en mayusculas

funcion(nombres,"v")
funcion(nombres,"A")

#EJERCICIO 11##########################################################

#Se cuenta con seis archivos de datos correspondientes a valores medios diarios
#de temperatura, temperatura de rocıo y presion reducida a nivel del mar para 
#las estaciones Azul, Catamarca, Aeroparque, Chilecito, Iguazu y Mendoza.
#Los datos faltantes de temperatura estan codificados con el valor 999.9.
#Los valores de temperatura estan en grados Farenheit.

setwd("C:/Users/HP/Desktop/LABO/Datos para ejercicios")
rm(list=ls())

#Comienzo cargando los datos de cada estación con la sentencia read table

{
  Azul<-read.table("AZUL.txt")
  Catamarca<-read.table("CATAMARCA.txt")
  Aeroparque<-read.table("AEROPARQUE.txt")
  Chilecito<-read.table("CHILECITO.txt")
  Mendoza<-read.table("MENDOZA.txt")
  Iguazu<-read.table("IGUAZU.txt")
  informacion<-read.table("estaciones.txt")
}

#a) Armar un array de listas que contenga los datos correspondientes a cada 
#estacion como ası tambien informacion asociada a cada estacion en particular:
#nombre, latitud, longitud, altura y codigo de identificacion. Convertir los 
#valores de temperatura y temperatura de rocıo a grados centıgrados.
#La informacion sobre la ubicacion de cada estacion esta disponible en el archivo
#estaciones.txt.

#Armo un array tipo lista vacio, que tenga 5 filas (estaciones) y 9 columnas (variables
#importantes) para ir completando

estacion<-array(list(),dim=c(5,9))

#Nombre a las columnas

colnames(estacion)<-c("Nombre", "Latitud", "Longitud", "Altitud", "Codigo", "Fechas","Temp", "Td", "Presion")

#Lleno las primeras 4 columnas con la info de las estaciones

for(i in 1:4){
  estacion[,i]=informacion[,i]
}

#Ubico los codigos de las estaciones
#De cada estación, me quedo con la primer variable (codificada como v1), 
#y el primer valor(son todos iguales)

codigos<-c(Azul[[1]][1],Aeroparque[[1]][1],Catamarca[[1]][1],Chilecito[[1]][1],Iguazu[[1]][1])
estacion[,5]<-codigos #Se lo asigno a la 5ta columna

#Para los datos que faltan genero una matriz y la completo por filas

general<-matrix(c(Azul,Aeroparque,Catamarca,Chilecito,Iguazu),nrow=5,ncol=5, byrow=TRUE)
for (i in 1:5){   #Recorro cada fila de mi array estacion
  for (j in 6:9){ #Recorro las columnas (desde fechas a presion)
    estacion[i,j]=general[i,j-4] #j-4: de gral necesito de la segunda columna hasta la quinta
  }
}

#Si evaluo

estacion[[2,1]] #Fila 2 Columna 1 sale "Aeroparque"
estacion[[5,7]] #Fila 5 Columna 7 obtengo los datos de temperatura de Iguazu

#Cambio los datos faltantes (aquellos codificados con 999) por NA en todas las
#filas para las columnas de temperatura, temperatura de rocio y presion

for(i in 1:nrow(estacion)){
  estacion[[i,"Temp"]][which(estacion[[i,"Temp"]]>=9999.9)]<-NA
  estacion[[i,"Td"]][which(estacion[[i,"Td"]]>=9999.9)]<-NA
  estacion[[i,"Presion"]][which(estacion[[i,"Presion"]]>=9999.9)]<-NA
}

#Convierto los valores de temperatura y temperatura de rocio a °C
#Armo una funcion que solo depende de la temperatura

celsius=function(t){
  return(round((t-32)*(5/9), digits=2))
}

#Aplico a las columnas de temperatura y temperatura de rocio

for (i in 1:5){
  estacion[[i,7]]=celsius(estacion[[i,7]])
  estacion[[i,8]]=celsius(estacion[[i,8]])
}

#b) En base al array armado en el punto a), desarrollar funciones que permitan
#hacer lo siguiente:

#  i) A partir del array, generar un resumen por pantalla con el nombre de
#las estaciones y la cantidad de datos presentes en cada una, la cantidad de 
#datos de temperatura por encima de 30°C y los estadısticos basicos de cada 
#serie (media, desvıo estandar, valor maximo y mınimo), la fecha inicial 
#del perıodo abarcado y la fecha final.

resumen=function(a){ #Parametro: lista
  
  for(i in 1:nrow(a)){ 
    
    #Cuento las temperaturas mayores a 30
    t=length(which(a[[i,"Temp"]]>30))
    
    #Uso la funicion cat de la teorica con \n como enter
    
    cat("\n",
        "\n Estacion: ",a[[i,"Nombre"]],   #Imprimo todo este bardo
        "\n Cantidad de datos:",length(a[[i,"Fechas"]]),
        "\n Temperaturas mayores a 30 grados C:",t,
        "\n Temperatura:",
        "\n \t Media: ", round(mean(a[[i,"Temp"]],na.rm=T),digits=2),"grados C",
        "\n \t Desvio: ", round(sd(a[[i,"Temp"]],na.rm=T),digits=2),"grados C",
        "\n \t Maximo: ", max(a[[i,"Temp"]],na.rm=T),"grados C",
        "\n \t Minimo: ", min(a[[i,"Temp"]],na.rm=T),"grados C",
        "\n Temperatura de rocio:",
        "\n \t Media: ", round(mean(a[[i,"Td"]],na.rm=T),digits=2),"grados C",
        "\n \t Desvio: ", round(sd(a[[i,"Td"]],na.rm=T),digits=2),"grados C",
        "\n \t Maximo: ", max(a[[i,"Td"]],na.rm=T),"grados C",
        "\n \t Minimo: ", min(a[[i,"Td"]],na.rm=T),"grados C",
        "\n Presion:",
        "\n \t Media: ",round(mean(a[[i,"Presion"]],na.rm=T),digits=1),"hPa",
        "\n \t Desvio: ", round(sd(a[[i,"Presion"]],na.rm=T),digits=1),"hPa",
        "\n \t Maximo: ", max(a[[i,"Presion"]],na.rm=T),"hPa",
        "\n \t Minimo: ", min(a[[i,"Presion"]],na.rm=T),"hPa")
  } 
}

#En cada iteracion del for me va a hacer un print segun la estacion

resumen(estacion)

#Los warnings se deben a que todos los valores de presion de Chilecito son error
#Lo de la fecha no me salió

#ii) Una funcion que permita obtener todas las estaciones que estan dentro de 
#una determinada region definida por una latitud maxima, una latitud mınima, 
#una longitud maxima y una longitud mınima.

#Armo la función

#(1) Parametros: array de listas, valor de lats y lons
#(2) Creo una lista vacia que se va a ir completando
#(3) Inicio un contador
#(4) Me muevo entre 1 y el numero de filas de la lista
#(5) Pido que todas las condiciones se tienen que cumplir si o si con &

mapa<-function(l,lat1,lat2,lon1,lon2){ #(1)
  lista<-list() #(2)
  j<-1 #(3)
  for(i in 1:nrow(l)){ #(4)
    if(l[[i,2]]>lat1 &
       l[[i,2]]<lat2 & 
       l[[i,3]]>lon1 & 
       l[[i,3]]<lon2) { #(5)
      lista[[j]]<-l[[i,1]]
      j<-j+1
    }
  }
  return(lista)
}

mapa(estacion,-30,0,-60,0) #Iguazu

#iii) Una funcion que devuelva una lista que contenga solo aquellas estaciones 
#que esten a menos de una distancia dada de un cierto punto (identificado por su
#latitud y longitud) y con un atributo adicional que indique la distancia de 
#dicha estacion al punto seleccionado.

#iv) Guardar la lista generada en un archivo con formato R (para utilizar los 
#datos en las siguientes practicas)


#EJERCICIO 12##########################################################

#El archivo presiondesaturacion.txt contiene dos columnas, una con datos de 
#temperatura (◦C) y la segunda con valores de presion de saturacion para el
#vapor de agua (hPa) correspondientes a dichas temperaturas. Armar una funcion
#de R que dada una temperatura obtenga el valor de presion de saturacion
#interpolado linealmente al valor de temperatura deseado a partir de los datos
#presentes en el archivo. Hacer que la funcion muestre un mensaje 
#advertencia y termine correctamente en el caso de que el valor de temperatura 
#indicado este fuera del rango abarcado por la tabla. Comparar los resultados
#utilizando la funcion intrinseca interp1 de R

setwd("C:/Users/HP/Desktop/LABO/Datos para ejercicios")
rm(list=ls())

#Cargo los datos

archivo<-read.table("presiondesaturacion.txt")

#Empiezo con la funcion

#(1) Parametros: tabla, una temperatura
#(2) Si la temperatura ingresada esta por encima del maximo de los datos o por
#debajo del minimo, entonces alerta un warning

#Uso t para temperatura y p para presion, el subindice 2 para el valor siguiente
#y el subindice 1 para el anterior

funcion<-function(datos,t){ #(1)
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

funcion(archivo,500)  #Devuelve el error
funcion(archivo,6.1)  #Devuelve un valor de la tabla
funcion(archivo,10.5) #Devuelve un valor de interpolado de los valores 10 y 10.6
funcion(archivo,7.9)  #Devuelve un valor de interpolado de los valores 7.8 y 8.3
