# NaiveRandomOversampling
Randomly duplicate samples in the minority class.

## Usage
```
    using .NaiveRandomOversampling
    Xover,yover = naive_random_oversampling(X,y)
```

### Result
DataFrame sampled utilizing Class Column

`Before Oversampling`
```
6×3 DataFrame
 Row │ Id     Gender  Class  
     │ Int64  String  Cat…
─────┼───────────────────────
   1 │     1  M       Old
   2 │     2  F       Young
   3 │     3  F       Middle
   4 │     4  M       Middle
   5 │     5  F       Middle
   6 │     6  M       Young
```

`After Oversampling`
```
9×3 DataFrame
 Row │ Id     Gender  Class  
     │ Int64  String  Cat…
─────┼───────────────────────
   1 │     5  F       Middle
   2 │     2  F       Young
   3 │     6  M       Young
   4 │     6  M       Young
   5 │     1  M       Old
   6 │     4  M       Middle
   7 │     1  M       Old
   8 │     3  F       Middle
   9 │     1  M       Old
```

## Dependencies
- [MLUtils.jl](https://github.com/JuliaML/MLUtils.jl) 
