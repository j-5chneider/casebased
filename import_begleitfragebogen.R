# Daten importieren ####
library(Hmisc)
library(foreign)
diss_begleit <- spss.get("data/Daten Begleitfragebogen_01 [bereinigt, mit Kontrollgruppe].sav", use.value.labels=FALSE)
  # View(diss_begleit)
  # View(names(diss_begleit))



# Gesamtdatensatz mit PrePost + Begleitfragebogen ####
  library(dplyr)
  #Datensatz lieber zuerst long machen und dann zeilen hinzufügen? Variable Seminar wird auch aus Begleitfragebogen benötigt, bei full_join werden aber nur Spalten hinzugefügt
  diss_prepost_begleit <- full_join(diss_prepost_w_kovar_analy, diss_begleit, by="code")
  
 

# Variablen mot3.b1, mot3.b3, mot11.b1, mot11.b3
  library(dplyr)
  diss_prepost_begleit <- tbl_df(diss_prepost_begleit)
  diss_prepost_begleit <- diss_prepost_begleit %>%
                               mutate(mot3.b1.u = 8 - mot3.b1,
                                      mot3.b3.u = 8 - mot3.b3,
                                      mot11.b1.u = 8 - mot11.b1,
                                      mot11.b3.u = 8 - mot11.b3,
                                      mot4.b1.u = 8 - mot4.b1,
                                      mot7.b1.u = 8 - mot7.b1,
                                      mot10.b1.u = 8 - mot10.b1,
                                      mot13.b1.u = 8 - mot13.b1,
                                      mot4.b3.u = 8 - mot4.b3,
                                      mot7.b3.u = 8 - mot7.b3,
                                      mot10.b3.u = 8 - mot10.b3,
                                      mot13.b3.u = 8 - mot13.b3)
  
  

#  #für weitere Analysen muss $llm und $medium numeric sein
#   #allerdings wandelt R 0er in 1er und 1er in 2er um -> Korrektur
#   diss_prepost_w_kovar$llm <- as.numeric(diss_prepost_w_kovar$llm)
#   diss_prepost_w_kovar$llm[diss_prepost_w_kovar$llm==1] <- 0
#   diss_prepost_w_kovar$llm[diss_prepost_w_kovar$llm==2] <- 1
#   diss_prepost_w_kovar$medium <- as.numeric(diss_prepost_w_kovar$medium)
#   diss_prepost_w_kovar$medium[diss_prepost_w_kovar$medium==1] <- 0
#   diss_prepost_w_kovar$medium[diss_prepost_w_kovar$medium==2] <- 1
#   #   View(names(diss_prepost_w_kovar))