# Ejercico 1
# Recibe: un data frame de transacciones, ventana y k.alerta.
# Devuelve: un data frame con las altertas diarias.
library(dplyr)
transacciones <- read.csv2("data/transacciones_2025.csv")
parametros <- read.csv2("config/parametros_tarea3.csv")
alerta.movil <- function(df, ventana, k.alerta){
  datos.diarios <- df |> 
    count(fecha, name = "n.tx") |> 
    arrange(fecha)
  datos.diarios$media <- NA_real_
  datos.diarios$desv <- NA_real_
  datos.diarios$alerta <- NA
  for(i in (ventana + 1):(nrow(datos.diarios))){
      media = mean(datos.diarios$n.tx[(i - ventana):(i - 1)])
    datos.diarios$media[i] <- media
    desv = sd(datos.diarios$n.tx[(i - ventana):(i - 1)])
    datos.diarios$desv[i] <- desv
    if(datos.diarios$n.tx[i] > media + k.alerta*desv){
      alerta = TRUE
    } else{
      alerta = FALSE
    }
    datos.diarios$alerta[i] <- alerta
  }
  return(datos.diarios)
}

resultado <- alerta.movil(transacciones, 5, 1.75)
