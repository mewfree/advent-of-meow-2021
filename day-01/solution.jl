using DelimitedFiles
using Transducers

input = readdlm("input", Int) |> vec
compare(vec) = map(((x, y),) -> x < y, zip(vec, vec[2:end]))
windows = input |> Transducers.Partition(3; step = 1) |> Map(copy) |> collect

println("Part 1: ", input |> compare |> sum)
println("Part 2: ", sum.(windows) |> compare |> sum)
