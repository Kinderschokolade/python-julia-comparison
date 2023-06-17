start=$(date +%s%N)
$HOME/.pyenv/versions/3.10.12/bin/python src/add.py 
end=$(date +%s%N)
runtime=$((end-start))
echo 'Python 3.10 runtime for add:' $(echo "scale=3;($runtime)/(1*10^06)" | bc) 'ms'

start=$(date +%s%N)
$HOME/.pyenv/versions/3.11.4/bin/python src/add.py 
end=$(date +%s%N)
runtime=$((end-start))
echo 'Python 3.11 runtime for add:' $(echo "scale=3;($runtime)/(1*10^06)" | bc) 'ms'


start=$(date +%s%N)
julia src/add.jl  
end=$(date +%s%N)
runtime=$((end-start))
echo 'Julia runtime for add:' $(echo "scale=3;($runtime)/(1*10^06)" | bc) 'ms'



