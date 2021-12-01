using DelimitedFiles
input = readdlm("input", Int) |> vec
solution = reduce(+, map(x -> x[1] - 1 == 0 ? false : x[2] > input[x[1] - 1], enumerate(input)))
println("Part 1: ", solution)
