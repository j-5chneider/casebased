library(tidyverse)


obs_miss <- diss_prepost_w_kovar_analy %>%
  select(theorie.r.43.1, theorie.r.43.2, theorie.r.43.7, theorie.r.43.3, 
         theorie.r.43.4, theorie.r.43.5, alter:anwesend_z, -seminartyp)

naniar::vis_miss(obs_miss)
gg_miss_upset(obs_miss, nsets = 10)

## checking MAR assumption
library(VIM)
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.3", "T1.anstrS")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.3", "T1.anstrT")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.3", "nfc")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.3", "T1.RefBer1")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.3", "T1.RefBer2")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.3", "T1.ind.wert.util")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.3", "T1.ind.wert.cost")])

marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.3", "theorie.r.43.1")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.3", "theorie.r.43.2")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.3", "theorie.r.43.7")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.4", "theorie.r.43.1")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.4", "theorie.r.43.2")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.4", "theorie.r.43.7")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.5", "theorie.r.43.1")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.5", "theorie.r.43.2")])
marginplot(diss_prepost_w_kovar_analy[,c("theorie.r.43.5", "theorie.r.43.7")])


library(mice)
library(miceadds)
## predictor selection ##########################################################
library(corrgram)
corrgram(obs_miss, lower.panel = "panel.pie", upper.panel = "panel.cor") # modellimmanente Var + Länge scheinen die einzigen guten Prädiktoren zu sein

corrgram(cor(y = obs_miss, x = !is.na(obs_miss), use = "pair"), lower.panel = "panel.pie", upper.panel = "panel.pie")

obs_miss <- diss_prepost_w_kovar_analy %>%
  select(theorie.r.43.1, theorie.r.43.2, theorie.r.43.7, theorie.r.43.3, theorie.r.43.4, 
         theorie.r.43.5, llm:anwesend_z, geschl.., semester, nfc, T1.int, T2.int, seminar)

# establishing object with standard values
ini <- mice(obs_miss, 
            maxit = 0)

## define predictor matrix
pred <- ini$predictorMatrix

for(i in attr(pred, "dimnames")[[1]]) {
  pred[i,] <- c(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,-2)
  pred[i,i] <- 0
}

## define imputation method
meth <- ini$meth
meth <- c("2l.pmm", "2l.pmm", "2l.pmm", "2l.pmm", "2l.pmm", "2l.pmm", 
          "2l.binary", "2l.binary", "2l.pmm", "2l.pmm", "2l.pmm", 
          "2l.pmm", "2l.pmm", "2l.pmm", "2l.pmm", "2l.pmm", "", "",
          "2l.pmm", "2l.pmm", "2l.pmm", "polyreg", "2l.pmm", 
          "2l.pmm", "2l.pmm", "2l.pmm", "polyreg")

## categorical variables as factor
obs_miss$llm <- as.factor(obs_miss$llm)
obs_miss$medium <- as.factor(obs_miss$medium)
obs_miss$geschl.. <- as.factor(obs_miss$geschl..)
obs_miss$seminar <- as.integer(obs_miss$seminar)

## desciding visiting sequence:
## in order of missingness, from least to most missing
naniar::vis_miss(obs_miss)

## impute
imp_diss <- mice(obs_miss, 
                 maxit = 5, 
                 m = 5,
                 meth = meth,
                 pred = pred,
                 seed = 666
)

## check for implausible values
stripplot(imp_diss, pch = 20, cex = 1.2)

## check methods
## 