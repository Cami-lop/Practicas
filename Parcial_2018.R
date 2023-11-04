rm(list=ls())
#Ejercicio 1 
x <- 3
t <- "pepe" 
l<- FALSE
as.numeric(t) #<-NA 
as.numeric(l) #<- 0 porque F es 0 y T es 1  
x>0 | l       #<- TRUE 
l& !(is.logical(t)) # <-FALSE
paste(t,x)    #<-pepe 3 si usaba paste0 el resultado iba a estar todo junto 

#Ejercicio 2
rm(list=ls()) #borra todas las cosas que haya en el enviroment 
a <-pi/2
b <-0
while(cos(a) == b & a < 4*pi){
  print(a)
  print(b)
  a<-a+pi/2
}
#se va a repetir mientras se cumplan las condicion que el cos(a)=0 y que a sea menor a 4pi 
#entra una sola vez al ciclo ya que, despues de una vuelta, las condiciones no se cumplen mas 
#print (a)<-pi/2
#print(b)<-0
#Ejercicio 3 
TE<-c(rnorm(12,14,4))
P<-c(rnorm(12,0.55,2))
A<-matrix(data=c(TE,P), nrow=12  )

info_df<-data.frame("Temperautura"=A[,1],
                    "Precipitacion"=A[,2])
row.names(info_df)<-c("Enero","Feb","Mar","Abril","Mayo","Junio","Julio","Agosto","Sep","Oct","Nov","Dic")
attach(info_df)
                    
                    
T_media_verano_d<-mean(info_df$Temperautura[which(row.names(info_df) == "Dic")])
T_media_verano_e<-mean(info_df$Temperautura[which(row.names(info_df) == "Enero")])
T_media_verano_f<-mean(info_df$Temperautura[which(row.names(info_df) == "Feb")])
                                           
T_media_verano<-c(T_media_verano_d,T_media_verano_e,T_media_verano_f)

P_media_verano_d<-mean(info_df$Precipitacion[which(rownames(info_df) == "Dic")])                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
P_media_verano_e<-mean(info_df$Precipitacion[which(rownames(info_df) == "Enero")]) 
P_media_verano_f<-mean(info_df$Precipitacion[which(rownames(info_df) == "Feb")]) 

P_media_verano<-c(P_media_verano_d,P_media_verano_e,P_media_verano_f)
info_lista<-list("Media T"= T_media_verano,
                   "Media P"= P_media_verano)

#Haria lo mismo para invierno pero no me gusta como quedo la lista 

#Ejercicio 4 
#Transformar el vector
a<-c(5,12.1,7.2,8.2,3.5,2.0,5.8,10.4,1.7,6.0,5.3,0.5)
A<-matrix(data=a, ncol= 2 ,byrow=TRUE)
B<-matrix(data=a, ncol=6)

#Ejercicio 5
x1<- c(1,2,3)
x2<- c(4,5,6)
x3<- c(0,0,0)

XC<- cbind(x1,x2,x3) #quedaria uno al lado del otro 1 2 3/ 4 5 6/ 0 0 0 /<- separa las columnas
is.matrix(XC)|is.matrix(x1) #TRUE
dim(XC) #3x3
XR<- rbind(x1,x2,x3) ##quedaria uno abajo del otro 1 2 3 / 4 5 6/ 0 0 0 /<- separa por filas 
XC%*%XR              #producto matricial
2*XC                 #2 4 6/8 10 12 /0 0 0<- separa por columnas 

#Ejercicio 6
# explicacion linea por linea y correcion de codigos 
rm(list=ls()) #borra el enviroment 
A<-matrix(c(3,1,0,2,5,1,2,2,3,4,1,2),ncol = 3,nrow = 4) 
#arma una matriz que se llena por columnas 
B<-matrix(NA,ncol = 3,nrow = 4) #arma una matriz compuesta de NA 

for(j in 1:dim(A)[3]){  #el ciclo recorre de 1 a 3 que es la dimension de A
  for (i in 1:length(A[,1])){ # este ciclo recorre 1 al largo de la toda la fila de la primer columna de A
    B[j,i]<-sum(A[i,])  
  }
}
# En B se guardan en las posiciones correspondientes a cada elemento que recorre la suma
#de todas las columnas y de las filas que indica el indicar i 

#el error esta en que las dimensiones de los indicadores son distintas lo que provoca que no se guarde todo
#la informacion, ya que no recorre correctamente 

#correccion

for(j in 1:dim(A)[2]){  
  for(i in 1:length(A[,1])){ 
    B[i,j]<-sum(A[i,])  #se cambia el orden de los indicadores en esta sentencia 
  }
}  

#Ejercicio 7 
A<-c("Juan", "Pablo","Carla", "Mariana","Cristian") 
B <-c("34 8 1984 7 1 37")
 paste(A[1],"tiene",substr(B,15,nchar(B)),"años")
#Juan tiene 37 años
 B[1]==substr(B,5,5)
#FALSE
 as.numeric(substr(B,8,9))/as.numeric(substr(B,6,6))
#84/1<-84
 print(paste(A[2],"nacio el",paste(substr(B,11,11),substr(B,4,4),substr(B,6,9),sep="/")),quote=FALSE)
#Pablo nacio el 7/8/1984

 #Ejercicio 8
M<-matrix(c(1,2,8,-1,3,0),nrow=2)
B<-1
 C<- M>B 
   #F,T,T,F,T,F<- matriz con esa info que se llana por columnas x default 
  
 (M<=B+1) & C
   #matriz que se llena con T o False por columnas
  
 D<-M[!C]
   #!C<-T,F,F,T,F,T
   #D<-1,-1,0
 
 is.logical(D)
 #FALSE
 
 
 #Ejercicio 9
 rm(list=ls())
 Fa<-matrix(c(2,1,0,-2,-1,0,1,0,1),ncol=3,byrow=TRUE) 
 g<-c(2,4,6)
 
 Fa[which(Fa==0)]<-NA
 A<-cbind(Fa,g)
 B<-matrix(c(2,1,0,-2,-1,0,1,0,1),ncol=3)
 E<-c(T,F,F,F,F,T,F,F,T)
 C<-Fa[E] #por columna 
 
 #Ejercicio 10 
 rm(list=ls()) #borro el enviroment 
 a<-array(c(1,2,3,4),c(2,2)) #armo una matriz de 2x2 que se llena x columnas
 b<-array(c(1,3,2,4),c(2,2)) #armo una matriz de 2x2 que se llena x columnas
 c<- which(a == b) # las posiciones donde "a" es igual a "b" 1,4
 out<-"La variable c es"
 
 if(max(c)>2){
   print(paste(out,"azul",sep=" "),quote=FALSE)
 } else if(max(c) == 2) {
   print(paste(out,"roja",sep=" "),quote=FALSE)
 } else{
   print(paste(out,"verde",sep=" "),quote=FALSE)
 }
 
 #el resultado de ese ciclo es La variable c es azul
 