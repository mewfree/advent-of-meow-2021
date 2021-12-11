using DelimitedFiles

input = readdlm("input", ',', Int) |> vec

fuel(x, input) = map(i -> abs(i - x), input) |> sum
fuel2(x, input) = map(i -> sum(1:abs(i - x)), input) |> sum

solve(f, input) = map(i -> f(i, input), minimum(input):maximum(input)) |> minimum

println("Part 1: ", solve(fuel, input))
println("Part 2: ", solve(fuel2, input))
