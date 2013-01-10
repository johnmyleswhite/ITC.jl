abstract UtilityFunction

type LinearUtility <: UtilityFunction
end
type PowerUtility <: UtilityFunction
	exponent::Float64
end
type LogUtility <: UtilityFunction
end

u(m::LinearUtility, x::Real) = x
u(m::PowerUtility, x::Real) = x^(m.exponent)
u(m::LogUtility, x::Real) = log1p(x)
