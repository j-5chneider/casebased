# Reliabilität Reflexionsbereitschaft Einstellungsbezogen T2 (T2.RefBer2.5:T2.RefBer2.9) ####
  rel_refber2 <- data.frame(diss_prepost_w_kovar_analy[c("T2.RefBer2.5", "T2.RefBer2.6", "T2.RefBer2.7", "T2.RefBer2.8", "T2.RefBer2.9")])
  #McDonalds Omega
    library(psych)
    omega(rel_refber2, nfactors=1)

  # CFA
    library(lavaan)
    rel_refber2$T2.RefBer2.5 <- as.numeric(rel_refber2$T2.RefBer2.5)
    rel_refber2$T2.RefBer2.6 <- as.numeric(rel_refber2$T2.RefBer2.6)
    rel_refber2$T2.RefBer2.7 <- as.numeric(rel_refber2$T2.RefBer2.7)
    rel_refber2$T2.RefBer2.8 <- as.numeric(rel_refber2$T2.RefBer2.8)
    rel_refber2$T2.RefBer2.9 <- as.numeric(rel_refber2$T2.RefBer2.9)


    model <- '
              ref_ber2 =~
                         T2.RefBer2.5
                       + T2.RefBer2.6
                       + T2.RefBer2.7
                       + T2.RefBer2.8
                       + T2.RefBer2.9
             '
    fit <- cfa(
               model
             , rel_refber2
             , missing="fiml"
             )
    summary(fit, fit.measures=TRUE)

    remove(fit, model, rel_refber2)


# Reliabilität Interesse Classroom Management T2 (T2.int.1:T2.int.6) ####
  rel_T2int <- data.frame(diss_prepost_kovar[c("T2.int.1", "T2.int.2", "T2.int.3", "T2.int.4", "T2.int.5", "T2.int.6")])
  #McDonalds Omega
    library(psych)
    omega(rel_T2int, nfactors=1)
    remove(rel_T2int)

  # CFA
    library(lavaan)
  diss_prepost_kovar$T2.int.1 <- as.numeric(diss_prepost_kovar$T2.int.1)
  diss_prepost_kovar$T2.int.2 <- as.numeric(diss_prepost_kovar$T2.int.2)
  diss_prepost_kovar$T2.int.3 <- as.numeric(diss_prepost_kovar$T2.int.3)
  diss_prepost_kovar$T2.int.4 <- as.numeric(diss_prepost_kovar$T2.int.4)
  diss_prepost_kovar$T2.int.5 <- as.numeric(diss_prepost_kovar$T2.int.5)
  diss_prepost_kovar$T2.int.6 <- as.numeric(diss_prepost_kovar$T2.int.6)


    model <- '
              T2_int =~
                         T2.int.1
                       + T2.int.2
                       + T2.int.3
                       + T2.int.4
                       + T2.int.5
                       + T2.int.6
             '
    fit <- cfa(
               model
             , diss_prepost_kovar
             , missing="fiml"
             )
    summary(fit, fit.measures=TRUE)

    remove(fit, model)

# Reliabilität konstruktivistische Lernüberzeugungen (T1.knstr.1:T1.knstr.6) ####
  rel_T2konst <- data.frame(diss_prepost_kovar[c("T2.knstr.1", "T2.knstr.2", "T2.knstr.3", "T2.knstr.4", "T2.knstr.5", "T2.knstr.6")])
  #McDonalds Omega
    library(psych)
    omega(rel_T2konst, nfactors=1)
    remove(rel_T2konst)

  # CFA
    library(lavaan)
    diss_prepost_kovar$T2.knstr.1 <- as.numeric(diss_prepost_kovar$T2.knstr.1)
    diss_prepost_kovar$T2.knstr.2 <- as.numeric(diss_prepost_kovar$T2.knstr.2)
    diss_prepost_kovar$T2.knstr.3 <- as.numeric(diss_prepost_kovar$T2.knstr.3)
    diss_prepost_kovar$T2.knstr.4 <- as.numeric(diss_prepost_kovar$T2.knstr.4)
    diss_prepost_kovar$T2.knstr.5 <- as.numeric(diss_prepost_kovar$T2.knstr.5)
    diss_prepost_kovar$T2.knstr.6 <- as.numeric(diss_prepost_kovar$T2.knstr.6)


    model <- '
              T2_kons =~
                         T2.knstr.1
                       + T2.knstr.2
                       + T2.knstr.3
                       + T2.knstr.4
                       + T2.knstr.5
                       + T2.knstr.6
             '
    fit <- cfa(
               model
             , diss_prepost_kovar
             , missing="fiml"
             )
    summary(fit, fit.measures=TRUE)

    remove(fit, model)


