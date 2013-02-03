abstract UtilityFunction

type LinearUtility <: UtilityFunction
	scale::Float64
end
LinearUtility() = LinearUtility(1.0)
type PowerUtility <: UtilityFunction
	scale::Float64
	exponent::Float64
end
PowerUtility(exponent::Real) = PowerUtility(1.0, exponent)
PowerUtility() = PowerUtility(1.0, 0.5)
type LogUtility <: UtilityFunction
	scale::Float64
end
LogUtility() = LogUtility(1.0)

u(m::LinearUtility, x::Real) = m.scale * x
u(m::PowerUtility, x::Real) = m.scale * x^(m.exponent)
u(m::LogUtility, x::Real) = m.scale * log1p(x)
