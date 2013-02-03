abstract DiscountFunction

type Exponential <: DiscountFunction
	delta::Float64
end
Exponential() = Exponential(0.5)
type Hyperbolic <: DiscountFunction
	alpha::Float64
end
Hyperbolic() = Hyperbolic(1.0)
type QuasiHyperbolic <: DiscountFunction
	beta::Float64
	delta::Float64
end
QuasiHyperbolic() = QuasiHyperbolic(0.5, 0.9)
type GeneralizedHyperbolic <: DiscountFunction
	alpha::Float64
	beta::Float64
end
GeneralizedHyperbolic() = GeneralizedHyperbolic(1.0, 1.0)

d(m::Exponential, t::Real) = (m.delta)^t
d(m::Hyperbolic, t::Real) = 1.0 / (1.0 + m.alpha * t)
function d(m::QuasiHyperbolic, t::Real)
	if abs(t - 0.0) < 10e-16
		(m.delta)^t
	else
		m.beta * (m.delta)^t
	end
end
function d(m::GeneralizedHyperbolic, t::Real)
	(1 + m.alpha * t)^(-m.beta / m.alpha)
end
