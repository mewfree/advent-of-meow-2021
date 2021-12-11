using DelimitedFiles

input = readdlm("input", String)
input_vec = [input[i,:] for i in 1:size(input, 1)]

output = map(i -> i[end-3:end], input_vec) |> Iterators.flatten |> collect
println("Part 1: ", count(i -> i ∈ [2, 3, 4, 7], length.(output)))
