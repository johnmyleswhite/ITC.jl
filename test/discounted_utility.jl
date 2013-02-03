using ITC

m = DUModel(LinearUtility(), Exponential(0.5))

p = probability(m, 10.0, 0.0, 20.0, 1.0)
@assert abs(p - 0.5) < 10e-8

m = DUModel(LinearUtility(), Exponential(0.9))

@assert abs(du(m, 10.0, 1.0) - 9.0) < 10e-8
@assert abs(du(m, 10.0, 2.0) - 8.10) < 10e-8

p = probability(m, 10.0, 0.0, 15.0, 1.0)
@assert abs(1 - p - 0.9706877692486436) < 10e-8
p = probability(m, 10.0, 0.0, 20.0, 1.0)
@assert abs(1 - p - 0.9996646498695336) < 10e-8
p = probability(m, 10.0, 0.0, 25.0, 1.0)
@assert abs(1 - p - 0.9999962733607158) < 10e-8

choices = Array(Float64, 100)
for i in 1:100
	choices[i] = simulate(m, 10.0, 0.0, 15.0, 1.0)
end
@assert length(choices) == 100
@assert sort(unique(choices)) == {1.0, 2.0}

m.d.delta = 2.0 / 3.0

inputs = Array(Float64, 100, 5)
inputs[:, 2] = 10.0
inputs[:, 3] = 0.0
inputs[:, 4] = [10.1:0.1:20.0]
inputs[:, 5] = 1.0

for i in 1:size(inputs, 1)
	inputs[i, 1] = simulate(m,
		                    inputs[i, 2],
		                    inputs[i, 3],
		                    inputs[i, 4],
		                    inputs[i, 5])
end

loglikelihood(m, inputs)

simulate!(m, inputs)

loglikelihood(m, inputs)
