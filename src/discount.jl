abstract DiscountFunction

type Exponential <: DiscountFunction
	delta::Float64
end
type Hyperbolic <: DiscountFunction
	alpha::Float64
end
type QuasiHyperbolic <: DiscountFunction
	beta::Float64
	delta::Float64
end
# TODO: GeneralizedHyperbolic, ...

d(m::Exponential, t::Real) = (m.delta)^t
d(m::Hyperbolic, t::Real) = 1 / (1 + m.alpha * t)
function d(m::QuasiHyperbolic, t::Real)
	if t == 0
		(m.delta)^t
	else
		m.beta * (m.delta)^t
	end
end
# TODO: GeneralizedHyperbolic, ...