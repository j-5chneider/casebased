# Item Discrimonation Indices ####

library(CDM)

tmp <- data.frame(diss_raw)
tmp <- tmp[c("Beschreibung",
             "Handlung.01",
             "Alternativen.01",
             "Beweise.01",
             "Entscheidung.01"
             )
           ]

tmp_q_matrix <- matrix(c(1,1,1,1,1), nrow=5, ncol=1)

tmp <- din(data=tmp, q.matrix=tmp_q_matrix)

  rm(tmp_q_matrix)

tmp_cdi <- cdi.kli(tmp)
tmp_cdi$glob_item_disc

  rm(tmp_cdi, tmp)