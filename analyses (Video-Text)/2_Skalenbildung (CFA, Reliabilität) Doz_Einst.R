library(lavaan)
mymodel <- ' doz_einst =~ lambd*doz_pass
                      + lambd*doz_gef'

fit <- cfa(data=diss_prepost_w_kovar_analy, model=mymodel)

summary(fit, fit.measures=TRUE)
rm(fit, mymodel)

##################
library(psych)
tmp <- diss_prepost_w_kovar_analy[c("doz_gef", "doz_pass")]
alpha(tmp, na.rm=TRUE, use="pairwise.complete.obs")