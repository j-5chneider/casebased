# Davor import_data.R ausführen
# Davor import_data_unaggregated.R ausführen

#### LCA ####
# 4 Schritte, 1 Klassen
  library(dplyr)
  tmp <- diss_raw %>%
    mutate(Beschreibung.12 = Beschreibung    + 1,
           Handlung.12     = Handlung.01     + 1,
           Alternativen.12 = Alternativen.01 + 1,
           Beweise.12      = Beweise.01      + 1,
           Entscheidung.12 = Entscheidung.01 + 1
           )
  
  library(poLCA)
  poLCA(formula=cbind(Beschreibung.12, Handlung.12, Alternativen.12, Beweise.12)~1, 
        data=tmp, 
        nclass= 1, 
        na.rm=FALSE, 
        graphs=TRUE
        )
  
  rm(tmp)
  

#### LCA ####
# 4 Schritte, 2 Klassen
  library(dplyr)
  tmp <- diss_raw %>%
    mutate(Beschreibung.12 = Beschreibung    + 1,
           Handlung.12     = Handlung.01     + 1,
           Alternativen.12 = Alternativen.01 + 1,
           Beweise.12      = Beweise.01      + 1,
           Entscheidung.12 = Entscheidung.01 + 1
           )
  
  library(poLCA)
  poLCA(formula=cbind(Beschreibung.12, Handlung.12, Alternativen.12, Beweise.12)~1, 
        data=tmp, 
        nclass= 2, 
        na.rm=FALSE, 
        graphs=TRUE
        )
  
  rm(tmp)
  

#### LCA ####
# 4 Schritte, 3 Klassen
  library(dplyr)
  tmp <- diss_raw %>%
    mutate(Beschreibung.12 = Beschreibung    + 1,
           Handlung.12     = Handlung.01     + 1,
           Alternativen.12 = Alternativen.01 + 1,
           Beweise.12      = Beweise.01      + 1,
           Entscheidung.12 = Entscheidung.01 + 1
           )
  
  library(poLCA)
  poLCA(formula=cbind(Beschreibung.12, Handlung.12, Alternativen.12, Beweise.12)~1, 
        data=tmp, 
        nclass= 3, 
        na.rm=FALSE, 
        graphs=TRUE
        )
  
  rm(tmp)
  

#### LCA ####
# 4 Schritte, 4 Klassen
  library(dplyr)
  tmp <- diss_raw %>%
    mutate(Beschreibung.12 = Beschreibung    + 1,
           Handlung.12     = Handlung.01     + 1,
           Alternativen.12 = Alternativen.01 + 1,
           Beweise.12      = Beweise.01      + 1,
           Entscheidung.12 = Entscheidung.01 + 1
           )

  library(poLCA)
  poLCA(formula=cbind(Beschreibung.12, Handlung.12, Alternativen.12, Beweise.12)~1, 
        data=tmp, 
        nclass= 4, 
        na.rm=FALSE, 
        graphs=TRUE
        )
  
  rm(tmp)
  

#### LCA ####
# 4 Schritte, 5 Klassen
  library(dplyr)
  tmp <- diss_raw %>%
    mutate(Beschreibung.12 = Beschreibung    + 1,
           Handlung.12     = Handlung.01     + 1,
           Alternativen.12 = Alternativen.01 + 1,
           Beweise.12      = Beweise.01      + 1,
           Entscheidung.12 = Entscheidung.01 + 1
           )

  library(poLCA)
  poLCA(formula=cbind(Beschreibung.12, Handlung.12, Alternativen.12, Beweise.12)~1, 
        data=tmp, 
        nclass= 5, 
        na.rm=FALSE, 
        graphs=TRUE
        )
  
  rm(tmp)
  

#### LCA ####
# 4 Schritte, 6 Klassen
  library(dplyr)
  tmp <- diss_raw %>%
    mutate(Beschreibung.12 = Beschreibung    + 1,
           Handlung.12     = Handlung.01     + 1,
           Alternativen.12 = Alternativen.01 + 1,
           Beweise.12      = Beweise.01      + 1,
           Entscheidung.12 = Entscheidung.01 + 1
           )

  library(poLCA)
  poLCA(formula=cbind(Beschreibung.12, Handlung.12, Alternativen.12, Beweise.12)~1, 
        data=tmp, 
        nclass= 6, 
        na.rm=FALSE, 
        graphs=TRUE
        )
  
  rm(tmp)
  