using DelimitedFiles

input = readdlm("input") |> eachrow |> collect

horizontal =
    filter(((dir, n),) -> dir == "forward", input) |> f -> map(((dir, n),) -> n, f) |> sum
depth =
    filter(((dir, n),) -> dir != "forward", input) |>
    f -> map(((dir, n),) -> dir == "down" ? n : -n, f) |> sum

println("Part 1: ", horizontal * depth)

(horizontal_p2, depth_p2) = reduce(((h, d, a), (dir, n)) -> if dir == "forward"
    (h + n, d + a * n, a)
elseif dir == "down"
    (h, d, a + n)
else
    (h, d, a - n)
end, input, init = (0, 0, 0))

println("Part 2: ", horizontal_p2 * depth_p2)
