#input library function for SOM
library(kohonen)

# load the data set 
data(iris)
head(iris)
str(iris)

#standardize the data (preprocessing of the data)
iris_scale<-scale(iris[-5])
iris_scale

#data classification and mapping 
grid =somgrid(xdim=5, ydim=5, topo=c("hexagonal"))
grid
som.iris<-som(iris_scale, grid=somgrid(5,5,"hexagonal"))
som.iris
plot(som.iris)
som.iris$grid$pts

#clustering :  grouping based on value  of the nodes 
hclust(dist(som.iris$codes[[1]]))
peta<-cutree(hclust(dist(som.iris$codes[[1]])), 3)
plot(som.iris, type="codes", bgcol=rainbow(3) [peta])
add.cluster.boundaries(som.iris, peta)

