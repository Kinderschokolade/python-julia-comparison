using Random

function sum_nums(x,y)
    x + y
end

function sum_random_numbers(iterations)
    rng = MersenneTwister(1234);
    for it in iterations
        x = randn(rng, ComplexF64)
        y = randn(rng, ComplexF64)
        sum_nums(x,y)
    end
end 


if abspath(PROGRAM_FILE) == @__FILE__
    sum_random_numbers(10^8)
end
