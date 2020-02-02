# export data in dat: analyse ####
write.table(diss_prepost_w_kovar_analy[137:146]
            , file="export/diss_prepost_w_kovar_analy.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
            )

# export data in dat: LLM + theorie ####
diss_prepost_w_kovar_analy_theorie <- diss_prepost_w_kovar_analy[c("seminar"
                                                                 , "llm"
                                                                 , "doz_pass"
                                                                 , "doz_gef"
                                                                 , "theorie.r.43.1"
                                                                 , "theorie.r.43.2"
                                                                 , "theorie.r.43.7"
                                                                 , "theorie.r.43.3"
                                                                 , "theorie.r.43.4"
                                                                 , "theorie.r.43.5")
                                                                 ]

write.table(diss_prepost_w_kovar_analy_theorie
            , file="export/diss_prepost_w_kovar_theorie.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
            )

remove(diss_prepost_w_kovar_analy_theorie)

# export data in dat: LLM + theorie + Kovariaten ####
diss_prepost_w_kovar_analy_theorie_kovar <- diss_prepost_w_kovar_analy[c("seminar"
                                                                   , "llm"
                                                                   , "doz_pass"
                                                                   , "doz_gef"
                                                                   , "theorie.r.43.1"
                                                                   , "theorie.r.43.2"
                                                                   , "theorie.r.43.7"
                                                                   , "theorie.r.43.3"
                                                                   , "theorie.r.43.4"
                                                                   , "theorie.r.43.5"
                                                                   , "T2.theorietexte"
                                                                   , "T2.anstrT"
                                                                   , "anwesend"
                                                                   , "T2.int"
                                                                   , "anz.komm.43.3"
                                                                   , "anz.komm.43.4"
                                                                   , "anz.komm.43.5"
                                                                   , "LaengeKommentar.43.3"
                                                                   , "LaengeKommentar.43.4"
                                                                   , "LaengeKommentar.43.5")
                                                                 ]
write.table(diss_prepost_w_kovar_analy_theorie_kovar
            , file="export/diss_prepost_w_kovar_theorie_kovar.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
            )

remove(diss_prepost_w_kovar_analy_theorie_kovar)


# export data in dat: LLM + theorie + Kovariaten. Dummy-coded: anwesend, T2.theorietexte, doz_gef ####
diss_prepost_w_kovar_analy_theorie_kovar_dummy <- diss_prepost_w_kovar_analy[c("seminar"
                                                                             , "llm"
                                                                             , "doz_pass"
                                                                             , "doz_gef"
                                                                             , "theorie.r.43.1"
                                                                             , "theorie.r.43.2"
                                                                             , "theorie.r.43.7"
                                                                             , "theorie.r.43.3"
                                                                             , "theorie.r.43.4"
                                                                             , "theorie.r.43.5"
                                                                             , "T2.theorietexte"
                                                                             , "T2.anstrT"
                                                                             , "anwesend"
                                                                             , "T2.int"
                                                                             , "anz.komm.43.3"
                                                                             , "anz.komm.43.4"
                                                                             , "anz.komm.43.5"
                                                                             , "LaengeKommentar.43.3"
                                                                             , "LaengeKommentar.43.4"
                                                                             , "LaengeKommentar.43.5")
                                                                             ]
  # doz_gef in dummy. Scale from 1-6. Coding: 1-3=0, 4-6=1, NA=NA.
  summary(diss_prepost_w_kovar_analy_theorie_kovar_dummy$doz_gef)
  table(diss_prepost_w_kovar_analy_theorie_kovar_dummy$doz_gef)
  diss_prepost_w_kovar_analy_theorie_kovar_dummy$doz_gef <- ifelse(diss_prepost_w_kovar_analy_theorie_kovar_dummy$doz_gef < 4, 0, 1)

  # anwesend in dummy version 2. Scale from 0-2. Coding: 0-1=0, 2=1, NA=NA.
  summary(diss_prepost_w_kovar_analy_theorie_kovar_dummy$anwesend2)
  table(diss_prepost_w_kovar_analy_theorie_kovar_dummy$anwesend2)
  diss_prepost_w_kovar_analy_theorie_kovar_dummy$anwesend2 <- ifelse(diss_prepost_w_kovar_analy_theorie_kovar_dummy$anwesend < 2, 0, 1)

  # anwesend in dummy. Scale from 0-2. Coding: 0=0, 1-2=1, NA=NA.
  summary(diss_prepost_w_kovar_analy_theorie_kovar_dummy$anwesend)
  table(diss_prepost_w_kovar_analy_theorie_kovar_dummy$anwesend)
  diss_prepost_w_kovar_analy_theorie_kovar_dummy$anwesend <- ifelse(diss_prepost_w_kovar_analy_theorie_kovar_dummy$anwesend < 1, 0, 1)

  # T2.theorietexte in dummy. Scale from 0-3. Coding: 0=0, 1-3=1, NA=NA.
  summary(diss_prepost_w_kovar_analy_theorie_kovar_dummy$T2.theorietexte)
  table(diss_prepost_w_kovar_analy_theorie_kovar_dummy$T2.theorietexte)
  diss_prepost_w_kovar_analy_theorie_kovar_dummy$T2.theorietexte <- ifelse(diss_prepost_w_kovar_analy_theorie_kovar_dummy$T2.theorietexte < 1, 0, 1)



