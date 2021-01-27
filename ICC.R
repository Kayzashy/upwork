library(ICCbin)
library(dplyr)

bccdata <- rcbin(prop = .4, prvar = .2, noc = 30, csize = 20, csvar = .2, rho = .2)

total <- var(bccdata$y)

between <- bccdata %>% group_by(cid) %>% summarise(avg = mean(y)) %>% select(avg) %>% var()

icc <- between/total

iccbin(cid = cid, y = y, data = bccdata)
iccbin(cid = cid, y = y, data = bccdata, method = c("aov", "fc"), ci.type = "fc")

