input = open(f->read(f, String), "input") |> f -> split(f, "\n\n")

draw = input |> first |> s -> split(s, ",") |> d -> parse.(Int, d)
boards = map(boards -> map(board -> board |> s -> split(s, " ") |> line -> filter(!isempty, line) |> line -> parse.(Int, line), split(boards, "\n")), input[2:end]) |> boards -> map(b -> hcat(b...) |> transpose, boards) |> boards -> map(board -> map(element -> Dict("value" => element, "checked" => false), board), boards)

function part_1(boards)
    for i in draw
        for board in boards
            for j in findall(x -> x["value"] == i && x["checked"] == false, board)
                board[j] = Dict("value" => 0, "checked" => true)
            end

            (n, m) = board |> size
            for x in 1:n
                if map(f -> f["checked"], board[x,:]) == trues(n)
                    board_sum = map(z -> z["value"], board) |> sum
                    return i*board_sum
                end
            end

            for y in 1:m
                if map(f -> f["checked"], board[:,y]) == trues(m)
                    board_sum = map(z -> z["value"], board) |> sum
                    return i*board_sum
                end
            end
        end
    end
end

println("Part 1: ", part_1(boards))

function part_2(boards)
    winners = Set()

    for i in draw
        for (board_index, board) in enumerate(boards)
            if board_index ∉ winners
                for j in findall(x -> x["value"] == i && x["checked"] == false, board)
                    board[j] = Dict("value" => 0, "checked" => true)
                end

                (n, m) = board |> size
                for x in 1:n
                    if map(f -> f["checked"], board[x,:]) == trues(n)
                        if length(winners) == length(boards) - 1
                            board_sum = map(z -> z["value"], board) |> sum
                            return i*board_sum
                        else
                            push!(winners, board_index)
                        end
                    end
                end

                for y in 1:m
                    if map(f -> f["checked"], board[:,y]) == trues(m)
                        if length(winners) == length(boards) - 1
                            board_sum = map(z -> z["value"], board) |> sum
                            return i*board_sum
                        else
                            push!(winners, board_index)
                        end
                    end
                end
            end
        end
    end
end

println("Part 2: ", part_2(boards))
