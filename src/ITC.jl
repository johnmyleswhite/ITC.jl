module ITC
	using Distributions
	using Optim

	import Distributions.fit

	export UtilityFunction,
		   LinearUtility,
		   PowerUtility,
		   LogUtility
	export DiscountFunction,
	       Exponential,
	       Hyperbolic,
	       QuasiHyperbolic,
	       GeneralizedHyperbolic
	export DUModel

	export u, d, du
	export probability, simulate, simulate!, likelihood, loglikelihood
	export fit
	export logsumexp, logit, invlogit

	include("utils.jl")
	include("utility.jl")
	include("discount.jl")
	include("discounted_utility.jl")
	include("fit.jl")
end
