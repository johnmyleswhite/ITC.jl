@assert d(Exponential(0.9), 1) == 0.9
@assert d(Exponential(0.9), 2) == 0.81

@assert d(Hyperbolic(1.0), 1) == 0.5
@assert d(Hyperbolic(1.0), 2) == 1/3

@assert d(QuasiHyperbolic(0.5, 0.9), 0) == 1.0
@assert d(QuasiHyperbolic(0.5, 0.9), 1) == 0.5 * 0.9 
@assert d(QuasiHyperbolic(0.5, 0.9), 2) == 0.5 * 0.81

@assert d(GeneralizedHyperbolic(1.0, 1.0), 0) == 1
@assert d(GeneralizedHyperbolic(1.0, 1.0), 1) == 1/2
@assert d(GeneralizedHyperbolic(1.0, 1.0), 2) == 1/3
