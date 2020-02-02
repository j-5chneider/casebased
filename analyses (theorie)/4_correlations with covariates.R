# corr Theorie 43_3 mit Kovariaten ####
library(corrgram)
corr_data43_3 <- diss_prepost_w_kovar_analy[c("theorie.r.43.3"
                                              , "anz.komm.43.3"
                                              , "LaengeKommentar.43.3"
                                              , "semester"
                                              , "unterrichtet"
                                              , "T2.theorietexte"
                                              , "T2.wiss.praev.Wert"
                                              , "T2.wiss.bez.Wert"
                                              , "nfc", "T2.RefBer1"
                                              , "T2.RefBer2"
                                              , "T2.anstrS"
                                              , "T2.anstrT"
                                              , "T2.knstr"
                                              , "anwesend"
                                              , "T2.ind.wert.util"
                                              , "T2.ind.wert.cost"
                                              , "T2.int")]

corrgram(corr_data43_3, lower.panel=panel.pie, upper.panel=panel.conf, diag.panel=panel.density)
remove(corr_data43_3)

# corr Theorie 43_4 mit Kovariaten ####
corr_data43_4 <- diss_prepost_w_kovar_analy[c("theorie.r.43.4"
                                              , "anz.komm.43.4"
                                              , "LaengeKommentar.43.4"
                                              , "semester"
                                              , "unterrichtet"
                                              , "T2.theorietexte"
                                              , "T2.wiss.praev.Wert"
                                              , "T2.wiss.bez.Wert"
                                              , "nfc"
                                              , "T2.RefBer1"
                                              , "T2.RefBer2"
                                              , "T2.anstrS"
                                              , "T2.anstrT"
                                              , "T2.knstr"
                                              , "anwesend"
                                              , "T2.ind.wert.util"
                                              , "T2.ind.wert.cost"
                                              , "T2.int")]

corrgram(corr_data43_4, lower.panel=panel.pie, upper.panel=panel.conf, diag.panel=panel.density)
remove(corr_data43_4)

# corr Theorie 43_5 mit Kovariaten ####
corr_data43_5 <- diss_prepost_w_kovar_analy[c("theorie.r.43.5"
                                              , "anz.komm.43.5"
                                              , "LaengeKommentar.43.5"
                                              , "semester"
                                              , "unterrichtet"
                                              , "T2.theorietexte"
                                              , "T2.wiss.praev.Wert"
                                              , "T2.wiss.bez.Wert"
                                              , "nfc"
                                              , "T2.RefBer1"
                                              , "T2.RefBer2"
                                              , "T2.anstrS"
                                              , "T2.anstrT"
                                              , "T2.knstr"
                                              , "anwesend"
                                              , "T2.ind.wert.util"
                                              , "T2.ind.wert.cost"
                                              , "T2.int")]

corrgram(corr_data43_5, lower.panel=panel.pie, upper.panel=panel.conf, diag.panel=panel.density)
remove(corr_data43_5)