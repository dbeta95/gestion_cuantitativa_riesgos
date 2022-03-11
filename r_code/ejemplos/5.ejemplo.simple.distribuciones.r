# Ejemplo simple de manejo de distribuciones
a = 1.5; b = 2; x = 3;
pgamma(x, shape=a, scale = b, lower.tail = TRUE)

pgamma(x, shape=a, scale = b, lower.tail = FALSE)

qgamma(0.99, shape=a, scale = b)

x = seq(0,16,0.05)
fx = dgamma(x,shape=a, scale = b)
par(mfrow=c(2,2))
plot(x,fx,type='l')
abline(h=0)
points(a*b,0,pch=19,col='red')

plot(x,fx,type='l')
abline(h=0)
polygon(c(x[x>=8.5], 8.5), c(fx[x>=8.5], 0), col="red")

n = 500
Xn = rgamma(n,shape=a, scale = b)
hist(Xn,100)
plot(density(Xn))