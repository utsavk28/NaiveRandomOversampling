include("./src/NaiveRandomOversampling.jl")

using DataFrames
using CategoricalArrays

using .NaiveRandomOversampling

X = DataFrame(Id=1:6, Gender=["M", "F", "F", "M", "F", "M"])
y = CategoricalArray(["Old", "Young", "Middle", "Middle", "Middle", "Young"])

Xover,yover = naive_random_oversampling(X,y)

println(Xover)
println(yover)

