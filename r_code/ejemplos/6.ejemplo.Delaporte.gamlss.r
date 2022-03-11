----- Ejemplo con distribucion DEL
require(gamlss)

nu = 0.2
sigma = 1.2
mu = 42.5
#----------grafica densidad
par(mfrow=c(2,2))
x = seq(0,220,1)
y = dDEL(x, mu=mu, sigma=sigma, nu=nu)
plot(x,y,type='l')

#-----------simulacion Monte Carlo
Xj = rDEL(500,mu=mu, sigma=sigma, nu=nu)
hist(Xj,60)
rug(Xj)
#-----------tabulacion
#tabulate takes the integer-valued vector bin 
#and counts the number of times each 
#integer occurs in it.

tXj = tabulate(Xj)
tj = seq(1,length(tXj))
plot(tj,tXj,type='h')


#--------------media varianza teorica muestral
(ex = sum(x*y))
(mx = mean(Xj))

(sigma2x = sum(y*(x-ex)^2))
(varx = var(Xj))