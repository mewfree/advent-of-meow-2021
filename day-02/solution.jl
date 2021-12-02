using DelimitedFiles

input = readdlm("input") |> eachrow |> collect

horizontal = filter(((dir, n),) -> dir == "forward", input) |> f->map(((dir, n),) -> n, f) |> sum
depth = filter(((dir, n),) -> dir != "forward", input) |> f->map(((dir, n),) -> dir == "down" ? n : -n, f) |> sum
println("Part 1: ", horizontal*depth)

horizontal_p2 = 0
depth_p2 = 0
aim_p2 = 0

for (dir, n) in input
    if dir == "forward"
        global horizontal_p2 += n
        global depth_p2 += aim_p2 * n
    elseif dir == "down"
        global aim_p2 += n
    else
        global aim_p2 -= n
    end
end

println("Part 2: ", horizontal_p2*depth_p2)
