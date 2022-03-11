#---Ejemplo A.6.4 lectura de una URL
archivo = "http://www.stats.ox.ac.uk/pub/datasets/csb/ch4a.dat"
G <- read.table(archivo,header=FALSE)
head(G)
attach(G)

#-----------------------grafica
np = length(V1)
#-----------------------convierte fecha a formato de R

fechas = seq(as.Date("2000/1/1"), by = "month", length.out = length(V1))
ejex.mes = seq(fechas[1],fechas[np], "months")
ejex.a?o = seq(fechas[1],fechas[np],"years")

plot(fechas,V2, xaxt="n", panel.first = grid(),
type='h',ylab='produccion.diaria',lwd=2)
axis.Date(1, at=ejex.mes, format="%m/%y")
axis.Date(1, at=ejex.a?o, labels = FALSE, tcl = -0.2)

par(mfrow=c(2,1))

plot(fechas,V1, xaxt="n", panel.first = grid(),
type='b',ylab='produccion.diaria')
axis.Date(1, at=ejex.mes, format="%m/%y")
axis.Date(1, at=ejex.a?o, labels = FALSE, tcl = -0.2)

hist(V3,15)

