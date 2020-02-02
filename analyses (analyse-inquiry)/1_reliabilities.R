# Reliabilität 43_1 ####
# CFA: Testung auf Eindimensionalität
library(lavaan)
Model_43_1 <- '
               T43_1 =~ A43_1_1       #Indicators with >10% coverage
#                       + A43_1_10
#                       + A43_1_11
#                       + A43_1_12 
#                       + A43_1_13 
#                       + A43_1_14 
#                       + A43_1_15 
#                       + A43_1_16 
#                       + A43_1_17 
#                       + A43_1_18 
                       + A43_1_2 
                       + A43_1_3 
                       + A43_1_4 
                       + A43_1_5 
#                        + A43_1_6 
#                        + A43_1_7 
#                        + A43_1_8 
#                        + A43_1_9
              '
  fit_43_1 <- cfa(
                  model = Model_43_1
                , estimator = "MLR"
                , data = diss_prepost_w_kovar_analy
                , missing = "fiml"
                , std.lv = TRUE
                  )

  summary(
          fit_43_1
        , fit.measures=TRUE
          )

  remove(fit_43_1)

# Testung auf Messinvarianz
  library(semTools)
  measurementInvariance(
                          Model_43_1
                        , estimator = "MLR"
                        , data = diss_prepost_w_kovar_analy
                        , strict = TRUE
                        , quiet = FALSE
                        , group="llm"
                        , missing="FIML"
                        )

  remove(Model_43_1)



# McDonalds Omega + Cronbachs Alpha
  # Reliabilität bei so geringer coverage lässt sich nicht berechnen
  # deshalb wurde die Reliabilität den Items berechnet, die mindestens 10% coverage aufweisen
  # und somit genug Varianz innerhalb des Items haben
rel_43_1 <- data.frame(diss_prepost_w_kovar_analy[c(
                                            "A43_1_1"        #Indicators with >10% coverage
#                                             ,"A43_1_10"
#                                             ,"A43_1_11" 
#                                             ,"A43_1_12" 
#                                             ,"A43_1_13" 
#                                             ,"A43_1_14" 
#                                             ,"A43_1_15" 
#                                             ,"A43_1_16" 
#                                             ,"A43_1_17" 
#                                             ,"A43_1_18" 
                                            ,"A43_1_2" 
                                            ,"A43_1_3" 
                                            ,"A43_1_4" 
                                            ,"A43_1_5" 
#                                             ,"A43_1_6" 
#                                             ,"A43_1_7" 
#                                             ,"A43_1_8" 
#                                             ,"A43_1_9"
                                           )]
                      )
library(psych)
library(GPArotation)
rel_43_1_value <- omega(rel_43_1)
rel_43_1_value
remove(rel_43_1, rel_43_1_value)



# Reliabilität 43_2 ####
# CFA: Testung auf Eindimensionalität
library(lavaan)
Model_43_2 <- '
               T43_2 =~ A43_2_1       #Indicators with >10% coverage
#                       + A43_2_10
#                       + A43_2_11
#                       + A43_2_12 
#                       + A43_2_13 
#                       + A43_2_14 
#                       + A43_2_15 
                       + A43_2_2 
                       + A43_2_3 
                       + A43_2_4 
                       + A43_2_5 
#                        + A43_2_6 
#                        + A43_2_7 
#                        + A43_2_8 
#                        + A43_2_9
              '
  fit_43_2 <- cfa(
                  model = Model_43_2
                , estimator = "MLR"
                , data = diss_prepost_w_kovar_analy
                , missing = "fiml"
                , std.lv = TRUE
                  )

  summary(
          fit_43_2
        , fit.measures=TRUE
          )

  remove(fit_43_2)

# Testung auf Messinvarianz
  library(semTools)
  measurementInvariance(
                          Model_43_2
                        , estimator = "MLR"
                        , data = diss_prepost_w_kovar_analy
                        , strict = TRUE
                        , quiet = FALSE
                        , group="llm"
                        , missing="FIML"
                        )

  remove(Model_43_2)


# McDonalds Omega + Cronbachs Alpha
  # Reliabilität bei so geringer coverage lässt sich nicht berechnen
  # deshalb wurde die Reliabilität den Items berechnet, die mindestens 10% coverage aufweisen
  # und somit genug Varianz innerhalb des Items haben
rel_43_2 <- data.frame(diss_prepost_w_kovar_analy[c(
                                            "A43_2_1"        #Indicators with >10% coverage
#                                             ,"A43_2_10"
#                                             ,"A43_2_11" 
#                                             ,"A43_2_12" 
#                                             ,"A43_2_13" 
#                                             ,"A43_2_14" 
#                                             ,"A43_2_15" 
                                            ,"A43_2_2" 
                                            ,"A43_2_3" 
                                            ,"A43_2_4" 
                                            ,"A43_2_5" 
#                                             ,"A43_2_6" 
#                                             ,"A43_2_7" 
#                                             ,"A43_2_8" 
#                                             ,"A43_2_9"
                                           )]
                      )
