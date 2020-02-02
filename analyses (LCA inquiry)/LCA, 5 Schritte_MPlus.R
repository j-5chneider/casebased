# Davor import_data.R ausführen
# Davor import_data_unaggregated.R ausführen

library(dplyr)
tmp <- diss_raw %>%
  mutate(Beschreibung_12 = Beschreibung    + 1,
         Handlung_12     = Handlung.01     + 1,
         Alternativen_12 = Alternativen.01 + 1,
         Beweise_12      = Beweise.01      + 1,
         Entscheidung_12 = Entscheidung.01 + 1
  )

tmp <- tmp[c("Beschreibung_12",
             "Handlung_12",
             "Alternativen_12",
             "Beweise_12",
             "Entscheidung_12"
             )
           ]


library(MplusAutomation)
LCA_2 <- mplusObject(
  ANALYSIS =  "TYPE = MIXTURE;
               ITERATIONS = 20000;
               STARTS = 100 10;",
  
  VARIABLE =  "USEVARIABLES = Beschreibung_12
                              Handlung_12
                              Alternativen_12
                              Beweise_12
                              Entscheidung_12;

               CLASSES = klasse(2);
  
               CATEGORICAL = Beschreibung_12
                             Handlung_12
                             Alternativen_12
                             Beweise_12
                             Entscheidung_12;",
  
  
  MODEL =    "",
  
  OUTPUT = "STANDARDIZED;",
  
  PLOT = "TYPE = plot3;
          SERIES = Beschreibung_12(1)
                   Handlung_12(2)
                   Alternativen_12(3)
                   Beweise_12(4)
                   Entscheidung_12(5);",
  
  rdata = tmp)

LCA_2_fit <- mplusModeler(LCA_2, "LCA_MPlus.dat", run = 1)

LCA_2_fit_summ <- extractModelSummaries()
LCA_2_fit_para <- extractModelParameters()

showSummaryTable(LCA_2_fit_summ, keepCols=c("Title", "LL", "AIC", "BIC", "CFI"))

rm(LCA_2, LCA_2_fit, LCA_2_fit_summ, LCA_2_fit_para, tmp)
