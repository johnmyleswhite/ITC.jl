function fit(::Type{LinearUtility},
	         ::Type{Exponential},
	         inputs::Matrix)
	nrows, ncols = size(inputs)
	if ncols != 5
		throw(ArgumentError("Choice matrix must have 5 columns"))
	end
	uf = LinearUtility()
	df = Exponential()
	m = DUModel(uf, df)
	function f(parameters::Vector)
		m.u.scale, m.d.delta = parameters[1], parameters[2]
		return -loglikelihood(m, inputs)
	end
	# function g(parameters::Vector)
	# 	m.u.scale, m.d.delta = parameters[1], parameters[2]
	# 	loglikelihood_gradient(m, inputs)
	# end
	# results = optimize(f, g, initial_parameters(uf, df))
	results = optimize(f, initial_parameters(LinearUtility, Exponential))
	# TODO: Add analytic gradients
	# TODO: Use a constrained optimizer with model-based box constraints
	m.u.scale, m.d.delta = results.minimum[1], results.minimum[2]
	return m
end

function fit(::Type{LinearUtility},
	         ::Type{Hyperbolic},
	         inputs::Matrix)
	nrows, ncols = size(inputs)
	if ncols != 5
		throw(ArgumentError("Choice matrix must have 5 columns"))
	end
	uf = LinearUtility()
	df = Hyperbolic()
	m = DUModel(uf, df)
	function f(parameters::Vector)
		m.u.scale, m.d.alpha = parameters[1], parameters[2]
		return -loglikelihood(m, inputs)
	end
	# function g(parameters::Vector)
	# 	m.u.scale, m.d.delta = parameters[1], parameters[2]
	# 	loglikelihood_gradient(m, inputs)
	# end
	# results = optimize(f, g, initial_parameters(uf, df))
	results = optimize(f, initial_parameters(LinearUtility, Hyperbolic))
	# TODO: Add analytic gradients
	# TODO: Use a constrained optimizer with model-based box constraints
	m.u.scale, m.d.alpha = results.minimum[1], results.minimum[2]
	return m
end

function initial_parameters(::Type{LinearUtility}, ::Type{Exponential})
	return [1.0, 0.5]
end

function initial_parameters(::Type{LinearUtility}, ::Type{Hyperbolic})
	return [1.0, 1.0]
end
