# AV 43_5 ####
# sem ohne latente variable T1 und ohne Interaktionseffekt #
  library(lavaan)
  model_43_5_oloi <- '
                 A43_5 ~  A43_1
                        + A43_2
                        + A43_7
                        + llm
              '

  fit43_5_oloi <- sem(data=diss_prepost_w_kovar_analy
                      , model=model_43_5_oloi
                      , missing="fiml"
                      )
  fit43_5_oloi
    summary(fit43_5_oloi
           , fit.measures=TRUE
      )

  remove(model_43_5_oloi)

# sem mit latente variable T1 und ohne Interaktionseffekt
  library(lavaan)
  model_43_5_mloi <- '
                 T1 =~ A43_1
                       + A43_2
                       + A43_7

                 A43_5 ~  T1
                        + llm
              '

  fit43_5_mloi <- sem(data=diss_prepost_w_kovar_analy
                      , model=model_43_5_mloi
                      , missing="fiml"
                      )
  fit43_5_mloi
    summary(fit43_5_mloi
           , fit.measures=TRUE
      )

  remove(model_43_5_mloi)


# sem ohne latente variable T1 und mit Interaktionseffekt
# sem mit latente variable T1 und mit Interaktionseffekt