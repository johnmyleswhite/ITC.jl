require("Distributions")

module ITC
	using Distributions

	export UtilityFunction, LinearUtility, PowerUtility, LogUtility
	export DiscountFunction, Exponential, Hyperbolic, QuasiHyperbolic
	export DUModel

	export u, d, du, probability, simulate

	include(joinpath(julia_pkgdir(), "ITC", "src", "utils.jl"))
	include(joinpath(julia_pkgdir(), "ITC", "src", "utility.jl"))
	include(joinpath(julia_pkgdir(), "ITC", "src", "discount.jl"))
	include(joinpath(julia_pkgdir(), "ITC", "src", "discounted_utility.jl"))
end
