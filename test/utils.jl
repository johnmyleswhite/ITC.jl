@assert ITC.logit(0.7310585786300049) == 1.0 # Make approx
@assert ITC.logit(0.2689414213699951) == -1.0 # Make approx
@assert ITC.logit(0.5) == 0.0 # Make approx

@assert ITC.invlogit(1) == 0.7310585786300049 # Make approx
@assert ITC.invlogit(-1) == 0.2689414213699951 # Make approx
@assert ITC.invlogit(1) == 1.0 - ITC.invlogit(-1) # Make approx
