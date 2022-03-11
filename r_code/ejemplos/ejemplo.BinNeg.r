require(distr)
require(distrEx)

#-Ejemplo con Binomial Negativa


N1 <- Nbinom(prob = 0.7, size = 100) 
# N1 ~ Binomial( prob=0.7, size=100)

#--P( N1 = 57) 
d(N1)(57)

#--P(27 <= N1 <= 67)
p(N1)(67) - p(N1)(26)

#-- cuatil de 0.5 (mediana) x tal que p(B)(x)>=0.5.
q(N1)(.5) 

#--Esperanza Varianza
prob = 0.7; size = 100;
(EN = (1-prob)*size/prob)
E(N1)
(varN = (1-prob)*size/prob^2)
var(N1)

#--sumar Binomiales Negativas independientes

N2 <- Nbinom(prob = 0.5, size = 20)

E(N2)

N = N1 + N2

#--P(27 <= N <= 67)
p(N)(67) - p(N)(26)

(E(N1)+E(N2))
E(N)

#---sumas ponderadas de Binomiales Negativas

Np <- 0.3*N1+0.7*N2

(0.3*E(N1)+0.7*E(N2))
E(Np)

var(Np)

Nps = r(Np)(300)
hist(Nps,100)

#-----------capacidad de estimacion

require(distrMod)

G <-  NbinomwithSizeFamily(size = 80,  prob = 0.72)
B=MDEstimator(x = Nps, ParamFamily = G, 
distance = CvMDist)

(bn.coef.mdi =B@optimReturn$par)
#----------tabla de frecuencias estimadas
Eo = tabulate(Nps)

Ee = length(Nps)*dnbinom(seq(0,44),size=bn.coef.mdi[1],prob=bn.coef.mdi[2])
options(digits=2)
(cbind(seq(0,44),Eo,Ee))
plot(seq(0,44),Eo,type='h')
points(seq(0,44),Ee,pch=20,col='red')

