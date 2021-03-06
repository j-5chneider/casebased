# Davor import_data.R ausführen
# Davor import_data_unaggregated.R ausführen

#### LCA ####
# 3 Schritte, 1 Klassen
  library(dplyr)
  tmp <- diss_raw %>%
    mutate(Beschreibung.12 = Beschreibung    + 1,
           Handlung.12     = Handlung.01     + 1,
           Alternativen.12 = Alternativen.01 + 1,
           Beweise.12      = Beweise.01      + 1,
           Entscheidung.12 = Entscheidung.01 + 1
           )
  
  library(poLCA)
  poLCA(formula=cbind(Handlung.12, Alternativen.12, Beweise.12)~1, 
        data=tmp, 
        nclass= 1, 
        na.rm=FALSE, 
        graphs=TRUE
        )
  
  rm(tmp)
  

#### LCA ####
# 3 Schritte, 2 Klassen
  library(dplyr)
  tmp <- diss_raw %>%
    mutate(Beschreibung.12 = Beschreibung    + 1,
           Handlung.12     = Handlung.01     + 1,
           Alternativen.12 = Alternativen.01 + 1,
           Beweise.12      = Beweise.01      + 1,
           Entscheidung.12 = Entscheidung.01 + 1
           )
  
  library(poLCA)
  poLCA(formula=cbind(Handlung.12, Alternativen.12, Beweise.12)~1, 
        data=tmp, 
        nclass= 2, 
        na.rm=FALSE, 
        graphs=TRUE
        )
  
  rm(tmp)
  

#### LCA ####
# 3 Schritte, 3 Klassen
  library(dplyr)
  tmp <- diss_raw %>%
    mutate(Beschreibung.12 = Beschreibung    + 1,
           Handlung.12     = Handlung.01     + 1,
           Alternativen.12 = Alternativen.01 + 1,
           Beweise.12      = Beweise.01      + 1,
           Entscheidung.12 = Entscheidung.01 + 1
           )
  
  library(poLCA)
  poLCA(formula=cbind(Handlung.12, Alternativen.12, Beweise.12)~1, 
        data=tmp, 
        nclass= 3, 
        na.rm=FALSE, 
        graphs=TRUE
        )
  
  rm(tmp)
  

#### LCA ####
# 3 Schritte, 4 Klassen
  library(dplyr)
  tmp <- diss_raw %>%
    mutate(Beschreibung.12 = Beschreibung    + 1,
           Handlung.12     = Handlung.01     + 1,
           Alternativen.12 = Alternativen.01 + 1,
           Beweise.12      = Beweise.01      + 1,
           Entscheidung.12 = Entscheidung.01 + 1
           )
# Versuch mit starting values Parameter zu fixieren (-> nicht geklappt)
#   matr1 <- matrix(c(.875, .625, .375, .125, .125, .375, .625, .875),
#                   nrow=4,
#                   ncol=2
#                   )
# 
#   matr2 <- matrix(c(.875, .625, .375, .125, .125, .375, .625, .875),
#                   nrow=4,
#                   ncol=2
#                   )
#   
#   matr3 <- matrix(c(.875, .625, .375, .125, .125, .375, .625, .875),
#                   nrow=4,
#                   ncol=2
#                   )
# 
#   probs.start <- list(matr1, matr2, matr3)
#   rm(matr1, matr2, matr3)
  
  library(poLCA)
  poLCA(formula=cbind(Handlung.12, Alternativen.12, Beweise.12)~1, 
        data=tmp, 
        nclass= 4, 
        na.rm=FALSE,
        graphs=TRUE#,
        # probs.start= probs.start
        )
  
  rm(tmp)
  

#### LCA ####
# 3 Schritte, 5 Klassen
  library(dplyr)
  tmp <- diss_raw %>%
    mutate(Beschreibung.12 = Beschreibung    + 1,
           Handlung.12     = Handlung.01     + 1,
           Alternativen.12 = Alternativen.01 + 1,
           Beweise.12      = Beweise.01      + 1,
           Entscheidung.12 = Entscheidung.01 + 1
           )

  library(poLCA)
  poLCA(formula=cbind(Handlung.12, Alternativen.12, Beweise.12)~1, 
        data=tmp, 
        nclass= 5, 
        na.rm=FALSE, 
        graphs=TRUE
        )
  
  rm(tmp)
  

#### LCA ####
# 3 Schritte, 6 Klassen
  library(dplyr)
  tmp <- diss_raw %>%
    mutate(Beschreibung.12 = Beschreibung    + 1,
           Handlung.12     = Handlung.01     + 1,
           Alternativen.12 = Alternativen.01 + 1,
           Beweise.12      = Beweise.01      + 1,
           Entscheidung.12 = Entscheidung.01 + 1
           )

  library(poLCA)
  poLCA(formula=cbind(Handlung.12, Alternativen.12, Beweise.12)~1, 
        data=tmp, 
        nclass= 6, 
        na.rm=FALSE, 
        graphs=TRUE
        )
  
  rm(tmp)
  