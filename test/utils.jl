@assert ITC.logit(0.7310585786300049) == 1.0 # Make approx
@assert ITC.logit(0.2689414213699951) == -1.0 # Make approx
@assert ITC.logit(0.5) == 0.0 # Make approx

@assert ITC.invlogit(1) == 0.7310585786300049 # Make approx
@assert ITC.invlogit(-1) == 0.2689414213699951 # Make approx
@assert ITC.invlogit(1) == 1.0 - ITC.invlogit(-1) # Make approx

# All of these are mathematically equivalent
a = [0.1, 0.2]
log(invlogit(a[1] - a[2]))
log(exp(a[1]) / (exp(a[1]) + exp(a[2])))
log(exp(a[1])) - log(exp(a[1]) + exp(a[2]))
logsumexp(a[1:1]) - logsumexp(a[1:2])

a = [10000.1, 0.2]
log(invlogit(a[1] - a[2]))
log(exp(a[1]) / (exp(a[1]) + exp(a[2])))
log(exp(a[1])) - log(exp(a[1]) + exp(a[2]))
logsumexp(a[1:1]) - logsumexp(a[1:2])

a = [-10000.1, 0.2]
log(invlogit(a[1] - a[2]))
log(exp(a[1]) / (exp(a[1]) + exp(a[2])))
log(exp(a[1])) - log(exp(a[1]) + exp(a[2]))
logsumexp(a[1:1]) - logsumexp(a[1:2])
