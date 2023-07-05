# python-julia-comparison
Das Ziel ist erst mal die performance zu testen. Das ist deine Arbeit, willst du noch andere Aspekte im Code vergleichen? 


Ich plane python3.10.12 und 3.11.4 zu testen, weil die neue Version signifikant schneller ist. Fuer Julia nehmen wir 1.9.1 (aktuell) und 1.6.7 (LTS). 


## Requirements
* Pyenv (with python versions)
* Poetry
* Julia


## Assumptions
* The random number generation time is included in each process
* We assume that we implemented the most efficient implementation
* We are not making use of Julia type specialization (for now) 

## Example Output
```
./run_test.sh
Python runtime for add: 7000.829 ms
Julia runtime for add: 224.495 ms

``` 