# Reliabilität Need for Cognition (nfc.1:nfc.10u) ####
  rel_nfc <- data.frame(diss_prepost_kovar[c("nfc.1", "nfc.2", "nfc.3u", "nfc.4u", "nfc.5u", "nfc.6u", "nfc.7u", "nfc.8", "nfc.9", "nfc.10u")])

  #McDonalds Omega
    library(psych)
    omega(rel_nfc, nfactors=1)

  # CFA
    library(lavaan)
    rel_nfc$nfc.1 <- as.numeric(rel_nfc$nfc.1)
    rel_nfc$nfc.2 <- as.numeric(rel_nfc$nfc.2)
    rel_nfc$nfc.3u <- as.numeric(rel_nfc$nfc.3u)
    rel_nfc$nfc.4u <- as.numeric(rel_nfc$nfc.4u)
    rel_nfc$nfc.5u <- as.numeric(rel_nfc$nfc.5u)
    rel_nfc$nfc.6u <- as.numeric(rel_nfc$nfc.6u)
    rel_nfc$nfc.7u <- as.numeric(rel_nfc$nfc.7u)
    rel_nfc$nfc.8 <- as.numeric(rel_nfc$nfc.8)
    rel_nfc$nfc.9 <- as.numeric(rel_nfc$nfc.9)
    rel_nfc$nfc.10u <- as.numeric(rel_nfc$nfc.10u)


    model <- '
              nfc =~
                         nfc.1
                       + nfc.2
                       + nfc.3u
                       + nfc.4u
                       + nfc.5u
                       + nfc.6u
                       + nfc.7u
                       + nfc.8
                       + nfc.9
                       + nfc.10u
             '
    fit <- cfa(
               model
             , rel_nfc
             , missing="fiml"
             , std.lv=TRUE 
             )
    summary(fit, fit.measures=TRUE)

    remove(fit, model, rel_nfc)

# Reliabilität Anstrengungsbereitschaft TRAIN (T2.anstrT.1:T2.anstrT.4) ####
  rel_Anst <- data.frame(diss_prepost_kovar[c(
                                              "T2.anstrT.1"
                                            , "T2.anstrT.2"
                                            , "T2.anstrT.3"
                                            , "T2.anstrT.4"
                                            )
                                            ]
                         )

  #McDonalds Omega
    library(psych)
    omega(rel_Anst, nfactors=1)

  # CFA
    library(lavaan)
    rel_Anst$T2.anstrT.1 <- as.numeric(rel_Anst$T2.anstrT.1)
    rel_Anst$T2.anstrT.2 <- as.numeric(rel_Anst$T2.anstrT.2)
    rel_Anst$T2.anstrT.3 <- as.numeric(rel_Anst$T2.anstrT.3)
    rel_Anst$T2.anstrT.4 <- as.numeric(rel_Anst$T2.anstrT.4)


    model <- '
              AnstrT =~
                         T2.anstrT.1
                       + T2.anstrT.2
                       + T2.anstrT.3
                       + T2.anstrT.4
             '
    fit <- cfa(
               model
             , rel_Anst
             , missing="fiml"
             , std.lv=TRUE 
             )
    summary(fit, fit.measures=TRUE)

    remove(fit, model, rel_Anst)