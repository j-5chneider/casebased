# CFA Selektion ####
library(dplyr)
glimpse(diss_prepost_w_kovar_analy)
library(lavaan)
# 1 Dimensionales Modell
model_1D <- '
          anzahlT1 =~ anz.komm.43.1
                    + anz.komm.43.2
                    + anz.komm.43.7

            '

fit_1D <- cfa(model_1D, 
              data = diss_prepost_w_kovar_analy
              )

summary(fit_1D, 
        fit.measures = TRUE
        )

# 2 Dimensionales Modell
model_2D <- '
          anzahlT1_txt =~ 1*anz.komm.43.1

          anzahlT1_vid =~ lVid*anz.komm.43.2
                        + lVid*anz.komm.43.7

          # residual variance
          anz.komm.43.1 ~~ 0*anz.komm.43.1
            '
fit_2D <- cfa(model_2D,
              data = diss_prepost_w_kovar_analy,
              std.lv = TRUE
              )

summary(fit_2D,
        fit.measures = TRUE
        )


# Modellvergleich
anova(fit_1D, fit_2D)
