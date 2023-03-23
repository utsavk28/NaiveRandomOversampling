module NaiveRandomOversampling
export naive_random_oversampling

using Random
using MLUtils

RANDOM_STATE = 42
Random.seed!(RANDOM_STATE)
rng = MersenneTwister(1234);

function naive_random_oversampling(X,y::AbstractVector) 
    y_ids = Dict()
    sz = 0
    for x in unique(y)
        ids = findall(>(0), x .== y)
        y_ids[x] = ids
        sz = max(sz,length(ids))
    end

    # all_ids = vcat(map(x -> randobs(x[2],sz),collect(y_ids))...)
    all_ids = map(x -> randobs(x[2],sz),y_ids |> collect) |> Iterators.flatten |> collect
    shuffle!(rng,all_ids)
    
    Xover,yover = getobs(X,all_ids),getobs(y,all_ids)
    Xover,yover
end


end # module NaiveRandomOversampling