library(psych)
library(GPArotation)
rel_43_2_value <- omega(rel_43_2)
rel_43_2_value
remove(rel_43_2, rel_43_2_value)


# Reliabilität 43_7 ####
# CFA: Testung auf Eindimensionalität
library(lavaan)
Model_43_7 <- '
               T43_7 =~ A43_7_1       #Indicators with >10% coverage
#                       + A43_7_10
#                       + A43_7_11
#                       + A43_7_12 
#                       + A43_7_13 
#                       + A43_7_14 
#                       + A43_7_15 
#                       + A43_7_16 
#                       + A43_7_17 
#                       + A43_7_18 
                       + A43_7_2 
                       + A43_7_3 
                       + A43_7_4 
                       + A43_7_5 
#                        + A43_7_6 
#                        + A43_7_7 
#                        + A43_7_8 
#                        + A43_7_9
              '
  fit_43_7 <- cfa(
                  model = Model_43_7
                , estimator = "MLR"
                , data = diss_prepost_w_kovar_analy
                , missing = "fiml"
                , std.lv = TRUE
                  )

  summary(
          fit_43_7
        , fit.measures=TRUE
          )

  remove(fit_43_7)

# Testung auf Messinvarianz
  library(semTools)
  measurementInvariance(
                          Model_43_7
#                         , estimator = "MLR"
                        , data = diss_prepost_w_kovar_analy
                        , strict = TRUE
                        , quiet = FALSE
                        , group="llm"
                        , missing="FIML"
                        )

  remove(Model_43_7)


# McDonalds Omega + Cronbachs Alpha
  # Reliabilität bei so geringer coverage lässt sich nicht berechnen
  # deshalb wurde die Reliabilität den Items berechnet, die mindestens 10% coverage aufweisen
  # und somit genug Varianz innerhalb des Items haben
rel_43_7 <- data.frame(diss_prepost_w_kovar_analy[c(
                                            "A43_7_1"        #Indicators with >10% coverage
#                                             ,"A43_7_10"
#                                             ,"A43_7_11" 
#                                             ,"A43_7_12" 
#                                             ,"A43_7_13" 
#                                             ,"A43_7_14" 
#                                             ,"A43_7_15" 
#                                             ,"A43_7_16" 
#                                             ,"A43_7_17" 
#                                             ,"A43_7_18" 
                                            ,"A43_7_2" 
                                            ,"A43_7_3" 
                                            ,"A43_7_4" 
                                            ,"A43_7_5" 
#                                             ,"A43_7_6" 
#                                             ,"A43_7_7" 
#                                             ,"A43_7_8" 
#                                             ,"A43_7_9"
                                           )]
                      )
library(psych)
library(GPArotation)
rel_43_7_value <- omega(rel_43_7)
rel_43_7_value
remove(rel_43_7, rel_43_7_value)


# Reliabilität 43_3 ####
# CFA: Testung auf Eindimensionalität
library(lavaan)
Model_43_3 <- '
               T43_3 =~ A43_3_1       #Indicators with >10% coverage
#                       + A43_3_10
#                       + A43_3_11
#                       + A43_3_12 
                       + A43_3_2 
                       + A43_3_3 
                       + A43_3_4 
#                        + A43_3_5 
#                        + A43_3_6 
#                        + A43_3_7 
#                        + A43_3_8 
#                        + A43_3_9
              '
  fit_43_3 <- cfa(
                  model = Model_43_3
                , estimator = "MLR"  
                , data = diss_prepost_w_kovar_analy
                , missing = "fiml"
                , std.lv = TRUE
                  )

  summary(
          fit_43_3
        , fit.measures=TRUE
          )

  remove(fit_43_3)

# Testung auf Messinvarianz
  library(semTools)
  measurementInvariance(
                          Model_43_3
                        , estimator = "MLR"
                        , data = diss_prepost_w_kovar_analy
                        , strict = TRUE
                        , quiet = FALSE
                        , group="llm"
                        , missing="FIML"
                        )

  remove(Model_43_3)

# McDonalds Omega + Cronbachs Alpha
  # Reliabilität bei so geringer coverage lässt sich nicht berechnen
  # deshalb wurde die Reliabilität den Items berechnet, die mindestens 10% coverage aufweisen
  # und somit genug Varianz innerhalb des Items haben
rel_43_3 <- data.frame(diss_prepost_w_kovar_analy[c(
                                            "A43_3_1"        #Indicators with >10% coverage
#                                             ,"A43_3_10"
#                                             ,"A43_3_11" 
#                                             ,"A43_3_12" 
                                            ,"A43_3_2" 
                                            ,"A43_3_3" 
                                            ,"A43_3_4" 
#                                             ,"A43_3_5" 
#                                             ,"A43_3_6" 
#                                             ,"A43_3_7" 
#                                             ,"A43_3_8" 
#                                             ,"A43_3_9"
                                           )]
                      )
