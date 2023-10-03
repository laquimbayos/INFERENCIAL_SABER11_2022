#¿Afectan las variables socioeconómicas del estudiante y del colegio a los resultados globales de la prueba del “Saber 11” 
#a nivel nacional del primer semestre de 2022?

install.packages("ggplot2")

library(tidyverse)
library(readr)
Datos <- read_delim("C:/Users/57350/Desktop/GITHUB/REGRESION/SABER_11_2022-1/SB11_20221.TXT", 
                         delim = "¬", escape_double = FALSE, 
                         trim_ws = TRUE)

df<-Datos[,c("PUNT_GLOBAL", "COLE_CALENDARIO", "COLE_AREA_UBICACION", "ESTU_INSE_INDIVIDUAL", "ESTU_GENERO")]
View(df)


#unique(df$ESTU_NSE_ESTABLECIMIENTO)

df <- mutate_at(df, c("COLE_CALENDARIO"), ~replace(., COLE_CALENDARIO =="OTRO", "A"))
unique(df$COLE_CALENDARIO)
unique(df$COLE_CALENDARIO)

apply(X = is.na(df), MARGIN = 2, FUN = sum)
df<-na.omit(df)
attach(df)


#Analisis descriptivo:

numerico <- df[,c("PUNT_GLOBAL","ESTU_INSE_INDIVIDUAL")]
View(numerico)
  
#df<-Datos[,c("PUNT_GLOBAL", "COLE_CALENDARIO", "COLE_AREA_UBICACION", 
             #"ESTU_INSE_INDIVIDUAL", "ESTU_GENERO")]


#Grafico de variables categóricas:

bc <- ggplot(df, aes(x = COLE_CALENDARIO, y = PUNT_GLOBAL)) 
bc + geom_boxplot(aes(fill = COLE_CALENDARIO)) + facet_wrap(~"Puntajes según Calendario")

bg <- ggplot(df, aes(x = ESTU_GENERO, y = PUNT_GLOBAL)) 
bg + geom_boxplot(aes(fill = ESTU_GENERO)) + facet_wrap(~"Puntajes según Genero")

bu <- ggplot(df, aes(x = COLE_AREA_UBICACION, y = PUNT_GLOBAL))
bu + geom_boxplot(aes(fill = COLE_AREA_UBICACION)) + facet_wrap(~"Puntajes según Ubicación")


#Correlación variables numéricas:
round(cor(x = numerico, method = "pearson"), 3)

library(corrplot)
corrplot(cor(dplyr::select(df, PUNT_GLOBAL,ESTU_INSE_INDIVIDUAL)),
         method = "number", tl.col = "black")

#Distribución de los datos numéricos:

library(psych)
multi.hist(x = df$PUNT_GLOBAL, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "Puntaje Global")

multi.hist(x = df$ESTU_INSE_INDIVIDUAL, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "Indicadior Socieconómico del Estudiante")



#Gráfico de correlación

install.packages("GGally")
library(GGally)
ggpairs(numerico, lower = list(continuous = "smooth"),
        diag = list(continuous = "barDiag"), axisLabels = "none")

#Gráfico de dispersión Puntaje global vs INSE y Calendario 

ggplot(df, aes(x = df$ESTU_INSE_INDIVIDUAL, y = df$PUNT_GLOBAL)) +
  geom_point(aes(colour = df$COLE_CALENDARIO)) + # Puntos y colores por grupo
  scale_color_discrete("Calendarios") +  # Cambiar el título de la leyena
  xlab("Indicadior Socieconómico del Estudiante") +              # Etiqueta del eje X
  ylab("Puntaje global")  +             # Etiqueta del eje Y
  theme(axis.line = element_line(colour = "black", # Cambia el tema por defecto
                                 size = 0.24))+facet_wrap(~"Dispersión Puntaje global vs INSE y Calendario")

#Gráfico de dispersión Puntaje global vs INSE y Ubicación del colegio 
ggplot(df, aes(x = df$ESTU_INSE_INDIVIDUAL, y = df$PUNT_GLOBAL)) +
  geom_point(aes(colour = df$COLE_AREA_UBICACION)) + # Puntos y colores por grupo
  scale_color_discrete("Ubicación del cologio") +  # Cambiar el título de la leyena
  xlab("Indicadior Socieconómico del Estudiante") +              # Etiqueta del eje X
  ylab("Puntaje global")  +             # Etiqueta del eje Y
  theme(axis.line = element_line(colour = "black", # Cambia el tema por defecto
                                 size = 0.24))+facet_wrap(~"Dispersión Puntaje global vs INSE y Ubicación")

#Gráfico de dispersión Puntaje global vs INSE y Genero 
ggplot(df, aes(x = df$ESTU_INSE_INDIVIDUAL, y = df$PUNT_GLOBAL)) +
  geom_point(aes(colour = df$ESTU_GENERO)) + # Puntos y colores por grupo
  scale_color_discrete("Genero") +  # Cambiar el título de la leyena
  xlab("Indicadior Socieconómico del Estudiante") +              # Etiqueta del eje X
  ylab("Puntaje global")  +             # Etiqueta del eje Y
  theme(axis.line = element_line(colour = "black", # Cambia el tema por defecto
                                 size = 0.24))+facet_wrap(~"Dispersión Puntaje global vs INSE y Genero")



reg1 = lm(PUNT_GLOBAL ~ COLE_CALENDARIO + ESTU_INSE_INDIVIDUAL + COLE_AREA_UBICACION , data = df)
reg2 = lm(PUNT_GLOBAL ~ COLE_CALENDARIO + ESTU_INSE_INDIVIDUAL + COLE_AREA_UBICACION + ESTU_GENERO, data = df)

summary(reg1)
summary(reg2)
plot(reg1)

#Realizamos un resumnen

install.packages("stargazer")
library(stargazer)

stargazer(reg1, type="text",
          title = "Resultados del modelo de regresión multiple")

#REalizamos prueba de significancia parcial entre los dos modelos.

anova(reg1, reg2)

#Realizamos una prueba entre una relación lineal de los betas

library(car)
linearHypothesis (reg1, "COLE_CALENDARIOB+COLE_AREA_UBICACIONURBANO =0")
?linearHypothesis
