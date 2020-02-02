#### import 43_1 ####
  library(Hmisc)
  library(foreign)
  diss_43_1 <- spss.get(file="data/rawdata/43_1 2015-08-18.sav", 
                       use.value.labels=FALSE
                       )
  
  library(dplyr)
  diss_43_1 <- tbl_df(diss_43_1)
  glimpse(diss_43_1)
  
  diss_43_1 <- diss_43_1[c("code",
                           "Beschreibung",
                           "Handlung",
                           "Alternative",
                           "Beweise.01",
                           "Entscheidung.01"
                           )
                         ]
  
  diss_43_1$seq <- 1

#### import 43_2 ####
  library(Hmisc)
  library(foreign)
  diss_43_2 <- spss.get(file="data/rawdata/43_2 2015-08-18.sav", 
                       use.value.labels=FALSE
                       )
  
  library(dplyr)
  diss_43_2 <- tbl_df(diss_43_2)
  glimpse(diss_43_2)
  
  diss_43_2 <- diss_43_2[c("code",
                           "Beschreibung",
                           "Handlung",
                           "Alternative",
                           "Beweise.01",
                           "Entscheidung.01"
                           )
                         ]
    
  diss_43_2$seq <- 2

  
  
#### import 43_7 ####
  library(Hmisc)
  library(foreign)
  diss_43_7 <- spss.get(file="data/rawdata/43_7 2015-08-18.sav", 
                       use.value.labels=FALSE
                       )
  
  library(dplyr)
  diss_43_7 <- tbl_df(diss_43_7)
  glimpse(diss_43_7)
  
  diss_43_7 <- diss_43_7[c("code",
                           "Beschreibung",
                           "Handlung",
                           "Alternative",
                           "Beweise.01",
                           "Entscheidung.01"
                           )
                         ]
    
  diss_43_7$seq <- 7

  
  
#### import 43_3 ####
  library(Hmisc)
  library(foreign)
  diss_43_3 <- spss.get(file="data/rawdata/43_3 2015-08-18.sav", 
                       use.value.labels=FALSE
                       )
  
  library(dplyr)
  diss_43_3 <- tbl_df(diss_43_3)
  glimpse(diss_43_3)
  
  diss_43_3 <- diss_43_3[c("code",
                           "Beschreibung",
                           "Handlung",
                           "Alternative",
                           "Beweise.01",
                           "Entscheidung.01"
                           )
                         ]
    
  diss_43_3$seq <- 3

  
  
#### import 43_4 ####
  library(Hmisc)
  library(foreign)
  diss_43_4 <- spss.get(file="data/rawdata/43_4 2015-08-18.sav", 
                       use.value.labels=FALSE
                       )
  
  library(dplyr)
  diss_43_4 <- tbl_df(diss_43_4)
  glimpse(diss_43_4)
  
  diss_43_4 <- diss_43_4[c("code",
                           "Beschreibung",
                           "Handlung",
                           "Alternative",
                           "Beweise.01",
                           "Entscheidung.01"
                           )
                         ]
    
  diss_43_4$seq <- 4

  
  
#### import 43_5 ####
  library(Hmisc)
  library(foreign)
  diss_43_5 <- spss.get(file="data/rawdata/43_5 2015-08-18.sav", 
                       use.value.labels=FALSE
                       )
  
  library(dplyr)
  diss_43_5 <- tbl_df(diss_43_5)
  glimpse(diss_43_5)
  
  diss_43_5 <- diss_43_5[c("code",
                           "Beschreibung",
                           "Handlung",
                           "Alternative",
                           "Beweise.01",
                           "Entscheidung.01"
                           )
                         ]
    
  diss_43_5$seq <- 5

  
  
#### gather 43_1:5 ####
  library(tidyr)
  diss_raw <- bind_rows(diss_43_1, 
                        diss_43_2, 
                        diss_43_7, 
                        diss_43_3, 
                        diss_43_4, 
                        diss_43_5
                       )
  glimpse(diss_raw)
  rm(diss_43_1, diss_43_2, diss_43_7, diss_43_3, diss_43_4, diss_43_5)
  

  #Plausibilitätskontrolle
  summary(diss_raw)


#### add variable seminar ####
  tmp <- diss_prepost_w_kovar_analy[c("code",
                                      "seminartyp")
                                    ]
  tmp <- tbl_df(tmp)
  tmp$code <- as.character(tmp$code)
  diss_raw$code <- as.character(diss_raw$code)
  
  diss_raw <- left_join(diss_raw, tmp, by = "code")
  rm(tmp)
  
  
#### PHI Bivariate ####
  #Beschreibung  
  library(psych)
  tmp <- matrix(table(diss_raw$Beschreibung, diss_raw$Handlung))
  phi(tmp, digits = 3)

  tmp <- table(diss_raw$Beschreibung, diss_raw$Alternative)
  phi(tmp, digits = 3)
  
  tmp <- table(diss_raw$Beschreibung, diss_raw$Beweise.01)
  phi(tmp, digits = 3)
  
  tmp <- table(diss_raw$Beschreibung, diss_raw$Entscheidung.01)
  phi(tmp, digits = 3)
  
  #Handlung
  tmp <- table(diss_raw$Handlung, diss_raw$Alternative)
  phi(tmp, digits = 3)
  
  tmp <- table(diss_raw$Handlung, diss_raw$Beweise.01)
  phi(tmp, digits = 3)
  
  tmp <- table(diss_raw$Handlung, diss_raw$Entscheidung.01)
  phi(tmp, digits = 3)
  
  #Alternativen
  tmp <- table(diss_raw$Alternative, diss_raw$Beweise.01)
  phi(tmp, digits = 3)
  
  tmp <- table(diss_raw$Alternative, diss_raw$Entscheidung.01)
  phi(tmp, digits = 3)
  
  #Beweise
  tmp <- table(diss_raw$Beweise.01, diss_raw$Entscheidung.01)
  phi(tmp, digits = 3)
  
  rm(tmp)