library(BFpack)
library(bain)
library(MASS)
# Frequentist one sample t test at the null point mu=5 on the therapeutic data
ttest1 <- t_test(therapeutic,mu=5)
print(ttest1)
# confirmatory Bayesian one sample t test
BF1 <- BF(ttest1,"mu=4")
summary(BF1)


true_d <- .2 # conservative: testing for weak differences between groups (Cohen's d, small effect)

for (true_eff in c("no effect", "true effect: d= .2")) { 

data <- data.frame(mvrnorm(n=645,
                           mu = if(true_eff == "no effect") c(0,0)
                                else c(0, true_d),
                           Sigma = matrix(c( 1, .3,
                                            .3,  1),
                                          2, 2)
                           ))
t.test()

}

ggplot(tmp, aes(x=X1)) + geom_density(color="blue") + geom_density(aes(x=X2), color="red")


data.frame(mvrnorm(n=N,
                   mu = if(true_eff == "nonosp=nonvis=visosp")
                       c(0,0,0) else
                           if(true_eff == "nonosp<nonvis<visosp")
                               c(-true_d,0,true_d) else
                                   if(true_eff == "nonosp,nonvis,visosp")
                                       c(true_d, 0, -true_d) else
                                           c(-true_d,0,0),
                   Sigma = matrix(c( 1, .5, .3,
                                     .5, 1, .5,
                                     .3, .5, 1),
                                  3, 3)))


################################################################################## #
##                                         ####################################### #
## IMPUTATION AND BAYES FACTOR --EXAMPLE-- #########################################
##                                        ######################################## #
################################################################################## #

# generating data
tmp <- sleep
tmp[1:4, 1] <- NA # generating missings

# imputation
library(mice)
m <- 5             # number of imputations

imp <- mice(tmp,
            m=m)

fit <- with(imp, lm(extra ~ group - 1))
pooled <- pool(fit)


### compute vcov by hand ###
library(tidyverse)

# create data frame to collect var and cov for each imputation
vcov_df <- data.frame(var_g1 = as.numeric(),
                      var_g2 = as.numeric()#,
                      # covg1g2 = as.numeric()
                      )

## loop over all m imputations
for(i in 1:m) {
# compute variances of group 1 & 2
##### RESIDUAL VARIANCE OF MEAN IS SIMPLY THE VARIANCE?? ######
tmp <-  mice::complete(imp, i) %>%   # get complete data set from imputation i
              group_by(group) %>%    # group by grouping variable
              summarize(var(extra))  # get var

vcov_df[i, "var_g1"] <- tmp$`var(extra)`[1]  # put variance of group 1 in line i
vcov_df[i, "var_g2"] <- tmp$`var(extra)`[2]  # put variance of group 2 in line i
rm(tmp)                                      # drop object

# # compute covariance
# vcov_df[i, "covg1g2"] <- mice::complete(imp, i) %>%    # get complete data set from imputation i
#                                mutate(group = ifelse(group == 1, "group1", "group2")) %>%   # recode variable group to get better variable names
#                                pivot_wider(id="ID", names_from = "group", values_from = "extra") %>%  # make wide data set to compute cov
#                                summarize(cov(x=group1, y=group2))   # get cov
}


## make var matrices 
# compute the mean over var
vcov_df <- vcov_df %>%
        summarize_all(mean)

# create matrices
mat1 <- matrix(vcov_df$var_g1, 1, 1)
mat2 <- matrix(vcov_df$var_g2, 1, 1)

variances <- list(mat1, mat2)


## BAIN ##### #
# generating hypotheses
hypotheses <- "group1 = group2; group1 < group2"

# transposing data: pooled fit objects are different as normal lm() objects
bf_data <- as.numeric(data.frame(t(pooled$pooled))[1,])
names(bf_data) <- c("group1", "group2")

# sample size per group
samp_gr <- table(sleep$group)

library(bain)
bf_sleep <- bain(bf_data, 
                 hypothesis = hypotheses,
                 n = samp_gr,           # size of the groups
                 Sigma = variances,     # matrices of residual variances of groups
                 group_parameters = 1,  # there is 1 group specific parameter (the mean in each group)
                 joint_parameters = 0   # there are no parameters that apply to each of the groups (e.g. the regression coefficient of a covariate)
                 )

print(bf_sleep)
print(bf_sleep$BFmatrix)

################################################################################## #
##                                             ################################### #
## IMPUTATION AND BAYES FACTOR --APPLICATION-- #####################################
##                                             ################################### #
################################################################################## #

#### dealing with missings ############################################### #
    # get data frame and the relevant variables
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
    
    ## MICE: IMPUTE DATA ############################################## #
    m <- 100    # nuber of imputations
    
    imp_diss <- mice(obs_miss, 
                     maxit = 20, 
                     m = m,
                     meth = meth,
                     pred = pred,
                     seed = 666
                     )
    
    ## check convergence
    plot(imp_diss, c("alter", "llm"))
    
    ## check for implausible values
    # stripplot(imp_diss, pch = 20, cex = 1.2)    # not so clever with high m

    ### WITH: COMPUTING MODEL ######################################### #
    fit <- with(imp_diss, lm(alter ~ llm - 1))
    
    ### POOL: POOL ESTIMATES  ######################################### #
    pooled <- pool(fit)


    
#### BAIN: TESTING HYPOTHESES ############################################### #
    ### preparing input: fine, I'll do it myself
        # compute vcov by hand ###
        library(tidyverse)
        
        # create data frame to collect var and cov for each imputation
        vcov_df <- data.frame(var_g1 = as.numeric(),
                              var_g2 = as.numeric()
                              )
        
        ## loop over all m imputations
        for(i in 1:m) {
            # compute variances of group 1 & 2
            ##### RESIDUAL VARIANCE OF MEAN IS SIMPLY THE VARIANCE?? ######
            tmp <-  mice::complete(imp_diss, i) %>%   # get complete data set from imputation i
                group_by(llm) %>%    # group by grouping variable
                summarize(var(alter))  # get var
            
            vcov_df[i, "var_g1"] <- tmp$`var(alter)`[1]  # put variance of group 1 in line i
            vcov_df[i, "var_g2"] <- tmp$`var(alter)`[2]  # put variance of group 2 in line i
            rm(tmp)                                      # drop object
        }
        
        
        ## make var matrices 
        # compute the mean over var
        vcov_df <- vcov_df %>%
            summarize_all(mean)
        
        # create matrices
        mat1 <- matrix(vcov_df$var_g1, 1, 1)
        mat2 <- matrix(vcov_df$var_g2, 1, 1)
        
        variances <- list(mat1, mat2)


    ### computing BFs ##################################################### #
        # generating hypotheses
        hypotheses <- "llm0 = llm1"
        
        # transposing data: pooled fit objects are different as normal lm() objects
        bf_data <- as.numeric(data.frame(t(pooled$pooled))[1,])
        names(bf_data) <- c("llm0", "llm1")
        
        # sample size per group
        samp_gr <- table(obs_miss$llm)
        
        library(bain)
        bf_sleep <- bain(bf_data, 
                         hypothesis = hypotheses,
                         n = samp_gr,           # size of the groups
                         Sigma = variances,     # matrices of residual variances of groups
                         group_parameters = 1,  # there is 1 group specific parameter (the mean in each group)
                         joint_parameters = 0   # there are no parameters that apply to each of the groups (e.g. the regression coefficient of a covariate)
        )
        
        # output
        print(bf_sleep)
        print(bf_sleep$BFmatrix)
        