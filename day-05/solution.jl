using StatsBase

function parse_line(line)
    coord = split(line, " ")
    origin = split(coord[1], ",")
    dest = split(coord[3], ",")

    ((parse(Int, origin[1]), parse(Int, origin[2])), (parse(Int, dest[1]), parse(Int, dest[2])))
end

input = open(f -> read(f, String), "input") |> f -> split(f, "\n") |> l -> parse_line.(l)

function calculate_line_coordinates((x1, y1), (x2, y2))
    if x1 == x2
        if y1 > y2
            return [(x1, y) for y = y2:y1]
        else
            return [(x1, y) for y = y1:y2]
        end
    elseif y1 == y2
        if x1 > x2
            return [(x, y1) for x = x2:x1]
        else
            return [(x, y1) for x = x1:x2]
        end
    else
        return []
    end
end

function part_1(input)
    coordinates = []

    for ((x1, y1), (x2, y2)) in input
        if x1 == x2 || y1 == y2
            append!(coordinates, calculate_line_coordinates((x1, y1), (x2, y2)))
        end
    end

    return count(((coordinates, freq), ) -> freq >= 2, countmap(coordinates))
end

println("Part 1: ", part_1(input))
