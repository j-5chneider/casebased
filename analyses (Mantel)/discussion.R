library(dplyr)
glimpse(diss_prepost_w_kovar_analy)

library(lavaan)

# Veränderung Interesse in CRM
model <- ' i =~ lambd0*T1.int.1
              + lambd1*T1.int.2
              + lambd2*T1.int.3
              + lambd3*T1.int.4
              + lambd4*T1.int.5
              + lambd5*T1.int.6
              + lambd0*T2.int.1
              + lambd1*T2.int.2
              + lambd2*T2.int.3
              + lambd3*T2.int.4
              + lambd4*T2.int.5
              + lambd5*T2.int.6

           s =~ lambd0*T2.int.1
              + lambd1*T2.int.2
              + lambd2*T2.int.3
              + lambd3*T2.int.4
              + lambd4*T2.int.5
              + lambd5*T2.int.6


'

fit <- growth(model, data=diss_prepost_w_kovar_analy)
summary(fit, fit.measures=TRUE)


# Veränderung Anstrengungsbereitschaft
model <- ' i =~ lambd0*T1.anstrT.1
              + lambd1*T1.anstrT.2
              + lambd2*T1.anstrT.3
              + lambd3*T1.anstrT.4
              + lambd0*T2.anstrT.1
              + lambd1*T2.anstrT.2
              + lambd2*T2.anstrT.3
              + lambd3*T2.anstrT.4

           s =~ lambd0*T2.anstrT.1
              + lambd1*T2.anstrT.2
              + lambd2*T2.anstrT.3
              + lambd3*T2.anstrT.4


'

fit <- growth(model, data=diss_prepost_w_kovar_analy)
summary(fit, fit.measures=TRUE)


# Veränderung Anstrengungsbereitschaft
model <- ' i =~ lambd0*T1.RefBer2.5
              + lambd1*T1.RefBer2.6
              + lambd2*T1.RefBer2.7
              + lambd3*T1.RefBer2.8
              + lambd4*T1.RefBer2.9
              + lambd0*T2.RefBer2.5
              + lambd1*T2.RefBer2.6
              + lambd2*T2.RefBer2.7
              + lambd3*T2.RefBer2.8
              + lambd4*T2.RefBer2.9

           s =~ lambd0*T2.RefBer2.5
              + lambd1*T2.RefBer2.6
              + lambd2*T2.RefBer2.7
              + lambd3*T2.RefBer2.8
              + lambd4*T2.RefBer2.9


'

fit <- growth(model, data=diss_prepost_w_kovar_analy)
summary(fit, fit.measures=TRUE)


# Unterschied in Länge der Analysen: Pre vs. Post
t.test(diss_prepost_w_kovar_analy$laeng_T1, diss_prepost_w_kovar_analy$laeng_T2, paired=TRUE)
summary(diss_prepost_w_kovar_analy$laeng_T1)
summary(diss_prepost_w_kovar_analy$laeng_T2)


# Unterschied in Erkennbarkeit der Analysen: Pre vs. Post
t.test(diss_prepost_w_kovar_analy$erkennbar43.1.103050.max, diss_prepost_w_kovar_analy$erkennbar43.3.103050.max, paired=TRUE)
summary(diss_prepost_w_kovar_analy$erkennbar43.1.103050.max)
summary(diss_prepost_w_kovar_analy$erkennbar43.3.103050.max)


# Unterschied in Wissenstest LLM
t.test(diss_prepost_w_kovar_analy$T2.wiss.bez.Wert~diss_prepost_w_kovar_analy$llm)
t.test(diss_prepost_w_kovar_analy$T2.wiss.praev.Wert~diss_prepost_w_kovar_analy$llm)

# Unterschied in Wissenstest Medium
t.test(diss_prepost_w_kovar_analy$T2.wiss.bez.Wert~diss_prepost_w_kovar_analy$medium)
t.test(diss_prepost_w_kovar_analy$T2.wiss.praev.Wert~diss_prepost_w_kovar_analy$medium)


# Korrelation Einstellung Dozierende x Variablen bei Fallarbeit B1, B3 ####
# Korrelation mit Emotion #
library(Hmisc)
library(foreign)
diss_marcus_tmp <- spss.get("data/Marcus_Gesamtdatensatz [nur Skalen, unbereinigt].sav", use.value.labels=FALSE)
is.na(diss_marcus_tmp) <- diss_marcus_tmp == "-99"
diss_marcus_tmp <- tbl_df(diss_marcus_tmp)
diss_marcus_tmp <- diss_marcus_tmp[c(
"code",
"emof.freude.b1" ,
"emof.angst.b1", 
"emof.aerger.b1", 
"emof.langeweile.b1" ,
"emof.scham.b1", 
"emof.schuld.b1" ,
"emos.freude.b1" ,
"emos.angst.b1", 
"emos.aerger.b1", 
"emos.langeweile.b1" ,
"emos.scham.b1", 
"emos.schuld.b1" ,
"emof.freude.b2" ,
"emof.angst.b2", 
"emof.aerger.b2", 
"emof.langeweile.b2" ,
"emof.scham.b2", 
"emof.schuld.b2" ,
"emos.freude.b2" ,
"emos.angst.b2", 
"emos.aerger.b2", 
"emos.langeweile.b2" ,
"emos.scham.b2" ,
"emos.scham.b3", 
"emof.freude.b3" ,
"emof.angst.b3", 
"emof.aerger.b3", 
"emof.langeweile.b3" ,
"emof.scham.b3", 
"emof.schuld.b3" ,
"emos.freude.b3" ,
"emos.angst.b3", 
"emos.aerger.b3", 
"emos.langeweile.b3" ,
"emos.schuld.b2" ,
"emos.schuld.b3" 
)]


diss_marcus_tmp <- full_join(diss_marcus_tmp, diss_prepost_w_kovar_analy, by="code")



model <- '
          doz =~ lamb*doz_gef
               + lamb*doz_pass


          emo1 =~ 1*emof.schuld.b1
                 
          emo3 =~ 1*emof.schuld.b3
          
'

fit <- cfa(model, data=diss_marcus_tmp)
summary(fit, fit.measures=TRUE)





# Korrelation Einstellung Dozierende mit irgend etwas ####
library(corrgram)
tmp <- diss_prepost_begleit[c("doz_gef",
                              "doz_pass",
                              "T2.knstr",
                              "T2.RefBer2",
                              "T2.anstrS",
                              "T2.anstrT",
                              "T2.ind.wert.util",
                              "T2.ind.wert.cost",
                              "T2.int")]


corrgram(tmp, lower.panel = panel.pie)
