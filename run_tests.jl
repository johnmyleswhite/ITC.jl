#
# Correctness Tests
#

using ITC

my_tests = ["test/utils.jl",
            "test/utility.jl",
            "test/discount.jl",
            "test/discounted_utility.jl",
            "test/fit.jl"]

println("Running tests:")

for my_test in my_tests
    println(" * $(my_test)")
    include(my_test)
end
