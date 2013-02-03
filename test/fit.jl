using ITC

m = DUModel(LinearUtility(1.0), Exponential(2.0 / 3.0))

inputs = Array(Float64, 100, 5)
inputs[:, 2] = 10.0
inputs[:, 3] = 0.0
inputs[:, 4] = [10.1:0.1:20.0]
inputs[:, 5] = 1.0

simulate!(m, inputs)

loglikelihood(m, inputs)

exp_fit = fit(LinearUtility, Exponential, inputs)

m.d = Hyperbolic(0.5)

simulate!(m, inputs)

fit(LinearUtility, Exponential, inputs)
fit(LinearUtility, Hyperbolic, inputs)
