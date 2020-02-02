# Daten importieren ####
library(Hmisc)
library(foreign)
diss_prepost <- spss.get("data/43_1-7_cfa_2014-05-20.sav", use.value.labels=FALSE)
  # View(diss_prepost)
  # View(names(diss_prepost))

# datensatz reduzieren ####
  diss_prepost <- diss_prepost[c("code"
                               , "seq.nrK"
                               , "analyseV4v"
                               )]


# reshape: weiter Datensatz ####
library(reshape2)
diss_prepost_w <- dcast(diss_prepost, code ~ seq.nrK, value.var = "analyseV4v")
  # View(diss_prepost_w)
  # View(names(diss_prepost_w))

# Variablen umbenennen #
## Note: Variablen müssen mit Buchstaben beginnen #
names(diss_prepost_w) <- c("code",
                           "A43_1_1", 
                           "A43_1_10", 
                           "A43_1_11", 
                           "A43_1_12", 
                           "A43_1_13", 
                           "A43_1_14", 
                           "A43_1_15", 
                           "A43_1_16", 
                           "A43_1_17", 
                           "A43_1_18", 
                           "A43_1_2", 
                           "A43_1_3", 
                           "A43_1_4", 
                           "A43_1_5", 
                           "A43_1_6", 
                           "A43_1_7", 
                           "A43_1_8", 
                           "A43_1_9", 
                           "A43_2_1", 
                           "A43_2_10", 
                           "A43_2_11", 
                           "A43_2_12", 
                           "A43_2_13", 
                           "A43_2_14", 
                           "A43_2_15", 
                           "A43_2_2", 
                           "A43_2_3", 
                           "A43_2_4", 
                           "A43_2_5", 
                           "A43_2_6", 
                           "A43_2_7", 
                           "A43_2_8", 
                           "A43_2_9",  
                           "A43_3_1", 
                           "A43_3_10", 
                           "A43_3_11", 
                           "A43_3_12", 
                           "A43_3_2", 
                           "A43_3_3", 
                           "A43_3_4", 
                           "A43_3_5", 
                           "A43_3_6", 
                           "A43_3_7", 
                           "A43_3_8", 
                           "A43_3_9", 
                           "A43_4_1", 
                           "A43_4_10", 
                           "A43_4_11", 
                           "A43_4_12", 
                           "A43_4_13", 
                           "A43_4_2", 
                           "A43_4_3", 
                           "A43_4_4", 
                           "A43_4_5", 
                           "A43_4_6", 
                           "A43_4_7", 
                           "A43_4_8", 
                           "A43_4_9", 
                           "A43_5_1", 
                           "A43_5_10", 
                           "A43_5_2", 
                           "A43_5_3", 
                           "A43_5_4", 
                           "A43_5_5", 
                           "A43_5_6", 
                           "A43_5_7", 
                           "A43_5_8", 
                           "A43_5_9",
                           "A43_7_1", 
                           "A43_7_10", 
                           "A43_7_11", 
                           "A43_7_12", 
                           "A43_7_13", 
                           "A43_7_14", 
                           "A43_7_15", 
                           "A43_7_16", 
                           "A43_7_17", 
                           "A43_7_18", 
                           "A43_7_2", 
                           "A43_7_3", 
                           "A43_7_4", 
                           "A43_7_5", 
                           "A43_7_6", 
                           "A43_7_7", 
                           "A43_7_8", 
                           "A43_7_9")
#   View(names(diss_prepost_w))

# Datensatz mit Korrelaten importieren ####
library(Hmisc)
library(foreign)
diss_prepost_kovar <- spss.get(
                               "data/43_1-7_kovar.sav"
                               , use.value.labels=FALSE
                               )

