#--#Ejemplo distribuciones Gamma

#-------------

AbscontDistribtion ? Beta, Cauchy, Chisq, Exp, Fd,
Gammad, Logis, Lnorm, Norm, Td, Unif, Weibull

Functionals:
E                       Generic function for the computation of
                        (conditional) expectations
var                     Generic functions for the computation of
                        functionals
IQR                     Generic functions for the computation of
                        functionals
sd                      Generic functions for the computation of
                        functionals
mad                     Generic functions for the computation of
                        functionals
median                  Generic functions for the computation of
                        functionals
skewness                Generic functions for the computation of
                        functionals
kurtosis                Generic functions for the computation of


#----------- distribuciones
X1 <- Gammad(shape = 10 , scale = 2)

#-----E(X1) = shape x scale, Var(X1) = shape x scale^2
E(X1)
var(X1)

#----P(12 <= X1 <= 32)
(p(X1)(32) - p(X1)(12))

#---mediana
(q(X1)(0.5))

#---suma de indep
X2 <- Gammad(shape = 6 , scale = 4)

X3 <- Gammad(shape = 15 , scale = 4)

X <- X1+X2+X3

#---------cuantil
(q(X)(0.5))

#--------Z = X1+X2+X3)/U

U <- Unif(Min=12,Max=140)

Z <- X/U

(m=q(Z)(0.5))
(ric = q(Z)(0.9)-q(Z)(0.1))
(asim = (q(Z)(0.9)+q(Z)(0.1)-2*m)/ric)
(skewness(Z))

Zn <- r(Z)(500)

plot(density(Zn))
hist(Zn,100)

#--------esperanza de funiciones de va

(ES = E(Z,fun=function(x){(x-m)/ric}))

(ES3 = E(Z,fun=function(x){(x-m)^3/ric^(3/2)}))


#-----------mezclas de distribuciones

X <-  UnivarMixingDistribution(
X1,X2, mixCoeff=c(9/20,11/20))
B=plot(X)

par(mfrow=c(1,1))
plot(B$dplot$plot$x,B$dplot$plot[[2]],type='l')
sd(X); E(X)
print(X)

#-------------truncamientos
Xn1 = r(X1)(500)
hist(Xn1,100)

T1 <- Minimum(X1,30)
E(T1)
T2 <- Truncate(X1,upper=30)
E(T2)

          