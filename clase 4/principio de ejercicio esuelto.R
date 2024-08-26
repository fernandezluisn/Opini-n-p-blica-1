library(dplyr)

baseBalotaje <- read.csv2("C:/Users/lnfernandez/Desktop/No respuesta/analisis de opinion publica/clase 4/baseBalotaje.csv")

baseBalotaje %>% group_by(estrato) %>% summarise(tasaNR=sum(is.na(candidato))/n(),
                                                 cand1=sum(ponderador[candidato==1], na.rm = T),
                                                 cand2=sum(ponderador[candidato==2], na.rm = T) )->NR_estrato
baseBalotaje %>% group_by(sexo) %>% summarise(tasaNR=sum(is.na(candidato))/n())->NR_sexo
baseBalotaje %>% group_by(ciudad) %>% summarise(tasaNR=sum(is.na(candidato))/n())->NR_ciudad
baseBalotaje %>% group_by(estado) %>% summarise(tasaNR=sum(is.na(candidato))/n())->NR_estado
quantile(baseBalotaje$y,c(0.25,0.75))


baseBalotaje %>% group_by(candidato) %>% summarise(sum(ponderador))->votos


baseBalotaje$pondiV<-ifelse(is.na(baseBalotaje$candidato),0,baseBalotaje$ponderador)
  
baseBalotaje %>% group_by(estrato) %>% summarise(a=sum(pondiV), 
                                         b=sum(ponderador),
                                         factor=b/a)->pond

pond %>% select(estrato, factor)->baseJoin

left_join(baseBalotaje,baseJoin)->baseBalotaje

baseBalotaje$pondiV<-baseBalotaje$pondiV*baseBalotaje$factor

baseBalotaje %>% group_by(estrato) %>% summarise(a=sum(pondiV), 
                                                 b=sum(ponderador))->pond2

baseBalotaje %>% group_by(candidato) %>% summarise(sum(pondiV))->votos2

