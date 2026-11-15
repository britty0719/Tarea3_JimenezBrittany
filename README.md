# Tarea 3 — Herramientas de Datos I

**Estudiante:** Brittany Jiménez  
**Curso:** CA-0204 — Herramientas de Datos I

## Descripción

Este repositorio contiene la solución de la Tarea 3, desarrollada mediante R, Quarto, Excel, Power Query y Git.

## Ejercicios

1. **Alertas por ventana móvil:** identificación de días con cantidades inusuales de transacciones.
2. **Ley de Benford:** análisis de los primeros dígitos de los montos de transacciones y cálculo del MAD.
3. **Valor acumulado:** cálculo del valor futuro de depósitos mensuales y de los intereses ganados.

## Estructura del proyecto

- `cod/`: funciones de R y código de generación de datos.
- `config/`: parámetros utilizados en los ejercicios.
- `data/`: archivos de datos.
- `excel/`: libro de Excel con los cálculos y respuestas.
- `info/figuras/`: gráficos generados.
- `Tarea3_JimenezBrittany.qmd`: reporte en Quarto.
- `Tarea3_JimenezBrittany.html`: reporte generado en HTML.

## Reproducibilidad

El archivo `data/transacciones_2025.csv` no se incluye en el repositorio debido a su tamaño.

Para reproducir el análisis:

1. Abrir el proyecto de RStudio.
2. Ejecutar `cod/01_datos.R` para generar los datos, si el script dispone de los archivos fuente necesarios.
3. Verificar que los archivos CSV estén disponibles en `data/` y `config/`.
4. Ejecutar o renderizar `Tarea3_JimenezBrittany.qmd`.
5. Consultar los resultados adicionales en el libro de Excel.

## Control de versiones

El trabajo se desarrolló mediante ramas independientes para cada ejercicio, con commits individuales y fusiones a la rama principal `main`.