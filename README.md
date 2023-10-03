# INFERENCIAL_SABER11_2022
En este proyecto se pretende mostrar un análisis realizado a los resultados de la prueba Saber 11 y su relación con las variables socioeconómicas de los estudiantes.
# Proyecto de Análisis de Datos - Prueba "Saber 11" 2022

## Descripción del Problema

Este proyecto se enfoca en analizar si las variables socioeconómicas del estudiante y del colegio tienen un impacto en los resultados globales de la prueba "Saber 11" a nivel nacional del primer semestre de 2022. Se consideran cuatro variables clave que podrían estar relacionadas con el puntaje global de la prueba:

### Variables del Estudiante:

- **INSE:** Indicador de la Situación Socioeconómica del Estudiante (Variable numérica).
- **Género:** Género del estudiante (Variable categórica: Hombre o Mujer).

### Variables del Colegio:

- **Calendario:** Tipo de calendario del colegio (Variable categórica: A o B).
- **Ubicación:** Ubicación del colegio (Variable categórica: Rural o Urbana).

### Variable Dependiente:

- **Puntaje Global:** Puntaje final obtenido por el estudiante en la prueba, con valores que van de 0 a 500 (Variable numérica).

## Descripción de las Variables

Para comprender mejor el conjunto de datos y las relaciones entre las variables, se realizaron análisis descriptivos y gráficos, que revelaron las siguientes tendencias:

- Los colegios de calendario B tienden a tener puntajes más altos en la prueba en comparación con los colegios de calendario A.
- Los estudiantes de colegios ubicados en zonas rurales suelen obtener mejores resultados que aquellos en colegios urbanos.
- Existe una correlación significativa (coeficiente de correlación de 0.669) entre la variable INSE y el puntaje global del estudiante, lo que sugiere una posible relación positiva entre el indicador socioeconómico y el rendimiento en la prueba.

## Modelo de Regresión Lineal Múltiple

Se realizó un análisis de regresión lineal múltiple para explicar el puntaje global de la prueba "Saber 11" en función de las variables mencionadas. Los resultados del modelo indicaron que todas las variables individuales son significativas para predecir el puntaje global.

Además, se realizaron pruebas para verificar la validez de las suposiciones del modelo, incluyendo independencia, homocedasticidad y normalidad de los residuos.

## Significancia de las Variables

Se realizaron pruebas de significancia individual y global para evaluar la importancia de las variables en el modelo. Todas las variables individuales resultaron significativas, y el modelo en su conjunto también fue significativo.

## Inclusión del Género

Se realizó una prueba de significancia parcial para evaluar si el género del estudiante tiene un efecto en el puntaje global. Los resultados indicaron que el género es una variable significativa en el modelo.

## Combinación Lineal de Variables

Finalmente, se evaluó la relación entre las variables "Calendario" y "Ubicación" mediante una prueba de combinación lineal. Los resultados sugirieron que la relación lineal de estas variables también es significativa.