library(psych)
library(GPArotation)
rel_43_3_value <- omega(rel_43_3)
rel_43_3_value
remove(rel_43_3, rel_43_3_value)



# Reliabilität 43_4 ####
# CFA: Testung auf Eindimensionalität
library(lavaan)
Model_43_4 <- '
               T43_4 =~ A43_4_1       #Indicators with >10% coverage
#                       + A43_4_10
#                       + A43_4_11
#                       + A43_4_12 
#                       + A43_4_13 
                       + A43_4_2 
                       + A43_4_3 
                       + A43_4_4 
#                        + A43_4_5 
#                        + A43_4_6 
#                        + A43_4_7 
#                        + A43_4_8 
#                        + A43_4_9
              '
  fit_43_4 <- cfa(
                  model = Model_43_4
                , estimator = "MLR"
                , data = diss_prepost_w_kovar_analy
                , missing = "fiml"
                , std.lv = TRUE
                  )

  summary(
          fit_43_4
        , fit.measures=TRUE
          )

  remove(fit_43_4)

# Testung auf Messinvarianz
  library(semTools)
  measurementInvariance(
                          Model_43_4
                        , estimator = "MLR"
                        , data = diss_prepost_w_kovar_analy
                        , strict = TRUE
                        , quiet = FALSE
                        , group="llm"
                        , missing="FIML"
                        )

  remove(Model_43_4)


# McDonalds Omega + Cronbachs Alpha
  # Reliabilität bei so geringer coverage lässt sich nicht berechnen
  # deshalb wurde die Reliabilität den Items berechnet, die mindestens 10% coverage aufweisen
  # und somit genug Varianz innerhalb des Items haben
rel_43_4 <- data.frame(diss_prepost_w_kovar_analy[c(
                                            "A43_4_1"        #Indicators with >10% coverage
#                                             ,"A43_4_10"
#                                             ,"A43_4_11" 
#                                             ,"A43_4_12" 
#                                             ,"A43_4_13" 
                                            ,"A43_4_2" 
                                            ,"A43_4_3" 
                                            ,"A43_4_4" 
#                                             ,"A43_4_5" 
#                                             ,"A43_4_6" 
#                                             ,"A43_4_7" 
#                                             ,"A43_4_8" 
#                                             ,"A43_4_9"
                                           )]
                      )
library(psych)
library(GPArotation)
rel_43_4_value <- omega(rel_43_4)
rel_43_4_value
remove(rel_43_4, rel_43_4_value)



# Reliabilität 43_5 ####
# CFA: Testung auf Eindimensionalität
library(lavaan)
Model_43_5 <- '
               T43_5 =~ A43_5_1       #Indicators with >10% coverage
#                       + A43_5_10
                       + A43_5_2 
                       + A43_5_3 
#                        + A43_5_4 
#                        + A43_5_5 
#                        + A43_5_6 
#                        + A43_5_7 
#                        + A43_5_8 
#                        + A43_5_9

              '
  fit_43_5 <- cfa(
                  model = Model_43_5
                , estimator = "MLR"
                , data = diss_prepost_w_kovar_analy
                , missing = "fiml"
                , std.lv = TRUE
                  )

  summary(
          fit_43_5
        , fit.measures=TRUE
          )

  remove(fit_43_5)

# Testung auf Messinvarianz
  library(semTools)
  measurementInvariance(
                          Model_43_5
                        , estimator = "MLR"
                        , data = diss_prepost_w_kovar_analy
                        , strict = TRUE
                        , quiet = FALSE
                        , group="llm"
                        , missing="FIML"
                        )

  remove(Model_43_5)


# McDonalds Omega + Cronbachs Alpha
  # Reliabilität bei so geringer coverage lässt sich nicht berechnen
  # deshalb wurde die Reliabilität den Items berechnet, die mindestens 10% coverage aufweisen
  # und somit genug Varianz innerhalb des Items haben
rel_43_5 <- data.frame(diss_prepost_w_kovar_analy[c(
                                            "A43_5_1"        #Indicators with >10% coverage
#                                             ,"A43_5_10"
                                            ,"A43_5_2" 
                                            ,"A43_5_3" 
#                                             ,"A43_5_4" 
#                                             ,"A43_5_5" 
#                                             ,"A43_5_6" 
#                                             ,"A43_5_7" 
#                                             ,"A43_5_8" 
#                                             ,"A43_5_9"
                                           )]
                      )
library(psych)
library(GPArotation)
rel_43_5_value <- omega(rel_43_5)
rel_43_5_value
remove(rel_43_5, rel_43_5_value)