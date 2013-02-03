using ITC

m = DUModel(LinearUtility(1.0), Exponential(2.0 / 3.0))

inputs = Array(Float64, 100, 5)
inputs[:, 2] = 10.0
inputs[:, 3] = 0.0
inputs[:, 4] = [10.1:0.1:20.0]
inputs[:, 5] = 1.0

simulate!(m, inputs)

loglikelihood(m, inputs)

exponential_fit = fit(LinearUtility, Exponential, inputs)
hyperbolic_fit = fit(LinearUtility, Hyperbolic, inputs)
quasihyperbolic_fit = fit(LinearUtility, QuasiHyperbolic, inputs)
generalized_fit = fit(LinearUtility, GeneralizedHyperbolic, inputs)

m.d = Hyperbolic(0.5)
simulate!(m, inputs)

exponential_fit = fit(LinearUtility, Exponential, inputs)
hyperbolic_fit = fit(LinearUtility, Hyperbolic, inputs)
quasihyperbolic_fit = fit(LinearUtility, QuasiHyperbolic, inputs)
generalized_fit = fit(LinearUtility, GeneralizedHyperbolic, inputs)