write.table(diss_prepost_w_kovar_analy_theorie_kovar_dummy
            , file="export/diss_prepost_w_kovar_theorie_kovar_dummy.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
            )

remove(diss_prepost_w_kovar_analy_theorie_kovar_dummy)



# export data in dat: LLM + analyse + theorie + Kovariaten ####
 # View(names(diss_prepost_w_kovar_analy))
tmp <- diss_prepost_w_kovar_analy[c("semester"
                                  , "seminar"
                                  , "llm"
                                  , "doz_gef"
                                  , "A43_1"
                                  , "A43_2"
                                  , "A43_7"
                                  , "A43_3"
                                  , "A43_4"
                                  , "A43_5"
                                  , "theorie.r.43.1"
                                  , "theorie.r.43.2"
                                  , "theorie.r.43.7"
                                  , "theorie.r.43.3"
                                  , "theorie.r.43.4"
                                  , "theorie.r.43.5"
                                  , "anwesend"
                                  , "anz.komm.43.3"
                                  , "anz.komm.43.4"
                                  , "anz.komm.43.5"
                                  , "T2.RefBer2.5"
                                  , "T2.RefBer2.6"
                                  , "T2.RefBer2.7"
                                  , "T2.RefBer2.8"
                                  , "T2.RefBer2.9"
                                  , "T2.int.1"
                                  , "T2.int.2"
                                  , "T2.int.3"
                                  , "T2.int.4"
                                  , "T2.int.5"
                                  , "T2.int.6"
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
                                  , "T2.anstrT.1"
                                  , "T2.anstrT.2"
                                  , "T2.anstrT.3"
                                  , "T2.anstrT.4"
                                  )
                                 ]


write.table(tmp
            , file="export/diss_prepost_w_analyse_kovar.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
            )

remove(tmp)



# export data in dat: LLM + analyse + theorie + Kovariaten T1 & T2 ####
 # View(names(diss_prepost_w_kovar_analy))
tmp <- diss_prepost_w_kovar_analy[c("semester"
                                  , "seminar"
                                  , "llm"
                                  , "doz_gef"
                                  , "A43_1"
                                  , "A43_2"
                                  , "A43_7"
                                  , "A43_3"
                                  , "A43_4"
                                  , "A43_5"
                                  , "theorie.r.43.1"
                                  , "theorie.r.43.2"
                                  , "theorie.r.43.7"
                                  , "theorie.r.43.3"
                                  , "theorie.r.43.4"
                                  , "theorie.r.43.5"
                                  , "anwesend"
                                  , "anz.komm.43.1"
                                  , "anz.komm.43.2"
                                  , "anz.komm.43.7"
                                  , "anz.komm.43.3"
                                  , "anz.komm.43.4"
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
                                  , "T2.theorietexte"
                                  )
                                 ]


write.table(tmp
            , file="export/2014_11_27_diss_prepost_w_analyse_kovarT1T2.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
            )

remove(tmp)


# export data in dat: LLM + analyse + theorie + Kovariaten T1 & T2 + Interaktion DUMMIES anwesend*pb anwesend*di ####
 # View(names(diss_prepost_w_kovar_analy))
