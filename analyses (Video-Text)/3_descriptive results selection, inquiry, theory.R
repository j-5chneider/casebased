library(dplyr)

#Descriptive results  Selection####
  #Mean, SD of sample
  summary(diss_prepost_w_kovar_analy$anz_T1)
  summary(diss_prepost_w_kovar_analy$anz_T2)
  sd(diss_prepost_w_kovar_analy$anz_T1, na.rm=TRUE)
  sd(diss_prepost_w_kovar_analy$anz_T2, na.rm=TRUE)

  #Mean per group
  tmp <- diss_prepost_w_kovar_analy[c("medium", "anz_T1", "anz_T2")]

  tmp %>%
    group_by(medium) %>%
    summarize(AnzT1_M = mean(anz_T1, na.rm=TRUE),
              AnzT2_M = mean(anz_T2, na.rm=TRUE)) %>%
    mutate(AnzDiff = AnzT2_M - AnzT1_M)
  
  rm(tmp)

#Descriptive results inquiry (Erörterung) ####
  #Mean, SD of sample
  diss_prepost_w_kovar_analy %>%
    mutate(A_T1 = rowMeans(data.frame(A43_1, A43_2, A43_7), na.rm=TRUE),
           A_T2 = rowMeans(data.frame(A43_3, A43_4, A43_5), na.rm=TRUE)) %>%
    summarize(A_T1_M = mean(A_T1, na.rm=TRUE),
              A_T2_M = mean(A_T2, na.rm=TRUE),
              A_T1_SD = sd(A_T1, na.rm=TRUE),
              A_T2_SD = sd(A_T2, na.rm=TRUE)
              )
  # Mean per group
  tmp <- diss_prepost_w_kovar_analy[c("medium", "A43_1", "A43_2", "A43_7", "A43_3", "A43_4", "A43_5")]
    tmp %>%
      mutate(A_T1 = rowMeans(data.frame(A43_1, A43_2, A43_7), na.rm=TRUE),
            A_T2 = rowMeans(data.frame(A43_3, A43_4, A43_5), na.rm=TRUE)) %>%
      group_by(medium) %>%
      summarize(A_T1_M = mean(A_T1, na.rm=TRUE),
                A_T2_M = mean(A_T2, na.rm=TRUE))

  rm(tmp)

#Descriptive results theory ####
  #Mean, SD of sample
  diss_prepost_w_kovar_analy %>%
    mutate(T_T1 = rowMeans(data.frame(theorie.r.43.1, theorie.r.43.2, theorie.r.43.7), na.rm=TRUE),
           T_T2 = rowMeans(data.frame(theorie.r.43.3, theorie.r.43.4, theorie.r.43.5), na.rm=TRUE)) %>%
    summarize(T_T1_M = mean(T_T1, na.rm=TRUE),
              T_T2_M = mean(T_T2, na.rm=TRUE),
              T_T1_SD = sd(T_T1, na.rm=TRUE),
              T_T2_SD = sd(T_T2, na.rm=TRUE)
              )

  # Mean per group
  tmp <- diss_prepost_w_kovar_analy[c("medium", "theorie.r.43.1", "theorie.r.43.2", "theorie.r.43.7", "theorie.r.43.3", "theorie.r.43.4", "theorie.r.43.5")]
  tmp$theorie.r.43.1 <- as.numeric(tmp$theorie.r.43.1)
  tmp$theorie.r.43.2 <- as.numeric(tmp$theorie.r.43.2)
  tmp$theorie.r.43.7 <- as.numeric(tmp$theorie.r.43.7)
  tmp$theorie.r.43.3 <- as.numeric(tmp$theorie.r.43.3)
  tmp$theorie.r.43.4 <- as.numeric(tmp$theorie.r.43.4)
  tmp$theorie.r.43.5 <- as.numeric(tmp$theorie.r.43.5)

  tmp %>%
    mutate(T_T1 = rowMeans(data.frame(theorie.r.43.1, theorie.r.43.2, theorie.r.43.7), na.rm=TRUE),
           T_T2 = rowMeans(data.frame(theorie.r.43.3, theorie.r.43.4, theorie.r.43.5), na.rm=TRUE)) %>%
    group_by(medium) %>%
    summarize(T_T1_M = mean(T_T1, na.rm=TRUE),
              T_T2_M = mean(T_T2, na.rm=TRUE))

  rm(tmp)


# Deskriptive Ergebnisse Einstellung Dozierende ####
  tmp <- diss_prepost_w_kovar_analy[c("medium", "doz_gef", "doz_pass", "seminar")]
  tmp$seminar <- as.numeric(tmp$seminar)

  # M, SD pro Gruppe
  tmp %>%
    mutate(doz_einst = rowMeans(data.frame(doz_gef, doz_pass), na.rm=TRUE)) %>%
    group_by(medium) %>%
    summarize(doz_einst_M = mean(doz_einst, na.rm=TRUE),
              doz_einst_SD = sd(doz_einst, na.rm=TRUE))

  # korreliert Einstellung mit Medium?
  tmp <- tmp %>%
          mutate(doz_einst = rowMeans(data.frame(doz_gef, doz_pass), na.rm=TRUE)) %>%
          group_by(seminar) %>%
          summarize(doz_einst_M = mean(doz_einst, na.rm=TRUE),
                    medium = mean(medium, na.rm=TRUE))
  cor.test(tmp$medium, tmp$doz_einst_M, method="spearman")

  # Verteilung der Einstellungen in beiden Seminaren
  library(ggplot2)
  p <- ggplot(tmp, aes(x=doz_einst_M))
  p + geom_bar(alpha=.3) + facet_wrap(~ medium)
  rm(p, tmp)