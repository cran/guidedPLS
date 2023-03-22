## ----data, echo=TRUE----------------------------------------------------------
library("guidedPLS")
data <- guidedPLS::toyModel("Easy")
str(data, 2)

## ----data2, echo=TRUE, fig.height=6, fig.width=6------------------------------
suppressMessages(library("fields"))
layout(c(1,2,3))
image.plot(data$Y1_dummy, main="Y1 (Dummy)", legend.mar=8)
image.plot(data$Y1, main="Y1", legend.mar=8)
image.plot(data$X1, main="X1", legend.mar=8)

## ----plssvd, echo=TRUE--------------------------------------------------------
out <- guidedPLS(X1=data$X1, X2=data$X2, Y1=data$Y1, Y2=data$Y2, k=2)

## ----plotplssvd, echo=TRUE, fig.height=4, fig.width=4-------------------------
plot(rbind(out$scoreX1, out$scoreX2), col=c(data$col1, data$col2),
pch=c(rep(2, length=nrow(out$scoreX1)), rep(3, length=nrow(out$scoreX2))))
legend("bottomleft", legend=c("XY1", "XY2"), pch=c(2,3))

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

