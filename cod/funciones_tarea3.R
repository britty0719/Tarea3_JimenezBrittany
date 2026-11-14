# Ejercico 1
# Recibe: un data frame de transacciones, ventana y k.alerta.
# Devuelve: un data frame con las altertas diarias.
library(dplyr)
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

# Ejercicio 2
# Recibe: un vector de montos.
# Devuelve: la desviación absoluta media (MAD)

benford.mad <- function(x){
  x <- x[!is.na(x) & x > 0]
  if(length(x) == 0){
    return(NA_real_)
  }
  digitos <- substr(as.character(x), 1, 1)
  frecuencias <- table(factor(digitos, levels = 1:9))
  proporciones <- frecuencias/sum(frecuencias)
  d <- 1:9
  benford.teorico <- log10(1+ 1/d)
  diferencia <- abs(proporciones - benford.teorico)
  mad <- mean(diferencia)
  return(mad)
}

# Recibe: un data frame, canal y cantones
# Devuelve: cod_canton, canton, n, mad y clase

benford.canton <- function(df, canal, cantones){
  datos.canal <- df |> 
    filter(canal == .env$canal)
  resultado <- datos.canal |> 
    group_by(cod_canton) |> 
    summarise(
      n = n(),
      mad = benford.mad(monto_crc),
      .groups = "drop"
    )
  resultado <- left_join(resultado, cantones, 
            by = "cod_canton")
  resultado <- resultado |> 
    mutate(
      clase = case_when(
        mad <= 0.006 ~ "conformidad cercana",
        mad<= 0.012 ~ "conformidad aceptable",
        mad <= 0.015 ~ "conformidad marginal",
    .default = "no conformidad"
    )
  ) |> 
    arrange(desc(mad)) |> 
    select(cod_canton, canton, n, mad, clase)
  return(resultado)
}