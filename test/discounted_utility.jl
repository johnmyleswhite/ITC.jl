m = DUModel(LinearUtility(), Exponential(0.9), 1.0)

@assert du(m, 10, 1) == 9.0
# @assert du(m, 10, 2) == 8.10 # Make approx

@assert probability(m, 10, 0, 15, 1) == 0.9706877692486436
@assert probability(m, 10, 0, 20, 1) == 0.9996646498695336
@assert probability(m, 10, 0, 25, 1) == 0.9999962733607158

c = simulate(m, 10, 0, 15, 1, 100)
@assert length(c) == 100
@assert sort(unique(c)) == {0, 1}
