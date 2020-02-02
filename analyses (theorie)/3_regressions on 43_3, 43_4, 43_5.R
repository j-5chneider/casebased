diss_prepost_w_kovar_analy$theorie_r_43_1 <- as.numeric(diss_prepost_w_kovar_analy$theorie_r_43_1)
diss_prepost_w_kovar_analy$theorie_r_43_2 <- as.numeric(diss_prepost_w_kovar_analy$theorie_r_43_2)
diss_prepost_w_kovar_analy$theorie_r_43_7 <- as.numeric(diss_prepost_w_kovar_analy$theorie_r_43_7)
diss_prepost_w_kovar_analy$theorie_r_43_3 <- as.numeric(diss_prepost_w_kovar_analy$theorie_r_43_3)
diss_prepost_w_kovar_analy$theorie_r_43_4 <- as.numeric(diss_prepost_w_kovar_analy$theorie_r_43_4)
diss_prepost_w_kovar_analy$theorie_r_43_5 <- as.numeric(diss_prepost_w_kovar_analy$theorie_r_43_5)

View(names(diss_prepost_w_kovar_analy))
typeof(diss_prepost_w_kovar_analy$theorie_r_43_5)


names(diss_prepost_w_kovar_analy)[89] <- "theorie_r_43_1"
names(diss_prepost_w_kovar_analy)[92] <- "theorie_r_43_2"
names(diss_prepost_w_kovar_analy)[95] <- "theorie_r_43_7"
names(diss_prepost_w_kovar_analy)[99] <- "theorie_r_43_3"
names(diss_prepost_w_kovar_analy)[102] <- "theorie_r_43_4"
names(diss_prepost_w_kovar_analy)[105] <- "theorie_r_43_5"


# AV theorie_43_5 ####
# sem ohne latente variable T1 und ohne Interaktionseffekt #
  library(lavaan)
  model_theorie_43_5_oloi <- '
                 theorie_r_43_5 ~  theorie_r_43_1
                        + theorie_r_43_2
                        + theorie_r_43_7
                        + llm
              '

  fittheorie_43_5_oloi <- sem(data=diss_prepost_w_kovar_analy
                      , model=model_theorie_43_5_oloi
                      , missing="fiml"
                      )

    summary(fittheorie_43_5_oloi
           , fit.measures=TRUE
      )

  remove(model_theorie_43_5_oloi)

# sem mit latente variable T1 und ohne Interaktionseffekt
  library(lavaan)
  model_theorie_43_5_mloi <- '
                 T1 =~ theorie_r_43_1
                       + theorie_r_43_2
                       + theorie_r_43_7

                 theorie_r_43_5 ~  T1
                        + llm
              '

  fittheorie_43_5_mloi <- sem(data=diss_prepost_w_kovar_analy
                      , model=model_theorie_43_5_mloi
                      , missing="fiml"
                      )
  
    summary(fittheorie_43_5_mloi
           , fit.measures=TRUE
      )

  remove(model_theorie_43_5_mloi)


# AV theorie_43_3 ####
# sem ohne latente variable T1 und ohne Interaktionseffekt #
  library(lavaan)
  model_theorie_43_3_oloi <- '
                 theorie_r_43_3 ~  theorie_r_43_1
                        + theorie_r_43_2
                        + theorie_r_43_7
                        + llm
              '

  fittheorie_43_3_oloi <- sem(data=diss_prepost_w_kovar_analy
                      , model=model_theorie_43_3_oloi
                      , missing="fiml"
                      )

    summary(fittheorie_43_3_oloi
           , fit.measures=TRUE
      )

  remove(model_theorie_43_3_oloi)

# sem mit latente variable T1 und ohne Interaktionseffekt
  library(lavaan)
  model_theorie_43_3_mloi <- '
                 T1 =~ theorie_r_43_1
                       + theorie_r_43_2
                       + theorie_r_43_7

                 theorie_r_43_3 ~  T1
                        + llm
              '

  fittheorie_43_3_mloi <- sem(data=diss_prepost_w_kovar_analy
                      , model=model_theorie_43_3_mloi
                      , missing="fiml"
                      )
  
    summary(fittheorie_43_3_mloi
           , fit.measures=TRUE
      )

  remove(model_theorie_43_3_mloi)



# AV theorie_43_4 ####
# sem ohne latente variable T1 und ohne Interaktionseffekt #
  library(lavaan)
  model_theorie_43_4_oloi <- '
                 theorie_r_43_4 ~  theorie_r_43_1
                        + theorie_r_43_2
                        + theorie_r_43_7
                        + llm
              '

  fittheorie_43_4_oloi <- sem(data=diss_prepost_w_kovar_analy
                      , model=model_theorie_43_4_oloi
                      , missing="fiml"
                      )

    summary(fittheorie_43_4_oloi
           , fit.measures=TRUE
      )

  remove(model_theorie_43_4_oloi)

# sem mit latente variable T1 und ohne Interaktionseffekt
  library(lavaan)
  model_theorie_43_4_mloi <- '
                 T1 =~ theorie_r_43_1
                       + theorie_r_43_2
                       + theorie_r_43_7

                 theorie_r_43_4 ~  T1
                        + llm
              '

  fittheorie_43_4_mloi <- sem(data=diss_prepost_w_kovar_analy
                      , model=model_theorie_43_4_mloi
                      , missing="fiml"
                      )
  
    summary(fittheorie_43_4_mloi
           , fit.measures=TRUE
      )

  remove(model_theorie_43_4_mloi)