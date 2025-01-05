# python-julia-comparison
Das Ziel ist erst mal die performance zu testen. Das ist deine Arbeit, willst du noch andere Aspekte im Code vergleichen? 


Ich plane python3.10.12 und 3.11.4 zu testen, weil die neue Version signifikant schneller ist. Fuer Julia nehmen wir 1.9.1 (aktuell) und 1.6.7 (LTS). 


## Requirements
* run init.sh


## Assumptions
* The random number generation time is included in each process
* We assume that we implemented the most efficient implementation
* We are not making use of Julia type specialization (for now) 

## Example Output
```
./run_test.sh
3:10 Average time for matmul with n=1000, iterations=10: 0.022903 seconds
3.11 Average time for matmul with n=1000, iterations=10: 0.023514 seconds
Julia Average time for matmul with n=1000, iterations=10: 0.011772084 seconds
3:10 Average time for array with n=50000000, iterations=10: 4.245444 seconds
3.11 Average time for array with n=50000000, iterations=10: 4.369934 seconds
Julia Average time for array with n=50000000, iterations=10: 0.600104944 seconds
3:10 Average time for fibonacci with n=30, iterations=10: 0.234616 seconds
3.11 Average time for fibonacci with n=30, iterations=10: 0.122285 seconds
Julia Average time for fibonacci with n=30, iterations=10: 0.061880201 seconds
3:10 Average time for string_concat with n=100000, iterations=10: 0.018025 seconds
3.11 Average time for string_concat with n=100000, iterations=10: 0.011440 seconds
Julia Average time for string_concat with n=100000, iterations=10: 2.133877794 seconds
3:10 Average time for sort with n=5000000, iterations=10: 0.177194 seconds
3.11 Average time for sort with n=5000000, iterations=10: 0.198682 seconds
Julia Average time for sort with n=5000000, iterations=10: 0.136639368 seconds
3:10 Average time for io with n=100000, iterations=10: 0.049228 seconds
3.11 Average time for io with n=100000, iterations=10: 0.039162 seconds
Julia Average time for io with n=100000, iterations=10: 0.013054853 seconds
3:10 Average time for random_walk with n=10000000, iterations=10: 1.105109 seconds
3.11 Average time for random_walk with n=10000000, iterations=10: 0.566217 seconds
Julia Average time for random_walk with n=10000000, iterations=10: 0.012285039 seconds
3:10 Average time for monte_carlo with n=10000000, iterations=10: 2.929746 seconds
3.11 Average time for monte_carlo with n=10000000, iterations=10: 2.003414 seconds
Julia Average time for monte_carlo with n=10000000, iterations=10: 0.024602726 seconds
3:10 Average time for primes with n=1000000, iterations=10: 0.085955 seconds
3.11 Average time for primes with n=1000000, iterations=10: 0.095491 seconds
Julia Average time for primes with n=1000000, iterations=10: 0.002425245 seconds

``` 
