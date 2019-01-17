#install.packages("jpeg")
#install.packages("ggplot2")
library(jpeg)
library(ggplot2)
#dFile <- download.file("http://www.utdallas.edu/~axn112530/cs6375/unsupervised/images/image1.jpg", "image1.jpg")
img <- readJPEG("image1.jpg")

imgDm <- dim(img)
imgRGB <- data.frame(
  x = rep(1:imgDm[2], each = imgDm[1]),
  y = rep(imgDm[1]:1, imgDm[2]),
  R = as.vector(img[,,1]),
  G = as.vector(img[,,2]),
  B = as.vector(img[,,3])
)

kClusters <- 2
kMeans <- kmeans(imgRGB[, c("R", "G", "B")], centers = kClusters)
kColours <- rgb(kMeans$centers[kMeans$cluster,])


ggplot(data = imgRGB, aes(x = x, y = y)) + 
  geom_point(colour = kColours)