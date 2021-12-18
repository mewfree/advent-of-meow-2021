using DelimitedFiles

input = readdlm("input", String) |> vec

function find_incorrect(line)
    expected = []

    for char in split(line, "")
        if length(expected) > 0 && char == expected[end]
            pop!(expected)
        elseif char == "("
            push!(expected, ")")
        elseif char == "["
            push!(expected, "]")
        elseif char == "{"
            push!(expected, "}")
        elseif char == "<"
            push!(expected, ">")
        else
            return char
        end
    end

    return expected
end

function calculate_score(input)
    score = Dict(
        ")" => 3,
        "]" => 57,
        "}" => 1197,
        ">" => 25137,
    )

    map(line -> get(score, find_incorrect(line), 0), input) |> sum
end

println("Part 1: ", calculate_score(input))

function calculate_score_2(input)
    score = Dict(
        ")" => 1,
        "]" => 2,
        "}" => 3,
        ">" => 4,
    )

    v = find_incorrect.(input) |> i -> filter(e -> isa(e, Vector), i) |> i -> reverse.(i)
    w = reduce.((acc, i) -> acc * 5 + score[i], v, init = 0) |> sort
    w[end ÷ 2 + 1]
end

println("Part 2: ", calculate_score_2(input))