tmp <- diss_prepost_w_kovar_analy[c("semester"
                                  , "seminar"
                                  , "llm"
                                  , "doz_gef"
                                  , "A43_1"
                                  , "A43_2"
                                  , "A43_7"
                                  , "A43_3"
                                  , "A43_4"
                                  , "A43_5"
                                  , "theorie.r.43.1"
                                  , "theorie.r.43.2"
                                  , "theorie.r.43.7"
                                  , "theorie.r.43.3"
                                  , "theorie.r.43.4"
                                  , "theorie.r.43.5"
                                  , "anwesend"
                                  , "anz.komm.43.1"
                                  , "anz.komm.43.2"
                                  , "anz.komm.43.7"
                                  , "anz.komm.43.3"
                                  , "anz.komm.43.4"
                                  , "anz.komm.43.5"
                                  , "T2.theorietexte"
                                  )
                                 ]

 #Berechnung Interaktion
 tmp$DI <- ifelse(tmp$llm==0, 1, 0)
 tmp$PB <- tmp$llm
 tmp$DI_anw <- tmp$DI*tmp$anwesend
 tmp$PB_anw <- tmp$PB*tmp$anwesend


write.table(tmp
            , file="export/2015_02_06_diss_prepost_w_analyse_kovarT1T2.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
            )

remove(tmp)


# export data in dat: MEDIUM + analyse + theorie + Kovariaten T1 & T2 ####
 # View(names(diss_prepost_w_kovar_analy))
tmp <- diss_prepost_w_kovar_analy[c("semester"
                                  , "seminar"
                                  , "medium"
                                  , "doz_gef"
                                  , "A43_1"
                                  , "A43_2"
                                  , "A43_7"
                                  , "A43_3"
                                  , "A43_4"
                                  , "A43_5"
                                  , "theorie.r.43.1"
                                  , "theorie.r.43.2"
                                  , "theorie.r.43.7"
                                  , "theorie.r.43.3"
                                  , "theorie.r.43.4"
                                  , "theorie.r.43.5"
                                  , "anwesend"
                                  , "anz.komm.43.1"
                                  , "anz.komm.43.2"
                                  , "anz.komm.43.7"
                                  , "anz.komm.43.3"
                                  , "anz.komm.43.4"
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
                                  , "T2.theorietexte"
                                  )
                                 ]


write.table(tmp
            , file="export/2015_01_08_diss_prepost_w_analyse_kovarT1T2_MEDIUM.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
            )

remove(tmp)


# export data in dat: MEDIUM + analyse + theorie T1 & T2 + anwesend (zentriert), doz_gef, gelesene Literatur ####
# View(names(diss_prepost_w_kovar_analy))
tmp <- diss_prepost_w_kovar_analy[c(  "seminar"
                                    , "medium"
                                    , "doz_gef"
                                    , "A43_1"
                                    , "A43_2"
                                    , "A43_7"
                                    , "A43_3"
                                    , "A43_4"
                                    , "A43_5"
                                    , "theorie.r.43.1"
                                    , "theorie.r.43.2"
                                    , "theorie.r.43.7"
                                    , "theorie.r.43.3"
                                    , "theorie.r.43.4"
                                    , "theorie.r.43.5"
                                    , "anwesend_z"
                                    , "anz.komm.43.1"
                                    , "anz.komm.43.2"
                                    , "anz.komm.43.7"
                                    , "anz.komm.43.3"
                                    , "anz.komm.43.4"
                                    , "anz.komm.43.5"
                                    , "T2.theorietexte"
)
]


write.table(tmp
            , file="export/2015_01_08_diss_prepost_w_analyse_kovar(zentriert)T1T2_MEDIUM.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
)

remove(tmp)


# export data in dat: MEDIUM + analyse + theorie T1 & T2 + anwesend (zentriert), doz_gef, doz_pass, gelesene Literatur ####
tmp <- diss_prepost_w_kovar_analy
tmp <- tmp[c(  "seminar"
               , "medium"
               , "doz_gef"
               , "doz_pass"
               , "A43_1"
               , "A43_2"
               , "A43_7"
               , "A43_3"
               , "A43_4"
               , "A43_5"
               , "theorie.r.43.1"
               , "theorie.r.43.2"
               , "theorie.r.43.7"
               , "theorie.r.43.3"
               , "theorie.r.43.4"
               , "theorie.r.43.5"
               , "anwesend_z"
               , "anz.komm.43.1"
               , "anz.komm.43.2"
               , "anz.komm.43.7"
               , "anz.komm.43.3"
               , "anz.komm.43.4"
               , "anz.komm.43.5"
               , "T2.theorietexte"
)
]


write.table(tmp
            , file="export/2015_01_08_diss_prepost_w_analyse_anwesend(zentriert)_dozEinst(latent)_T1T2_MEDIUM.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
)

remove(tmp)


# export data in dat: LLM + Medium + analyse + theorie + Anzahl + Kovariaten T1 & T2 ####
 # View(names(diss_prepost_w_kovar_analy))
