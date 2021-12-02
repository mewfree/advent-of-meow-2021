using DelimitedFiles

input = readdlm("input") |> eachrow |> collect

horizontal = filter(((dir, n),) -> dir == "forward", input) |> f->map(((dir, n),) -> n, f) |> sum
depth = filter(((dir, n),) -> dir != "forward", input) |> f->map(((dir, n),) -> dir == "down" ? n : -n, f) |> sum
println("Part 1: ", horizontal*depth)
