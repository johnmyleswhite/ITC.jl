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
        m.u.scale, m.d.delta = parameters[1:2]
        return -loglikelihood(m, inputs)
    end
    # TODO: Add analytic gradients
    # function g(parameters::Vector)
    #     m.u.scale, m.d.delta = parameters[1:2]
    #     return -loglikelihood_gradient(m, inputs)
    # end
    # TODO: Use a constrained optimizer with model-based box constraints
    results = optimize(f,
                       initial_parameters(LinearUtility, Exponential))
    m.u.scale, m.d.delta = results.minimum[1:2]
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
        m.u.scale, m.d.alpha = parameters[1:2]
        return -loglikelihood(m, inputs)
    end
    # TODO: Add analytic gradients
    # function g(parameters::Vector)
    #     m.u.scale, m.d.delta = parameters[1:2]
    #     return -loglikelihood_gradient(m, inputs)
    # end
    results = optimize(f,
                       initial_parameters(LinearUtility, Hyperbolic))
    # TODO: Use a constrained optimizer with model-based box constraints
    m.u.scale, m.d.alpha = results.minimum[1:2]
    return m
end

function fit(::Type{LinearUtility},
             ::Type{QuasiHyperbolic},
             inputs::Matrix)
    nrows, ncols = size(inputs)
    if ncols != 5
        throw(ArgumentError("Choice matrix must have 5 columns"))
    end
    uf = LinearUtility()
    df = QuasiHyperbolic()
    m = DUModel(uf, df)
    function f(parameters::Vector)
        m.u.scale, m.d.beta, m.d.delta = parameters[1:3]
        return -loglikelihood(m, inputs)
    end
    # TODO: Add analytic gradients
    # function g(parameters::Vector)
    #     m.u.scale, m.d.beta, m.d.delta = parameters[1:3]
    #     return -loglikelihood_gradient(m, inputs)
    # end
    # TODO: Use a constrained optimizer with model-based box constraints
    results = optimize(f,
                       initial_parameters(LinearUtility, QuasiHyperbolic))
    m.u.scale, m.d.beta, m.d.delta = results.minimum[1:3]
    return m
end

function fit(::Type{LinearUtility},
             ::Type{GeneralizedHyperbolic},
             inputs::Matrix)
    nrows, ncols = size(inputs)
    if ncols != 5
        throw(ArgumentError("Choice matrix must have 5 columns"))
    end
    uf = LinearUtility()
    df = GeneralizedHyperbolic()
    m = DUModel(uf, df)
    function f(parameters::Vector)
        m.u.scale, m.d.alpha, m.d.beta = parameters[1:3]
        return -loglikelihood(m, inputs)
    end
    # TODO: Add analytic gradients
    # function g(parameters::Vector)
    #     m.u.scale, m.d.alpha, m.d.beta = parameters[1:3]
    #     return -loglikelihood_gradient(m, inputs)
    # end
    # TODO: Use a constrained optimizer with model-based box constraints
    results = optimize(f,
                       initial_parameters(LinearUtility, GeneralizedHyperbolic))
    m.u.scale, m.d.alpha, m.d.beta = results.minimum[1:3]
    return m
end

function initial_parameters(::Type{LinearUtility}, ::Type{Exponential})
    return [1.0, 0.5]
end

function initial_parameters(::Type{LinearUtility}, ::Type{Hyperbolic})
    return [1.0, 1.0]
end

function initial_parameters(::Type{LinearUtility}, ::Type{QuasiHyperbolic})
    return [1.0, 0.5, 0.9]
end

function initial_parameters(::Type{LinearUtility}, ::Type{GeneralizedHyperbolic})
    return [1.0, 1.0, 1.0]
end
