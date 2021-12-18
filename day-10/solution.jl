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

    return false
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