tmp <- diss_prepost_w_kovar_analy[c("seminar"
                                  , "llm"
                                  , "medium"
                                  , "doz_gef"
                                  , "A43_1"
                                  , "A43_2"
                                  , "A43_7"
                                  , "A43_3"
                                  , "A43_4"
                                  , "A43_5"
                                  , "theorie.r.43.1"
                                  , "theorie.r.43.2"
                                  , "theorie.r.43.7"
                                  , "theorie.r.43.3"
                                  , "theorie.r.43.4"
                                  , "theorie.r.43.5"
                                  , "anwesend"
                                  , "anz.komm.43.1"
                                  , "anz.komm.43.2"
                                  , "anz.komm.43.7"
                                  , "anz.komm.43.3"
                                  , "anz.komm.43.4"
                                  , "anz.komm.43.5"
                                  , "T2.theorietexte"
                                  )
                                 ]

write.table(tmp
            , file="export/2015_02_10_diss_prepost_w_analyse_kovarT1T2_llm+medium.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
            )

remove(tmp)



# export data in dat: LLM + analyse + theorie T1 & T2 + anwesend (zentriert), doz_gef, doz_pass, gelesene Literatur, Begleitfragebogen ####
tmp <- diss_prepost_begleit
tmp <- tmp[c(  "seminar"
               , "llm"
               , "doz_gef"
               , "doz_pass"
               , "A43_1"
               , "A43_2"
               , "A43_7"
               , "A43_3"
               , "A43_4"
               , "A43_5"
               , "theorie.r.43.1"
               , "theorie.r.43.2"
               , "theorie.r.43.7"
               , "theorie.r.43.3"
               , "theorie.r.43.4"
               , "theorie.r.43.5"
               , "anwesend_z"
               , "anz.komm.43.1"
               , "anz.komm.43.2"
               , "anz.komm.43.7"
               , "anz.komm.43.3"
               , "anz.komm.43.4"
               , "anz.komm.43.5"
               , "T2.theorietexte"
               , "coglo1.b1"
               , "coglo2.b1"
               , "coglo3.b1"
               , "coglo4.b1"
               , "coglo5.b1"
               , "coglo1.b3"
               , "coglo2.b3"
               , "coglo3.b3"
               , "coglo4.b3"
               , "coglo5.b3"
               , "grund1.b1"
               , "grund2.b1"
               , "grund3.b1"
               , "grund1.b3"
               , "grund2.b3"
               , "grund3.b3"
               , "mot1.b1"
               , "mot2.b1"
               , "mot3.b1.u"
               , "mot4.b1.u"
               , "mot5.b1"
               , "mot6.b1"
               , "mot7.b1.u"
               , "mot8.b1"
               , "mot9.b1"
               , "mot10.b1.u"
               , "mot11.b1.u"
               , "mot12.b1"
               , "mot13.b1.u"
               , "mot14.b1"
               , "mot1.b3"
               , "mot2.b3"
               , "mot3.b3.u"
               , "mot4.b3.u"
               , "mot5.b3"
               , "mot6.b3"
               , "mot7.b3.u"
               , "mot8.b3"
               , "mot9.b3"
               , "mot10.b3.u"
               , "mot11.b3.u"
               , "mot12.b3"
               , "mot13.b3.u"
               , "mot14.b3"
               )
              ]


write.table(tmp
            , file="export/2015_01_08_diss_prepost_w_analyse_anwesend(zentriert)_dozEinst(latent)_T1T2_Begleitfr_LLM.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
            )

remove(tmp)

# Export for Latent Class Analysis in MPlus ####
tmp <- diss_raw
tmp$code_num <- as.numeric(as.factor(tmp$code))
tmp$code_num <- as.factor(tmp$code_num)
tmp$code_num[tmp$code_num == 1] <- NA

tmp <- tmp[c("code_num",
             "Beschreibung",
             "Handlung",
             "Alternative",
             "Beweise.01",
             "Entscheidung.01"
             )
           ]

write.table(tmp
            , file="export/LCA_MPlus.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
            )

rm(tmp)

# Export for Latent Class Analysis in MPlus ####
# Pretest #
tmp <- diss_raw
tmp$code_num <- as.numeric(as.factor(tmp$code))
tmp$code_num <- as.factor(tmp$code_num)
tmp$code_num[tmp$code_num == 1] <- NA

tmp <- filter(tmp, c(seq==1 | seq==2 | seq==7))

