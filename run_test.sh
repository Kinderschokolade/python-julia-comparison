start=$(date +%s%N)
python src/add.py 
end=$(date +%s%N)
runtime=$((end-start))
echo 'Python runtime for add:' $(echo "scale=3;($runtime)/(1*10^06)" | bc) 'ms'

start=$(date +%s%N)
julia src/add.jl  
end=$(date +%s%N)
runtime=$((end-start))
echo 'Julia runtime for add:' $(echo "scale=3;($runtime)/(1*10^06)" | bc) 'ms'



