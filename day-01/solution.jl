using DelimitedFiles
using Transducers

input = readdlm("input", Int) |> vec
compare_reduce(vector) = reduce(+, map(x -> x[1] - 1 == 0 ? false : x[2] > vector[x[1] - 1], enumerate(vector)))
windows = input |> Transducers.Partition(3; step = 1) |> Map(copy) |> collect

println("Part 1: ", compare_reduce(input))
println("Part 2: ", compare_reduce(sum.(windows)))
