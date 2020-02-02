
# STICHPROBE ####

  # Geschlecht Teilnehmer_innen ####
    # 1= weiblich, 2= männlich
    table(diss_prepost_w_kovar_analy$geschl..)

  # Alter ####
    summary(diss_prepost_w_kovar_analy$alter)
    sd(diss_prepost_w_kovar_analy$alter, na.rm=TRUE)

  # Semester ####
    summary(diss_prepost_w_kovar_analy$semester)

    semesterCount <- table(diss_prepost_w_kovar_analy$semester)
    semesterCount <- data.frame(semesterCount)

    library(dplyr)
      semesterCount <- tbl_df(semesterCount)
      semesterCount$GesN <- 
                           semesterCount %>%
                              summarize(GesN = sum(Freq)) %>%
                              as.numeric()

      semesterCount$Perc <- semesterCount$Freq/semesterCount$GesN

    library(ggplot2)
      p <- ggplot(semesterCount, aes(x=Var1, y=Perc))
      p + geom_bar(stat="identity")

    rm(semesterCount, p)


# DESIGN ####
# Gruppen auf signifikante Unterschiede bzgl. bestimmter Variablen testen
  # Geschlechteranteil #####
    geschlecht <- diss_prepost_w_kovar_analy[c("geschl..", "medium", "seminar")]
    geschlecht$seminar <- as.factor(geschlecht$seminar)
    geschlecht$geschl.. <- as.factor(geschlecht$geschl..)
    names(geschlecht) <- c("geschl", "medium", "seminar")
    library(dplyr)
    geschlecht <- tbl_df(geschlecht)
    geschlecht$fem <- ifelse(geschlecht$geschl==1,1,0)

    geschlecht <- geschlecht %>%                
                    group_by(seminar) %>%
                    summarize(femC = sum(fem, na.rm=TRUE),
                              gesC = n(),
                              treat = mean(medium)) %>%
                    mutate(femP = femC/gesC)
  
    geschlecht <- geschlecht[-22,]
    
    t.test(geschlecht$femP ~ geschlecht$treat, paired=FALSE)
    rm(geschlecht)

  # Semester ####
  t.test(diss_prepost_w_kovar_analy$semester ~ diss_prepost_w_kovar_analy$medium, paired=FALSE)
  
  # Lehrerfahrung ####
  t.test(diss_prepost_w_kovar_analy$unterrichtet ~ diss_prepost_w_kovar_analy$medium, paired=FALSE)

  # Literatur bzgl. CRM vor Treatment ####
  t.test(diss_prepost_w_kovar_analy$T1.theorietexte ~ diss_prepost_w_kovar_analy$medium, paired=FALSE)

  # deklaratives Wissen T1 ####
  t.test(diss_prepost_w_kovar_analy$T1.wiss.praev.Wert ~ diss_prepost_w_kovar_analy$medium, paired=FALSE)
  t.test(diss_prepost_w_kovar_analy$T1.wiss.bez.Wert ~ diss_prepost_w_kovar_analy$medium, paired=FALSE)

  # Alter ####
  t.test(diss_prepost_w_kovar_analy$alter ~ diss_prepost_w_kovar_analy$medium, paired=FALSE)