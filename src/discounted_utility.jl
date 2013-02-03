type DUModel
	u::UtilityFunction
	d::DiscountFunction
end
function DUModel(u::UtilityFunction)
	DUModel(u, Exponential())
end
function DUModel(d::DiscountFunction)
	DUModel(LinearUtility(), d)
end

function du(m::DUModel, x::Real, t::Real)
	u(m.u, x) * d(m.d, t)
end

# Probability of choosing (x1, t1)
function probability(m::DUModel,
	                 x1::Real, t1::Real,
	                 x2::Real, t2::Real)
	return invlogit(du(m, x1, t1) - du(m, x2, t2))
end
function likelihood(m::DUModel,
	                x1::Real, t1::Real,
	                x2::Real, t2::Real)
	probability(m, x1, t1, x2, t2)
end

# Input matrix format:
# [c(1) x1(1) t1(1) x2(1) t2(1) x3(1) t3(1); c(2) x1(2) ...]
# c is index of chosen option
function loglikelihood(m::DUModel, inputs::Matrix)
	nrows, ncols = size(inputs)
	nopts = fld(ncols, 2)
	if ncols != 5
		throw(ArgumentError("Input matrix must have 5 columns"))
	end
	ll = 0.0
	dus = Array(Float64, nopts)
	for i in 1:nrows
		for option in 1:nopts
			dus[option] = du(m,
				             inputs[i, 2 * option],
				             inputs[i, 2 * option + 1])
		end
		chosen_option = int(inputs[i, 1])
		ll += dus[chosen_option] - logsumexp(dus)
	end
	return ll
end
likelihood(m::DUModel, inputs::Matrix) = exp(loglikelihood(m, inputs))
probability(m::DUModel, inputs::Matrix) = exp(loglikelihood(m, inputs))

function simulate(m::DUModel,
	              x1::Real, t1::Real,
	              x2::Real, t2::Real)
	p = probability(m, x1, t1, x2, t2)
	probs = [p, 1.0 - p]
	return float(rand(Categorical(probs)))
end

function simulate!(m::DUModel, inputs::Matrix)
	nrows, ncols = size(inputs)
	nopts = fld(ncols, 2)
	if ncols != 5
		throw(ArgumentError("Input matrix must have 5 columns"))
	end
	lls = Array(Float64, nopts)
	dus = Array(Float64, nopts)
	for i in 1:nrows
		for option in 1:nopts
			dus[option] = du(m,
				             inputs[i, 2 * option],
				             inputs[i, 2 * option + 1])
		end
		for option in 1:nopts
			lls[option] = dus[option] - logsumexp(dus)
		end
		probs = exp(lls)
		inputs[i, 1] = rand(Categorical(probs))
	end
end
