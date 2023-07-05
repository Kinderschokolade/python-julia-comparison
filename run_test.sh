#!/bin/bash

# Usage: ./run_benchmark.sh <function_name> <size> <iterations>

if [ $# -ne 3 ]; then
    echo "Usage: $0 <function_name> <size> <iterations>"
    exit 1
fi

python310=$HOME/.pyenv/versions/3.10.12/bin/python
python311=$HOME/.pyenv/versions/3.11.4/bin/python
julia19=$HOME/.julia/juliaup/julia-1.9.1+0.x64.linux.gnu/bin/julia

FUNC_NAME=$1
SIZE=$2
ITERATIONS=$3

PYTHON310_RESULT=$(${python310} src/benchmarks.py $FUNC_NAME $SIZE $ITERATIONS)
echo "3:10" "$PYTHON310_RESULT"

PYTHON311_RESULT=$(${python311} src/benchmarks.py $FUNC_NAME $SIZE $ITERATIONS)
echo "3.11" "$PYTHON311_RESULT"


JULIA_RESULT=$(${julia19} src/benchmarks.jl $FUNC_NAME $SIZE $ITERATIONS)
echo "Julia" "$JULIA_RESULT"