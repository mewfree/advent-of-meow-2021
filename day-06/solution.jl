using DelimitedFiles
input = readdlm("input", ',', Int) |> vec

function apply(list)
    map(f -> f == 0 ? (6, 8) : f - 1, list) |> Iterators.flatten |> collect
end

function simulate(x, days)
    for i in 1:days
        x = apply(x)
    end
    return x
end

println("Part 1: ", simulate(input, 80) |> length)
