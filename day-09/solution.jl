input = open(f -> read(f, String), "input") |> f -> split(f, "\n") |> l -> split.(l, "") |> l -> map.(i -> parse(Int, i), l)

low_points = []
for i in 1:length(input)
    for j in 1:length(input[1])
        n = [
            get(get(input, i, []), j-1, nothing),
            get(get(input, i, []), j+1, nothing),
            get(get(input, i-1, []), j, nothing),
            get(get(input, i+1, []), j, nothing),
        ] |> n -> filter(i -> i != nothing, n)

        if input[i][j] < minimum(n)
            push!(low_points, input[i][j])
        end
    end
end

println("Part 1: ", map(i -> i+1, low_points) |> sum)
