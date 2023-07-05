import numpy as np
import random
import timeit
import sys

def matmul_benchmark(n):
    A = np.random.rand(n, n)
    B = np.random.rand(n, n)
    C = np.dot(A, B)

def array_operations(n):
    A = np.random.rand(n)
    B = np.random.rand(n)
    C = A * B + A / (B + 1e-8)

def fibonacci_benchmark(n):
    def fibonacci(n):
        if n <= 1:
            return n
        return fibonacci(n - 1) + fibonacci(n - 2)
    return fibonacci(n)

def string_concat_benchmark(n):
    s = ""
    for i in range(n):
        s += str(i)

def sort_benchmark(n):
    A = np.random.rand(n)
    np.sort(A)

def io_benchmark(n):
    with open("temp.txt", "w") as f:
        for i in range(n):
            f.write(str(i) + "\n")
    with open("temp.txt", "r") as f:
        for line in f:
            int(line)

def random_walk_benchmark(n):
    x = 0.0
    for _ in range(n):
        x += random.random() - 0.5
    return x

def monte_carlo_pi_benchmark(n):
    inside = 0
    for _ in range(n):
        x, y = random.random(), random.random()
        if x**2 + y**2 <= 1.0:
            inside += 1
    return (inside / n) * 4

def primes_up_to_benchmark(n):
    sieve = [True] * (n + 1)
    sieve[0] = sieve[1] = False
    for i in range(2, int(n**0.5) + 1):
        if sieve[i]:
            sieve[i*i:n+1:i] = [False] * len(range(i*i, n+1, i))
    return [i for i, is_prime in enumerate(sieve) if is_prime]

def run_benchmark(func_name, n, iterations):
    funcs = {
        "matmul": matmul_benchmark,
        "array": array_operations,
        "fibonacci": fibonacci_benchmark,
        "string_concat": string_concat_benchmark,
        "sort": sort_benchmark,
        "io": io_benchmark,
        "random_walk": random_walk_benchmark,
        "monte_carlo": monte_carlo_pi_benchmark,
        "primes": primes_up_to_benchmark
    }
    if func_name not in funcs:
        print(f"Unknown function: {func_name}")
        sys.exit(1)

    avg_time = timeit.timeit(lambda: funcs[func_name](n), number=iterations) / iterations
    print(f"Average time for {func_name} with n={n}, iterations={iterations}: {avg_time:.6f} seconds")


if __name__ == "__main__":
    func_name = sys.argv[1]
    n = int(sys.argv[2])
    iterations = int(sys.argv[3])
    run_benchmark(func_name, n, iterations)