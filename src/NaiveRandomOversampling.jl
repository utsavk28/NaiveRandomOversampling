module NaiveRandomOversampling
export naive_random_oversampling

using Random
using MLUtils

RANDOM_STATE = 42
Random.seed!(RANDOM_STATE)
rng = MersenneTwister(1234);

function naive_random_oversampling(X,y::AbstractVector) 
    y_idx = Dict() # list of idx for each class
    sz = 0
    
    # Generating y_idx & estimating maximum sample 
    # count of an individual class 
    for x in unique(y)
        idx = findall(>(0), x .== y)
        y_idx[x] = idx
        sz = max(sz,length(idx))
    end

    # Generating list of idx with each class indices being randomly 
    # sampled from y_idx with sample size equal to sz 
    # all_idx = vcat(map(x -> randobs(x[2],sz),collect(y_idx))...)
    all_idx = map(x -> randobs(x[2],sz),y_idx |> collect) |> Iterators.flatten |> collect
    shuffle!(rng,all_idx)
    

    # Utilizing getobs from MLUtils to obtain Xover & yover
    Xover,yover = getobs(X,all_idx),getobs(y,all_idx)
    Xover,yover
end


end # module NaiveRandomOversampling
