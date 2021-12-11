using DelimitedFiles

input = readdlm("input", ',', Int) |> vec

fuel(x, input) = map(i -> abs(i - x), input) |> sum
println("Part 1: ", map(i -> fuel(i, input), minimum(input):maximum(input)) |> minimum)
