# ejemplo distribucion de suma de 2 lognormales indep

library(distr)
library(distrEx)

X1 = Lnorm(mean=1,sd=2)
X2 = Lnorm(mean=2,sd=1)
S2 = X1+X2

(sqrt(var(S2))/E(S2))
[1] 1.378651
q0.95 = q(S2)(0.995)
[1] 479.7213
Sn = r(S2)(1000)
plot(density(Sn))

f=d(S2)(seq(0,1000,0.05))
F=p(S2)(seq(0,150,0.05))

plot(seq(0,1000,0.05),f,type='l')


