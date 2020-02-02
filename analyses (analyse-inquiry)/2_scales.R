diss_prepost_w_kovar_analy <- diss_prepost_w_kovar

# Skala Analyse 43_1 ####
diss_prepost_w_kovar_analy$A43_1 <- rowMeans(diss_prepost_w_kovar_analy[c(
                                                                          "A43_1_1" 
                                                                          ,"A43_1_10"
                                                                          ,"A43_1_11" 
                                                                          ,"A43_1_12" 
                                                                          ,"A43_1_13" 
                                                                          ,"A43_1_14" 
                                                                          ,"A43_1_15" 
                                                                          ,"A43_1_16" 
                                                                          ,"A43_1_17" 
                                                                          ,"A43_1_18" 
                                                                          ,"A43_1_2" 
                                                                          ,"A43_1_3" 
                                                                          ,"A43_1_4" 
                                                                          ,"A43_1_5" 
                                                                          ,"A43_1_6" 
                                                                          ,"A43_1_7" 
                                                                          ,"A43_1_8" 
                                                                          ,"A43_1_9"
                                                                        )]
                                           , na.rm=TRUE
                                           )



# Skala Analyse 43_2 ####
diss_prepost_w_kovar_analy$A43_2 <- rowMeans(diss_prepost_w_kovar_analy[c(
                                                                          "A43_2_1" 
                                                                          ,"A43_2_10"
                                                                          ,"A43_2_11" 
                                                                          ,"A43_2_12" 
                                                                          ,"A43_2_13" 
                                                                          ,"A43_2_14" 
                                                                          ,"A43_2_15" 
                                                                          ,"A43_2_2" 
                                                                          ,"A43_2_3" 
                                                                          ,"A43_2_4" 
                                                                          ,"A43_2_5" 
                                                                          ,"A43_2_6" 
                                                                          ,"A43_2_7" 
                                                                          ,"A43_2_8" 
                                                                          ,"A43_2_9"
                                                                        )]
                                           , na.rm=TRUE
                                           )



# Skala Analyse 43_7 ####
diss_prepost_w_kovar_analy$A43_7 <- rowMeans(diss_prepost_w_kovar_analy[c(
                                                                          "A43_7_1" 
                                                                          ,"A43_7_10"
                                                                          ,"A43_7_11" 
                                                                          ,"A43_7_12" 
                                                                          ,"A43_7_13" 
                                                                          ,"A43_7_14" 
                                                                          ,"A43_7_15" 
                                                                          ,"A43_7_16" 
                                                                          ,"A43_7_17" 
                                                                          ,"A43_7_18" 
                                                                          ,"A43_7_2" 
                                                                          ,"A43_7_3" 
                                                                          ,"A43_7_4" 
                                                                          ,"A43_7_5" 
                                                                          ,"A43_7_6" 
                                                                          ,"A43_7_7" 
                                                                          ,"A43_7_8" 
                                                                          ,"A43_7_9"
                                                                        )]
                                           , na.rm=TRUE
                                           )



# Skala Analyse 43_3 ####
diss_prepost_w_kovar_analy$A43_3 <- rowMeans(diss_prepost_w_kovar_analy[c(
                                                                          "A43_3_1" 
                                                                          ,"A43_3_10"
                                                                          ,"A43_3_11" 
                                                                          ,"A43_3_12" 
                                                                          ,"A43_3_2" 
                                                                          ,"A43_3_3" 
                                                                          ,"A43_3_4" 
                                                                          ,"A43_3_5" 
                                                                          ,"A43_3_6" 
                                                                          ,"A43_3_7" 
                                                                          ,"A43_3_8" 
                                                                          ,"A43_3_9"
                                                                        )]
                                           , na.rm=TRUE
                                           )



# Skala Analyse 43_4 ####
diss_prepost_w_kovar_analy$A43_4 <- rowMeans(diss_prepost_w_kovar_analy[c(
                                                                          "A43_4_1" 
                                                                          ,"A43_4_10"
                                                                          ,"A43_4_11" 
                                                                          ,"A43_4_12" 
                                                                          ,"A43_4_13"  
                                                                          ,"A43_4_2" 
                                                                          ,"A43_4_3" 
                                                                          ,"A43_4_4" 
                                                                          ,"A43_4_5" 
                                                                          ,"A43_4_6" 
                                                                          ,"A43_4_7" 
                                                                          ,"A43_4_8" 
                                                                          ,"A43_4_9"
                                                                        )]
                                           , na.rm=TRUE
                                           )



# Skala Analyse 43_5 ####
diss_prepost_w_kovar_analy$A43_5 <- rowMeans(diss_prepost_w_kovar_analy[c(
                                                                          "A43_5_1" 
                                                                          ,"A43_5_10"
                                                                          ,"A43_5_2" 
                                                                          ,"A43_5_3" 
                                                                          ,"A43_5_4" 
                                                                          ,"A43_5_5" 
                                                                          ,"A43_5_6" 
                                                                          ,"A43_5_7" 
                                                                          ,"A43_5_8" 
                                                                          ,"A43_5_9"
                                                                        )]
                                           , na.rm=TRUE
                                           )


# densityplot der Variablen A43_1, A43_2, A43_7, A43_5 ####
# um zu sehen, wie sie verteilt sind 
library(ggplot2)
p <- ggplot(diss_prepost_w_kovar_analy
            , aes(x=A43_1)
            )

p + geom_density(color="#006600"
                 , size=1
                 , alpha=.7
                 , na.rm=TRUE
                 ) + 
    geom_density(data=diss_prepost_w_kovar_analy
                 , aes(x=A43_2)
                 , color="#33CC33"
                 , size=1
                 , na.rm=TRUE
                 ) +
    geom_density(data=diss_prepost_w_kovar_analy
                 , aes(x=A43_7)
                 , color="#99FF00"
                 , size=1
                 , na.rm=TRUE
                 ) +
    geom_density(data=diss_prepost_w_kovar_analy
                 , aes(x=A43_3)
                 , color="#660066"
                 , size=1
                 , na.rm=TRUE
                 ) +
    geom_density(data=diss_prepost_w_kovar_analy
                 , aes(x=A43_4)
                 , color="#CC33CC"
                 , size=1
                 , na.rm=TRUE
                 ) +
    geom_density(data=diss_prepost_w_kovar_analy
                 , aes(x=A43_5)
                 , color="#CC66FF"
                 , size=1
                 , na.rm=TRUE
                 )


