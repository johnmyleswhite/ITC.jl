function logit(p::Real)
	if p < 0 || p > 1
		DomainError("For logit(p), p must be in [0, 1]")
	else
		return log(p / (1 - p))
	end
end

function invlogit(z::Real)
	z = clamp(z, -100.0, 100.0)
	return 1 / (1 + exp(-z))
end