# Variablen rausschmeißen, die nicht benötigt werden #
  # View(diss_prepost_kovar)
  # View(names(diss_prepost_kovar))

  diss_prepost_kovar <- diss_prepost_kovar[c(
                                               "code"
                                             , "erkennbar43.1.103050.max"
                                             , "theorie.r.43.1"
                                             , "LängeKommentar.43.1"
                                             , "anz.komm.43.1"
                                             , "theorie.r.43.2"
                                             , "LängeKommentar.43.2"
                                             , "anz.komm.43.2"
                                             , "theorie.r.43.7"
                                             , "LängeKommentar.43.7"
                                             , "anz.komm.43.7"
                                             , "erkennbar43.3.103050.max"
                                             , "theorie.r.43.3"
                                             , "LängeKommentar.43.3"
                                             , "anz.komm.43.3"
                                             , "theorie.r.43.4"
                                             , "LängeKommentar.43.4"
                                             , "anz.komm.43.4"
                                             , "theorie.r.43.5"
                                             , "LängeKommentar.43.5"
                                             , "anz.komm.43.5"
                                             , "T1.RefBer2.5"
                                             , "T1.RefBer2.6"
                                             , "T1.RefBer2.7"
                                             , "T1.RefBer2.8"
                                             , "T1.RefBer2.9"
                                             , "T2.RefBer2.5"
                                             , "T2.RefBer2.6"
                                             , "T2.RefBer2.7"
                                             , "T2.RefBer2.8"
                                             , "T2.RefBer2.9"
                                             , "T1.int.1"
                                             , "T1.int.2"
                                             , "T1.int.3"
                                             , "T1.int.4"
                                             , "T1.int.5"
                                             , "T1.int.6"
                                             , "T2.int.1"
                                             , "T2.int.2"
                                             , "T2.int.3"
                                             , "T2.int.4"
                                             , "T2.int.5"
                                             , "T2.int.6"
                                             , "T1.knstr.1"
                                             , "T1.knstr.2"
                                             , "T1.knstr.3"
                                             , "T1.knstr.4"
                                             , "T1.knstr.5"
                                             , "T1.knstr.6"
                                             , "T2.knstr.1"
                                             , "T2.knstr.2"
                                             , "T2.knstr.3"
                                             , "T2.knstr.4"
                                             , "T2.knstr.5"
                                             , "T2.knstr.6"
                                             , "nfc.1"
                                             , "nfc.2"
                                             , "nfc.3u"
                                             , "nfc.4u"
                                             , "nfc.5u"
                                             , "nfc.6u"
                                             , "nfc.7u"
                                             , "nfc.8"
                                             , "nfc.9"
                                             , "nfc.10u"
                                             , "T1.anstrT.1"
                                             , "T1.anstrT.2"
                                             , "T1.anstrT.3"
                                             , "T1.anstrT.4"
                                             , "T2.anstrT.1"
                                             , "T2.anstrT.2"
                                             , "T2.anstrT.3"
                                             , "T2.anstrT.4"
                                             , "alter"
                                             , "geschl.."
                                             , "semester"
                                             , "unterrichtet"
                                             , "T1.theorietexte"
                                             , "T2.theorietexte"
                                             , "T1.wiss.praev.Wert"
                                             , "T1.wiss.bez.Wert"
                                             , "T2.wiss.praev.Wert"
                                             , "T2.wiss.bez.Wert"
                                             , "T1.RefBer1"
                                             , "T1.RefBer2"
                                             , "T1.anstrS"
                                             , "T1.anstrT"
                                             , "T1.knstr"
                                             , "nfc"
                                             , "T1.ind.wert.util"
                                             , "T1.ind.wert.cost"
                                             , "T1.int"
                                             , "T2.RefBer1"
                                             , "T2.RefBer2"
                                             , "T2.anstrS"
                                             , "T2.anstrT"
                                             , "T2.knstr"
                                             , "anwesend"
                                             , "T2.ind.wert.util"
                                             , "T2.ind.wert.cost"
                                             , "T2.int"
                                             , "seminartyp"
                                             , "seminar"
                                             )]


    names(diss_prepost_kovar)[names(diss_prepost_kovar)=="LängeKommentar.43.1"] <- "LaengeKommentar.43.1"
    names(diss_prepost_kovar)[names(diss_prepost_kovar)=="LängeKommentar.43.2"] <- "LaengeKommentar.43.2"
    names(diss_prepost_kovar)[names(diss_prepost_kovar)=="LängeKommentar.43.7"] <- "LaengeKommentar.43.7"
    names(diss_prepost_kovar)[names(diss_prepost_kovar)=="LängeKommentar.43.3"] <- "LaengeKommentar.43.3"
    names(diss_prepost_kovar)[names(diss_prepost_kovar)=="LängeKommentar.43.4"] <- "LaengeKommentar.43.4"
    names(diss_prepost_kovar)[names(diss_prepost_kovar)=="LängeKommentar.43.5"] <- "LaengeKommentar.43.5"
    # View(names(diss_prepost_kovar))


# Variable llm erstellen ####
  # Werte: 0=instruktional, 1= pbl
  diss_prepost_kovar$llm <- ifelse(c(diss_prepost_kovar$seminartyp == 4 | diss_prepost_kovar$seminartyp == 2), 0, 1)

  diss_prepost_kovar$llm <- factor(diss_prepost_kovar$llm, levels = c(0,1))

  #   summary(diss_prepost_w_kovar$llm)

