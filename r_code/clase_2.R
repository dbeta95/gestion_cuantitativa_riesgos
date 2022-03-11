
# Clase 2 -----------------------------------------------------------------
# 10/03/2022 --------------------------------------------------------------


# Ejemplo data.frame ------------------------------------------------------

e = c(34,35,56,78)
g = c("h", "m", "m", "m")
s = c(3.4, 4.5, 2.4, 12.3)
D = data.frame(edad = e, genero = g, salario = s)
str(D)

es = D$salario/D$edad
es

D = read.table(text =
  'Nombre Mes Rate1 Rate2
Aira 1 12 23
Aira 2 18 73
Aira 3 19 45
Ben 1 53 19
Ben 2 22 87
Ben 3 19 45
Cat 1 22 87
Cat 2 67 43
Cat 3 45 32', header = TRUE
)

D

Mmes = aggregate(D[, 3:4], list(D$Mes), mean)
DSmes = aggregate(D[, 3:4], list(D$Mes),sd)

(Cv = DSmes/Mmes)


# Concepto de listas ------------------------------------------------------

a = matrix(c(2,3,4,5), 2, 2)
a
b = c('web', 'real')
b
d <- runif(120)
L <- list(a=a, b=b, d=d)
str(L)
L$b
y = L$d
hist(y, 30)


# read.table --------------------------------------------------------------
archivo <- "http://www.stats.ox.ac.uk/pub/datasets/csb/ch4a.dat"

G <- read.table(archivo, header=FALSE)
head(G)

attach(G)

np = length(V1)
np

G$V1

fechas <- seq(as.Date("2000/1/1"), by = 'month', 
              length.out = np)

ejex.mes <- seq(fechas[1], fechas[np], "months")
ejex.ano <- seq(fechas[1], fechas[np], "years")

par(mfrow=c(2,1))

plot(fechas, V1, xaxt="n", panel.first = grid(),
     type='b', ylab='produccion.diaria')
axis.Date(1, at=ejex.mes, format='%m/%y')
axis.Date(1, at=ejex.ano, labels=FALSE, tcl=-0.2)

hist(V3, 15)


