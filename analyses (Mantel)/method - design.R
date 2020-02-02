
library(Hmisc)
library(foreign)
tmp <- spss.get(file="data/43_1-7 [+Korrelate] 2014-05-19.sav", use.value.labels=FALSE)
tmp <- tbl_df(tmp)
glimpse(tmp)
summary(tmp$erf.vid)
summary(tmp$erf.txt)
summary(tmp$T1.vorw.T1)
summary(tmp$sem.wahl.ut)
summary(tmp$sem.wahl.do)
summary(tmp$sem.wahl.fr)





# Variable llm erstellen ####
# Werte: 0=instruktional, 1= pbl
tmp$llm <- ifelse(c(tmp$seminartyp == 4 | tmp$seminartyp == 2), 0, 1)

tmp$llm <- factor(tmp$llm, levels = c(0,1))

#   summary(diss_prepost_w_kovar$llm)

# Variable medium erstellen ####
# Werte: 0=text, 1=video
tmp$medium <- ifelse(c(tmp$seminartyp == 1 | tmp$seminartyp == 2), 1, 0)

tmp$medium <- factor(tmp$medium, levels = c(0,1))


anova(lm(T1.theorietexte ~ llm*medium, data = tmp))
anova(lm(T1.wiss.praev.Wert ~ llm*medium, data = tmp))
anova(lm(T1.wiss.bez.Wert ~ llm*medium, data = tmp))
anova(lm(T1.vorw.T1 ~ llm*medium, data = tmp))
anova(lm(T1.RefBer1 ~ llm*medium, data = tmp))
anova(lm(T1.RefBer2 ~ llm*medium, data = tmp))
anova(lm(T1.anstrS ~ llm*medium, data = tmp))
anova(lm(T1.anstrT ~ llm*medium, data = tmp))
anova(lm(T1.knstr ~ llm*medium, data = tmp))
anova(lm(nfc ~ llm*medium, data = tmp))
anova(lm(T1.ind.wert.util ~ llm*medium, data = tmp))
anova(lm(T1.ind.wert.cost ~ llm*medium, data = tmp))
anova(lm(T1.int ~ llm*medium, data = tmp))




# Treatmentcheck ICC
tmp <- spss.get(file="data/Ratingbogen Treatmentcheck.sav", use.value.labels=FALSE)
tmp <- tbl_df(tmp)
glimpse(tmp)
