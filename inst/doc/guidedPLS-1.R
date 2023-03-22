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
out1 <- PLSSVD(X=data$X1, Y=data$Y1, k=2)

## ----plotplssvd, echo=TRUE, fig.height=4, fig.width=4-------------------------
plot(out1$scoreX, col=data$col1, pch=16)

## ----plssvd2, echo=TRUE-------------------------------------------------------
out2 <- PLSSVD(X=data$X1, Y=data$Y1, k=2, deflation=TRUE)

## ----plotplssvd2, echo=TRUE, fig.height=4, fig.width=4------------------------
plot(out2$scoreX, col=data$col1, pch=16)

## ----plsda, echo=TRUE---------------------------------------------------------
out3 <- PLSSVD(X=data$X1, Y=data$Y1_dummy, k=2, fullrank=TRUE)

## ----plotplsda, echo=TRUE, fig.height=4, fig.width=4--------------------------
plot(out3$scoreX, col=data$col1, pch=16)

## ----splsda, echo=TRUE--------------------------------------------------------
out4 <- sPLSDA(X=data$X1, Y=data$Y1_dummy, k=2, lambda=30)

## ----plotsplsda, echo=TRUE, fig.height=4, fig.width=4-------------------------
plot(out4$scoreX, col=data$col1, pch=16)

## ----plotsplsda2, echo=TRUE, fig.height=4, fig.width=8------------------------
layout(cbind(1:2, 3:4))
barplot(out3$loadingX[,1], main="PLSDA (1st loading)")
barplot(out3$loadingX[,2], main="PLSDA (2nd loading)")
barplot(out4$loadingX[,1], main="sPLSDA (1st loading)")
barplot(out4$loadingX[,2], main="sPLSDA (2nd loading)")

## ----noisydata, echo=TRUE-----------------------------------------------------
data2 <- guidedPLS::toyModel("Hard")
str(data2, 2)

## ----noisydata2, echo=TRUE, fig.height=6, fig.width=6-------------------------
layout(t(1:2))
image.plot(data$X1, main="X1", legend.mar=8)
image.plot(data2$X1, main="X1 (Noisy)", legend.mar=8)

## ----noisypca, echo=TRUE------------------------------------------------------
out.pca <- prcomp(data2$X1, center=TRUE, scale=FALSE)

## ----noisypcada, echo=TRUE----------------------------------------------------
out5 <- PLSSVD(X=data2$X1, Y=data2$Y1_dummy, k=2, fullrank=TRUE)

## ----noisyplot, echo=TRUE, fig.height=4, fig.width=8--------------------------
layout(t(1:2))
plot(out.pca$x[, 1:2], col=data2$col1, main="PCA", pch=16)
plot(out5$scoreX, col=data2$col1, main="PLS-DA", pch=16)

## ----noisyplot2, echo=TRUE, fig.height=4, fig.width=8-------------------------
layout(t(1:2))
image.plot(cor(out5$scoreX, out.pca$x[,1:2]),
xlab="PLS-DA (Noisy)", ylab="PCA (Noisy)", legend.mar=8)
image.plot(cor(out5$scoreX, out3$scoreX),
xlab="PLS-DA (Noisy)", ylab="PLS-DA", legend.mar=8)

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

