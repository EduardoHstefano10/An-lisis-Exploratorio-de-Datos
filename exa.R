# 1. Carga de librerías
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)
dim(BDTAREA)
# 2. Carga de datos (asegúrate de haber cargado los datos antes)
#ES UN ANALISSIS DESCRIPTIVO, CUAL ES EL COMPORTAMIENTO Y SI HAY INFRACCIONES Y NO. Y CUAL ES LA FRECUENCIAS.. PUEDO HACERLO CON UN EDA
# 3. Análisis exploratorio

# Visualización de la estructura de datos
str(BDTAREA)

# Resumen estadístico de los datos
summary(BDTAREA)

# Exploración de la distribución de las variables numéricas

# Histograma de la velocidad de los autos
ggplot(data = BDTAREA, aes(x = speed)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribución de Velocidades de Autos",
       x = "Velocidad (mph)", y = "Frecuencia") +
  theme_minimal()

# Boxplot de la velocidad de los autos por período
ggplot(data = BDTAREA, aes(x = as.factor(period), y = speed)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Velocidad de Autos por Período",
       x = "Período", y = "Velocidad (mph)") +
  theme_minimal()

# Boxplot de la velocidad de los autos por presencia de señal de advertencia
ggplot(data = BDTAREA, aes(x = as.factor(warning), y = speed)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Velocidad de Autos con/sin Señal de Advertencia",
       x = "Señal de Advertencia", y = "Velocidad (mph)") +
  theme_minimal()

# 4. Análisis de la relación entre variables

# Correlación entre todas las variables numéricas
correlation <- cor(BDTAREA[, c("speed", "period", "warning", "pair")])
print(correlation)

# Visualización de la matriz de correlación
corrplot(correlation, method = "circle")

# Correlación entre velocidad y período
cor_speed_period <- cor.test(BDTAREA$speed, BDTAREA$period)
print(cor_speed_period)

# Correlación entre velocidad y presencia de señal de advertencia
cor_speed_warning <- cor.test(BDTAREA$speed, BDTAREA$warning)
print(cor_speed_warning)