# Variable medium erstellen ####
  # Werte: 0=text, 1=video
  diss_prepost_kovar$medium <- ifelse(c(diss_prepost_kovar$seminartyp == 1 | diss_prepost_kovar$seminartyp == 2), 1, 0)

  diss_prepost_kovar$medium <- factor(diss_prepost_kovar$medium, levels = c(0,1))
    # summary(diss_prepost_kovar$medium)


# Gesamtdatensatz mit Kovariaten ####
  diss_prepost_w_kovar <- merge(diss_prepost_w, diss_prepost_kovar)
  
  #für weitere Analysen muss $llm und $medium numeric sein
  #allerdings wandelt R 0er in 1er und 1er in 2er um -> Korrektur
  diss_prepost_w_kovar$llm <- as.numeric(diss_prepost_w_kovar$llm)
  diss_prepost_w_kovar$llm[diss_prepost_w_kovar$llm==1] <- 0
  diss_prepost_w_kovar$llm[diss_prepost_w_kovar$llm==2] <- 1
  diss_prepost_w_kovar$medium <- as.numeric(diss_prepost_w_kovar$medium)
  diss_prepost_w_kovar$medium[diss_prepost_w_kovar$medium==1] <- 0
  diss_prepost_w_kovar$medium[diss_prepost_w_kovar$medium==2] <- 1
  #   View(names(diss_prepost_w_kovar))


# add variable doz_pass ####
  #   View(as.data.frame(table(diss_prepost_w_kovar$seminar)))
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==1] <- 6
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==2] <- 6
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==3] <- 6
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==4] <- 2
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==5] <- 3
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==6] <- 3
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==7] <- 6
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==8] <- 6
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==9] <- 2
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==10] <- 4
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==11] <- 2
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==12] <- 4
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==13] <- 6
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==14] <- 2
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==15] <- 6
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==16] <- 5
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==17] <- 6
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==18] <- 6
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==19] <- 6
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==20] <- 3
  diss_prepost_w_kovar$doz_pass[diss_prepost_w_kovar$seminar==21] <- 4

# add variable doz_gef ####
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==1] <- 6
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==2] <- 6
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==3] <- 6
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==4] <- 2
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==5] <- 2
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==6] <- 2
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==7] <- 6
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==8] <- 6
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==9] <- 4
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==10] <- 3
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==11] <- 1
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==12] <- 4
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==13] <- 6
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==14] <- 2
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==15] <- 6
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==16] <- 5
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==17] <- 5
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==18] <- 5
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==19] <- 5
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==20] <- 3
  diss_prepost_w_kovar$doz_gef[diss_prepost_w_kovar$seminar==21] <- 2
  
  #   summary(diss_prepost_w_kovar$seminar)
  #   summary(diss_prepost_w_kovar$doz_pass)
  #   summary(diss_prepost_w_kovar$doz_gef)


