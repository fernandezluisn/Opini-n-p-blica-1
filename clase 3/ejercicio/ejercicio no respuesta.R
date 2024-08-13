library(here)
library(zip)

remove(list=ls())
gc()

#### descargo las bases del operativo aprender 2019 ####

url <- "https://www.argentina.gob.ar/sites/default/files/bases_usuarias_aprender_2019_csv.zip"
zipfile <- "aprender2019.zip"
download.file(url, zipfile)

zip::unzip(zipfile, exdir = here("clase 3","ejercicio"))

# hay problemas en la descarga y lectura del archivo debido a la letra ñ, de haber un error se puede deber a ello
Base.estudiantes <- read.csv2(here("clase 3","ejercicio","Bases usuarias Aprender 2019 CSV",
                                   "Base estudiantes 5-6 a�o secundaria 2019 USUARIA (Censo L y M).csv"))

gc()

#### acá arranca el ejercicio ####

# Consigna 1: 
# Observe el diccionario de variables y luego la base de estudiantes.
# Luego analice la no respuesta a la variable de asistencia a nivel inicial (ap24) y a la de las faltas (ap26).
# ¿Qué valores pueden tomarse como no respuesta según su criterio?
# ¿Cuál es la tasa de no respuesta?
# ¿Observa algún patrón en la no respuesta? ¿Cuál?
# Analice los NA por separado del resto

#### parte 2 del ejercicio: descargo bases usuarias EPH 1T24 ####

url <- "https://www.indec.gob.ar/ftp/cuadros/menusuperior/eph/EPH_usu_1_Trim_2024_txt.zip"
zipfile <- "EPH_12024.zip"
download.file(url, zipfile)

zip::unzip(zipfile, exdir = here("clase 3","ejercicio"))

Base.personas.EPH <- read.csv2(here("clase 3","ejercicio","EPH_usu_1er_Trim_2024_txt",
                                   "usu_individual_T124.txt"))

gc()

#### analisis de no respuesta a variable P21 ####

# Consigna 2: 
# Observe el diseño del registro de la EPH y luego la base usuaria de personas.
# Luego analice la no respuesta a la variable de ingreso de la ocupación principal (P21).
# ¿Qué sucede con los -9? 
# ¿Cuál es la tasa de no respuesta?
# ¿Analice la relación de la tasa de respuesta con otras variables como nivel educativo, sexo, cat_ocup, PP07H, etc.?
# ¿Observa algún patrón en la no respuesta? ¿Cuál?
