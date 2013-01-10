type DUModel
	u::UtilityFunction
	d::DiscountFunction
	a::Float64 # Scaling factor for random utility model
end
function DUModel(d::DiscountFunction, a::Real)
	DUModel(LinearUtility(), d, a)
end
function DUModel(d::DiscountFunction)
	DUModel(LinearUtility(), d, 1.0)
end

function du(m::DUModel, x::Real, t::Real)
	u(m.u, x) * d(m.d, t)
end

function probability(m::DUModel, x1::Real, t1::Real, x2::Real, t2::Real)
	invlogit(m.a * (du(m, x2, t2) - du(m, x1, t1)))
end

function simulate(m::DUModel, x1::Real, t1::Real, x2::Real, t2::Real, n::Integer)
	p = probability(m, x1, t1, x2, t2)
	d = Bernoulli(p)
	c = Array(Int, n)
	for i in 1:n
		c[i] = rand(d)
	end
	return c
end
