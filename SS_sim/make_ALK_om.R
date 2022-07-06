
# Create Age comps to simulate ALK ----------------------------------------

ageMat1 = data.frame(Lbin_lo = seq(2,120,2),Lbin_hi = seq(2,120,2))
ageMat2 = expand.grid(yr = 1:75, month = 1, fleet = 1:2, sex = 0, part = 0, ageerr = 0)
ageMat3 = ageMat1[rep(seq_len(nrow(ageMat1)), times = nrow(ageMat2)), ]
ageMat4 = ageMat2[rep(seq_len(nrow(ageMat2)), each = nrow(ageMat1)), ]
ageMat5 = cbind(ageMat4, ageMat3)
ageMat5$Nsamp = 100
ageMat6 = matrix(1, ncol = 21, nrow = nrow(ageMat5))
ageMat7 = cbind(ageMat5, as.data.frame(ageMat6))
head(ageMat7)
dim(ageMat7)

write.csv(ageMat7, 'ALK_agecomps.csv', row.names = FALSE)
