library(spdep)
library(sf)

##--- loading data ----

data(GGHB.IZ, package = "CARBayesdata")
data(respiratorydata, package = "CARBayesdata")

my_dt <- merge(x = GGHB.IZ,
               y = respiratorydata, by = "IZ",
               all.x = FALSE)

##---++ defining neighborhood ++----

N <- nrow(my_dt)
neigh <- poly2nb(pl = my_dt)
nb_info <- nb2WB(neigh)
W <- nb2mat(neigh, zero.policy = TRUE,
            style = "B")

bck <- grDevices::rgb(253, 246, 227, maxColorValue = 256)
col1 <- "#ADD8E6"
col2 <- "mediumpurple4"
col3 <- "magenta3"
hgl <- 4
## hgl <- 19
## hgl <- 134 # checked all belo 38

par(bg = bck)
plot(st_geometry(my_dt), col = bck, border = "gray20")
plot(neigh,
     st_coordinates(st_centroid(my_dt)),
     add = TRUE, pch = 19,
     col = col1,
     cex = 0.6)
points(st_coordinates(st_centroid(my_dt)),
       pch = 19, col = col1, cex = .6)
plot(subset(neigh, seq_len(N) %in% c(hgl, neigh[[hgl]])),
     st_coordinates(st_centroid(my_dt))[c(hgl, neigh[[hgl]]), ],
     add = TRUE, pch = 19,
     col = col2,
     cex = 0.6)
points(st_coordinates(st_centroid(my_dt))[c(hgl, neigh[[hgl]]), ],
       pch = 19, col = col2, cex = .6)
points(st_coordinates(st_centroid(my_dt))[hgl, , drop = FALSE],
       pch = 1, col = col3)
