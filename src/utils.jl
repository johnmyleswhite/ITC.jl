function logit(p::Real)
	if p < 0 || p > 1
		DomainError("For logit(p), p must be in [0, 1]")
	else
		return log(p / (1 - p))
	end
end

function invlogit(z::Real)
	z = clamp(z, -700.0, 700.0)
	return 1.0 / (1.0 + exp(-z))
end

function logsumexp{T <: Real}(a::Vector{T})
	a_min = Inf
	a_max = -Inf
	n = length(a)
	for i in 1:n
		if a[i] < a_min
			a_min = a[i]
		end
		if a[i] > a_max
			a_max = a[i]
		end
	end
	if abs(a_min) > a_max
		c = a_min
	else
		c = a_max
	end
    s = 0.0
    for i in 1:n
        s += exp(a[i] - c)
    end
    return c + log(s)
end
