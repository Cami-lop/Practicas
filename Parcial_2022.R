#Parcial 2022
getwd()
#Ejercicio 1
v<-seq(16,5,-2)
f<-8
g<-5
t<-"Azul"

A<- g>v #F,F,F,F,F,F
B<- (f<v[2]) | !(g<0) #TRUE
C<- v[3]%%3 #el resto de la division de 12/3 
D<-paste(t,"el",g) #Azul el 5

#Ejercicio  2
M<-matrix(c(4,-1,0,-2,1,7,-3,0,4,2,1,-1,5,-2,0,3), nrow=4 , byrow=TRUE)
b<-c(7,9,6,5)
c<-4

2*M[c]  #10 busca por columna 
which.max(M) # me da la posicion del maximo de M 
min(M) #-3
M[M<0]<-NA #Pone N en la posicion en las que M es menor a 0
M[,c]<-b #en la columna cuatro guarda los valores de b 

#Ejercicio 4 
temperatura<-c(rnorm(120, mean=20, sd=5)) #datos mensuales
precipitacion<-c(rnorm(120, mean=0.75, sd=2))
data<-array(data=c(temperatura,precipitacion), dim=c(10,12,2)) # dimensiones 10 años /12 meses/ 2 variables 

#Quiero la media para cada año  para cada variable en Sep, Oct y Noviembre
anios<-1:10 #noestoy contando el año 2000// va de 2001 al 2010
primavera<-9:11 

i<-1
temp_media<-c()
pp_media<-c()
for( anio in anios){
    temp_data<-mean(data[anio,primavera,1])
    temp_media<-c(temp_media,temp_data)
    pp_data<-mean(data[anio,primavera,2])
    pp_media<-c(pp_media,pp_data)
  
  i<-i+1
}
primavera_a<-array(data=c(temp_media,pp_media), dim=c(10,2)) #dimensiones 10 y 2
colnames(primavera_a)<-c("Temp_media","PP_media")

rownames(primavera_a)<-c("2001","2002","2003","2004","2005","2006","2007","2008","2009","2010")

#Ejercicio 5

datos<-list("Nombres"=c("Camila","Cande","Maite","Eli"),
            "Apellido"=c("Lopez","Russo","Gonzalez","Degani"),
            "Edad"=c(21,22,22,23),
            "Altura"=c(1.55,1.65,1.60,1.70))

vec<-c()               
for(i in 1:length(datos$Nombres)){
  name<-datos$Nombres[i]
    c<-substr(name,1,1) #estaba bien pensado solo me equivoque de funcion
  vec<-c(vec,c)
}

#Ejercicio 6
temperatura<-c(rnorm(4415040, mean=23, sd=7))
#tiene que tener N cantidad de datos
#siendo N= lat*lon*tiempo
lat<-seq(-90,90,2.5)
lon<-seq(0,357.5,2.5)
anio<-1980:2015 #35 años
mes<-1:12
tiempo<-35*12
temp<-array(data=temperatura,dim=c(length(lon),length(lat),tiempo))

#Busco las longitudes pedidas
lat_plata<-which(lat %in% -37.5:-22.5)
lon_plata<-which(lon %in% 295.0:310)


#ciclo anual medio<- creo que quiero el promedio para cada año de las temp
data_temp<-temp[lon_plata,lat_plata,]
temp_2<-array(data=data_temp,dim=c(4,4,12,35)) 
ciclo_anual<-apply(temp_2,c(1,2,3),mean) #creo que es asi 
#no entiendo que mantener cte

#Ejercicio 7
A<-matrix(1:6, nrow=2 ,ncol=3)
B<-matrix(1:6, nrow=2 , ncol=3)

func_matriz<-function(matriza,matrizb) {
  if(nrow(matriza)==nrow(matrizb) & ncol(matriza)==ncol(matrizb)){
    C<-matriza+matrizb
  }else if(nrow(matriza)==nrow(matrizb)){
    C<-cbind(matriza,matrizb)
  }else if (ncol(matriza)==ncol(matrizb)){
    C<-rbind(matriza,matrizb)
  } else{
    print("ERROR, DIMENSIONES NO COMPATIBLES")
  }
  return(C)
}

func_matriz(A,B)
#Para pegar columnas el numero de filas teiene que ser el mismo
#para pegar filas el numero de columnas tiene que ser el mismo