tmp <- tmp[c("code_num",
             "Beschreibung",
             "Handlung",
             "Alternative",
             "Beweise.01",
             "Entscheidung.01"
)
]

write.table(tmp
            , file="export/LCA_MPlus_Pretest.dat"
            , row.names=FALSE
            , col.names=FALSE
            , sep="\t"
            , dec="."
            , na="-99"
            , quote=FALSE
)

rm(tmp)


# Export for Latent Class Analysis in MPlus ####
# Posttest #
  tmp <- diss_raw
  tmp$code_num <- as.numeric(as.factor(tmp$code))
  tmp$code_num <- as.factor(tmp$code_num)
  tmp$code_num[tmp$code_num == 1] <- NA
  
  tmp <- filter(tmp, c(seq==3 | seq==4 | seq==5))
  
  tmp <- tmp[c("code_num",
               "Beschreibung",
               "Handlung",
               "Alternative",
               "Beweise.01",
               "Entscheidung.01"
  )
  ]
  
  write.table(tmp
              , file="export/LCA_MPlus_Posttest.dat"
              , row.names=FALSE
              , col.names=FALSE
              , sep="\t"
              , dec="."
              , na="-99"
              , quote=FALSE
  )
  
  rm(tmp)


# Export for Latent Class Analysis in MPlus with Covariate "Measurement time"####
  tmp <- diss_raw
  tmp$code_num <- as.numeric(as.factor(tmp$code))
  tmp$code_num <- as.factor(tmp$code_num)
  tmp$code_num[tmp$code_num == 1] <- NA
  
  tmp <- tmp %>%
            mutate(messz = ifelse(seq== 1 | seq== 2 | seq==7, 0,1))
  
  tmp <- tmp[c("code_num",
               "Beschreibung",
               "Handlung",
               "Alternative",
               "Beweise.01",
               "Entscheidung.01",
               "messz"
  )
  ]
  
  write.table(tmp
              , file="export/LCA_MPlus_Covariate.dat"
              , row.names=FALSE
              , col.names=FALSE
              , sep="\t"
              , dec="."
              , na="-99"
              , quote=FALSE
  )
  
  rm(tmp)

# Export for Latent Class Analysis in MPlus with Covariate "Measurement time" and Treatment LLM####
  tmp <- diss_raw
  tmp$code_num <- as.numeric(as.factor(tmp$code))
  tmp$code_num <- as.factor(tmp$code_num)
  tmp$code_num[tmp$code_num == 1] <- NA
  
  tmp <- tmp %>%
    mutate(messz = ifelse(seq== 1 | seq== 2 | seq==7, 0, 1),
           pbl   = ifelse(seminartyp == 4 | seminartyp == 2, 0, 1)
           ) 
  
 
  tmp <- tmp[c("code_num",
               "Beschreibung",
               "Handlung",
               "Alternative",
               "Beweise.01",
               "Entscheidung.01",
               "messz",
               "pbl"
  )
  ]
  
  write.table(tmp
              , file="export/LCA_MPlus_Covariate_treat.dat"
              , row.names=FALSE
              , col.names=FALSE
              , sep="\t"
              , dec="."
              , na="-99"
              , quote=FALSE
  )
  
  rm(tmp)
  

  
# Export for Latent Class Analysis in MPlus with Covariate "Measurement time" and Treatment Medium####
  tmp <- diss_raw
  tmp$code_num <- as.numeric(as.factor(tmp$code))
  tmp$code_num <- as.factor(tmp$code_num)
  tmp$code_num[tmp$code_num == 1] <- NA
  
  tmp <- tmp %>%
    mutate(messz  = ifelse(seq== 1 | seq== 2 | seq==7, 0, 1),
           medium = ifelse(seminartyp == 1 | seminartyp == 2, 1, 0)
           ) 
  
 
  tmp <- tmp[c("code_num",
               "Beschreibung",
               "Handlung",
               "Alternative",
               "Beweise.01",
               "Entscheidung.01",
               "messz",
               "medium"
  )
  ]
  
  write.table(tmp
              , file="export/LCA_MPlus_Covariate_treatMed.dat"
              , row.names=FALSE
              , col.names=FALSE
              , sep="\t"
              , dec="."
              , na="-99"
              , quote=FALSE
  )
  
  rm(tmp)
  
  
  
  
  
  
write.table(diss_prepost_w_kovar_analy
              , file="export/beispielschneider.csv"
              , row.names=FALSE
              , col.names=TRUE
              , sep=";"
              , dec=","
              , na="-99"
              , quote=FALSE
  )