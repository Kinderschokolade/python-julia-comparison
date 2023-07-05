using Random
using BenchmarkTools

function matmul_benchmark(n)
    A = rand(n, n)
    B = rand(n, n)
    C = A * B
end

function array_operations(n)
    A = rand(n)
    B = rand(n)
    C = A .* B .+ A ./ (B .+ 1e-8)
end

function fibonacci_benchmark(n)
    function fibonacci(n)
        n <= 1 && return n
        return fibonacci(n - 1) + fibonacci(n - 2)
    end
    return fibonacci(n)
end

function string_concat_benchmark(n)
    s = ""
    for i in 1:n
        s *= string(i)
    end
end

function sort_benchmark(n)
    A = rand(n)
    sort!(A)
end

function io_benchmark(n)
    open("temp.txt", "w") do io
        for i in 1:n
            write(io, string(i) * "\n")
        end
    end
    open("temp.txt", "r") do io
        for line in eachline(io)
            parse(Int, line)
        end
    end
end

function random_walk_benchmark(n)
    x = 0.0
    for i in 1:n
        x += rand() - 0.5
    end
    return x
end

function monte_carlo_pi_benchmark(n)
    inside = 0
    for i in 1:n
        x, y = rand(), rand()
        if x^2 + y^2 <= 1.0
            inside += 1
        end
    end
    return (inside / n) * 4
end

function primes_up_to_benchmark(n)
    sieve = trues(n)
    sieve[1] = false
    for i in 2:floor(Int, sqrt(n))
        if sieve[i]
            sieve[i*i:i:n] .= false
        end
    end
    return findall(sieve)
end

function run_benchmark(func_name::String, n::Int, iterations::Int)
    avg_time = 0.0

    if func_name == "matmul"
        avg_time = @belapsed matmul_benchmark($n) samples=iterations
    elseif func_name == "array"
        avg_time = @belapsed array_operations($n) samples=iterations
    elseif func_name == "fibonacci"
        avg_time = @belapsed fibonacci_benchmark($n) samples=iterations
    elseif func_name == "string_concat"
        avg_time = @belapsed string_concat_benchmark($n) samples=iterations
    elseif func_name == "sort"
        avg_time = @belapsed sort_benchmark($n) samples=iterations
    elseif func_name == "io"
        avg_time = @belapsed io_benchmark($n) samples=iterations
    elseif func_name == "random_walk"
        avg_time = @belapsed random_walk_benchmark($n) samples=iterations
    elseif func_name == "monte_carlo"
        avg_time = @belapsed monte_carlo_pi_benchmark($n) samples=iterations
    elseif func_name == "primes"
        avg_time = @belapsed primes_up_to_benchmark($n) samples=iterations
    else
        println("Unknown function: $func_name")
        return
    end

    println("Average time for $func_name with n=$n, iterations=$iterations: $avg_time seconds")
end

if length(ARGS) == 3
    func_name = ARGS[1]
    n = parse(Int, ARGS[2])
    iterations = parse(Int, ARGS[3])
    run_benchmark(func_name, n, iterations)
else
    println("Usage: julia benchmark.jl <function_name> <n> <iterations>")
end