#Descriptive results  Selection####
#Mean per group
tmp <- diss_prepost_w_kovar_analy
tmp <- tmp[c("seminartyp", "anz_T1", "anz_T2")]

tmp %>%
  group_by(seminartyp) %>%
  summarize(AnzT1_M = mean(anz_T1, na.rm=TRUE),
            AnzT2_M = mean(anz_T2, na.rm=TRUE),
            AnzT1_SD = sd(anz_T1, na.rm=TRUE),
            AnzT2_SD = sd(anz_T2, na.rm=TRUE))

rm(tmp)

#Descriptive results inquiry (Erörterung) ####
# Mean per group
tmp <- diss_prepost_w_kovar_analy[c("seminartyp", "A43_1", "A43_2", "A43_7", "A43_3", "A43_4", "A43_5")]
tmp %>%
  mutate(A_T1 = rowMeans(data.frame(A43_1, A43_2, A43_7), na.rm=TRUE),
         A_T2 = rowMeans(data.frame(A43_3, A43_4, A43_5), na.rm=TRUE)) %>%
  group_by(seminartyp) %>%
  summarize(A_T1_M = mean(A_T1, na.rm=TRUE),
            A_T2_M = mean(A_T2, na.rm=TRUE),
            A_T1_SD = sd(A_T1, na.rm=TRUE),
            A_T2_SD = sd(A_T2, na.rm=TRUE))

rm(tmp)



#Descriptive results theory ####
# Mean per group
tmp <- diss_prepost_w_kovar_analy[c("seminartyp", "theorie.r.43.1", "theorie.r.43.2", "theorie.r.43.7", "theorie.r.43.3", "theorie.r.43.4", "theorie.r.43.5")]
tmp$theorie.r.43.1 <- as.numeric(tmp$theorie.r.43.1)
tmp$theorie.r.43.2 <- as.numeric(tmp$theorie.r.43.2)
tmp$theorie.r.43.7 <- as.numeric(tmp$theorie.r.43.7)
tmp$theorie.r.43.3 <- as.numeric(tmp$theorie.r.43.3)
tmp$theorie.r.43.4 <- as.numeric(tmp$theorie.r.43.4)
tmp$theorie.r.43.5 <- as.numeric(tmp$theorie.r.43.5)

tmp %>%
  mutate(T_T1 = rowMeans(data.frame(theorie.r.43.1, theorie.r.43.2, theorie.r.43.7), na.rm=TRUE),
         T_T2 = rowMeans(data.frame(theorie.r.43.3, theorie.r.43.4, theorie.r.43.5), na.rm=TRUE)) %>%
  group_by(seminartyp) %>%
  summarize(T_T1_M = mean(T_T1, na.rm=TRUE),
            T_T2_M = mean(T_T2, na.rm=TRUE),
            T_T1_sd = sd(T_T1, na.rm=TRUE),
            T_T2_sd = sd(T_T2, na.rm=TRUE))

rm(tmp)