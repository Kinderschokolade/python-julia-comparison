# python-julia-comparison
Das Ziel ist erst mal die performance zu testen. Das ist deine Arbeit, willst du noch andere Aspekte im Code vergleichen? 


Ich plane python3.10 und 3.11 zu testen, weil die neue Version signifikant schneller ist. Fuer Julia nehmen wir 1.9.1 (aktuell) und 1.6.7 (LTS). 
Zudem will ich auf deinem M1 und auf meinem i7/GTX 3060 setup testen. 


## Requirements
* Pyenv
* Poetry
* Julia


## Assumptions
* The random number generation time is included in each process
* We assume that we implemented the most efficient implementation


## Example Output
```
./run_test.sh
Python runtime for add: 7000.829 ms
Julia runtime for add: 224.495 ms

``` 
