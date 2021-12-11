using DelimitedFiles, StatsBase
input = readdlm("input", ',', Int) |> vec

function solve(input, days)
    freq = input |> countmap
    buckets = map(i -> get(freq, i, 0), 0:8)

    for _ in 1:days
        buckets = circshift(buckets, -1)
        buckets[7] += buckets[9]
    end

    return buckets |> sum
end

println("Part 1: ", solve(input, 80))
println("Part 2: ", solve(input, 256))