# Skalenbildung der Variablen Analyse (Sequenzen 1,2,7,3,4,5) ####
  diss_prepost_w_kovar_analy <- diss_prepost_w_kovar

  # Skala Analyse 43_1 #
  diss_prepost_w_kovar_analy$A43_1 <- rowMeans(diss_prepost_w_kovar_analy[c(
                                                                          "A43_1_1" 
                                                                          ,"A43_1_10"
                                                                          ,"A43_1_11" 
                                                                          ,"A43_1_12" 
                                                                          ,"A43_1_13" 
                                                                          ,"A43_1_14" 
                                                                          ,"A43_1_15" 
                                                                          ,"A43_1_16" 
                                                                          ,"A43_1_17" 
                                                                          ,"A43_1_18" 
                                                                          ,"A43_1_2" 
                                                                          ,"A43_1_3" 
                                                                          ,"A43_1_4" 
                                                                          ,"A43_1_5" 
                                                                          ,"A43_1_6" 
                                                                          ,"A43_1_7" 
                                                                          ,"A43_1_8" 
                                                                          ,"A43_1_9"
                                                                        )]
                                           , na.rm=TRUE
                                           )



  # Skala Analyse 43_2 #
  diss_prepost_w_kovar_analy$A43_2 <- rowMeans(diss_prepost_w_kovar_analy[c(
                                                                          "A43_2_1" 
                                                                          ,"A43_2_10"
                                                                          ,"A43_2_11" 
                                                                          ,"A43_2_12" 
                                                                          ,"A43_2_13" 
                                                                          ,"A43_2_14" 
                                                                          ,"A43_2_15" 
                                                                          ,"A43_2_2" 
                                                                          ,"A43_2_3" 
                                                                          ,"A43_2_4" 
                                                                          ,"A43_2_5" 
                                                                          ,"A43_2_6" 
                                                                          ,"A43_2_7" 
                                                                          ,"A43_2_8" 
                                                                          ,"A43_2_9"
                                                                        )]
                                           , na.rm=TRUE
                                           )



  # Skala Analyse 43_7 #
  diss_prepost_w_kovar_analy$A43_7 <- rowMeans(diss_prepost_w_kovar_analy[c(
                                                                          "A43_7_1" 
                                                                          ,"A43_7_10"
                                                                          ,"A43_7_11" 
                                                                          ,"A43_7_12" 
                                                                          ,"A43_7_13" 
                                                                          ,"A43_7_14" 
                                                                          ,"A43_7_15" 
                                                                          ,"A43_7_16" 
                                                                          ,"A43_7_17" 
                                                                          ,"A43_7_18" 
                                                                          ,"A43_7_2" 
                                                                          ,"A43_7_3" 
                                                                          ,"A43_7_4" 
                                                                          ,"A43_7_5" 
                                                                          ,"A43_7_6" 
                                                                          ,"A43_7_7" 
                                                                          ,"A43_7_8" 
                                                                          ,"A43_7_9"
                                                                        )]
                                           , na.rm=TRUE
                                           )



  # Skala Analyse 43_3 #
  diss_prepost_w_kovar_analy$A43_3 <- rowMeans(diss_prepost_w_kovar_analy[c(
                                                                          "A43_3_1" 
                                                                          ,"A43_3_10"
                                                                          ,"A43_3_11" 
                                                                          ,"A43_3_12" 
                                                                          ,"A43_3_2" 
                                                                          ,"A43_3_3" 
                                                                          ,"A43_3_4" 
                                                                          ,"A43_3_5" 
                                                                          ,"A43_3_6" 
                                                                          ,"A43_3_7" 
                                                                          ,"A43_3_8" 
                                                                          ,"A43_3_9"
                                                                        )]
                                           , na.rm=TRUE
                                           )



  # Skala Analyse 43_4 #
  diss_prepost_w_kovar_analy$A43_4 <- rowMeans(diss_prepost_w_kovar_analy[c(
                                                                          "A43_4_1" 
                                                                          ,"A43_4_10"
                                                                          ,"A43_4_11" 
                                                                          ,"A43_4_12" 
                                                                          ,"A43_4_13"  
                                                                          ,"A43_4_2" 
                                                                          ,"A43_4_3" 
                                                                          ,"A43_4_4" 
                                                                          ,"A43_4_5" 
                                                                          ,"A43_4_6" 
                                                                          ,"A43_4_7" 
                                                                          ,"A43_4_8" 
                                                                          ,"A43_4_9"
                                                                        )]
                                           , na.rm=TRUE
                                           )



  # Skala Analyse 43_5 #
  diss_prepost_w_kovar_analy$A43_5 <- rowMeans(diss_prepost_w_kovar_analy[c(
                                                                          "A43_5_1" 
                                                                          ,"A43_5_10"
                                                                          ,"A43_5_2" 
                                                                          ,"A43_5_3" 
                                                                          ,"A43_5_4" 
                                                                          ,"A43_5_5" 
                                                                          ,"A43_5_6" 
                                                                          ,"A43_5_7" 
                                                                          ,"A43_5_8" 
                                                                          ,"A43_5_9"
                                                                        )]
                                           , na.rm=TRUE
                                           )


# Anzahl Kommentare Pretest + Posttest, Länge des Kommentars Pretest + Posttest erstellen ####
diss_prepost_w_kovar_analy <- diss_prepost_w_kovar_analy %>%
  mutate(anz_T1 = rowMeans(data.frame(anz.komm.43.1, anz.komm.43.2, anz.komm.43.7), na.rm=TRUE),
         anz_T2 = rowMeans(data.frame(anz.komm.43.3, anz.komm.43.4, anz.komm.43.5), na.rm=TRUE),
         laeng_T1 = rowMeans(data.frame(LaengeKommentar.43.1, LaengeKommentar.43.2, LaengeKommentar.43.7), na.rm=TRUE),
         laeng_T2 = rowMeans(data.frame(LaengeKommentar.43.3, LaengeKommentar.43.4, LaengeKommentar.43.5), na.rm=TRUE))



# zentrierte Variable "anwesend_z" erstellen ####
anwesend_MEAN <- diss_prepost_w_kovar_analy %>%
                      summarize(anwesend_M = mean(anwesend, na.rm=TRUE))

diss_prepost_w_kovar_analy <- diss_prepost_w_kovar_analy %>%
                                    mutate(anwesend_z = anwesend-anwesend_MEAN[1,1])



# temporäre Datensätze aus Environment löschen ####
  remove(diss_prepost, diss_prepost_w, diss_prepost_kovar, diss_prepost_w_kovar, anwesend_MEAN)
  
