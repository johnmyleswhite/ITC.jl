module ITC
	using Distributions

	export UtilityFunction, LinearUtility, PowerUtility, LogUtility
	export DiscountFunction, Exponential, Hyperbolic, QuasiHyperbolic, GeneralizedHyperbolic
	export DUModel

	export u, d, du, probability, simulate

	include("utils.jl")
	include("utility.jl")
	include("discount.jl")
	include("discounted_utility.jl")
end
