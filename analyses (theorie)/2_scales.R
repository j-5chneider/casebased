# densityplot der Variablen A43_1, A43_2, A43_7, A43_5 ####
# um zu sehen, wie sie verteilt sind 
library(ggplot2)
p <- ggplot(diss_prepost_w_kovar_analy
            , aes(x=theorie_r_43_1)
            )

p + geom_density(color="#006600"
                 , size=1
                 , alpha=.7
                 , na.rm=TRUE
                 ) + 
    geom_density(data=diss_prepost_w_kovar_analy
                 , aes(x=theorie_r_43_2)
                 , color="#33CC33"
                 , size=1
                 , na.rm=TRUE
                 ) +
    geom_density(data=diss_prepost_w_kovar_analy
                 , aes(x=theorie_r_43_7)
                 , color="#99FF00"
                 , size=1
                 , na.rm=TRUE
                 ) +
    geom_density(data=diss_prepost_w_kovar_analy
                 , aes(x=theorie_r_43_3)
                 , color="#660066"
                 , size=1
                 , na.rm=TRUE
                 ) +
    geom_density(data=diss_prepost_w_kovar_analy
                 , aes(x=theorie_r_43_4)
                 , color="#CC33CC"
                 , size=1
                 , na.rm=TRUE
                 ) +
    geom_density(data=diss_prepost_w_kovar_analy
                 , aes(x=theorie_r_43_5)
                 , color="#CC66FF"
                 , size=1
                 , na.rm=TRUE
                 )


