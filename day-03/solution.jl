using DelimitedFiles

input = readdlm("input", String) |> v -> map(s -> split(s, ""), v) |> vec
columns = [x[n] for x = input, n = 1:length(input[1])]

gamma_string = ""
epsilon_string = ""

for i in 1:length(input[1])
    if count(j -> j == "0", columns[:, i]) > count(j -> j == "1", columns[:, i])
        global gamma_string = gamma_string * "0"
        global epsilon_string = epsilon_string * "1"
    else
        global gamma_string = gamma_string * "1"
        global epsilon_string = epsilon_string * "0"
    end
end

gamma = parse(Int, gamma_string, base = 2)
epsilon = parse(Int, epsilon_string, base = 2)

println("Part 1: ", gamma * epsilon)

oxygen = input
co2 = input

for i in 1:length(oxygen[1])
    if length(oxygen) == 1
        break
    end
    oxygen_columns = [x[n] for x = oxygen, n = 1:length(oxygen[1])]
    if count(j -> j == "0", oxygen_columns[:, i]) > count(j -> j == "1", oxygen_columns[:, i])
        global oxygen = filter(x -> x[i] == "0", oxygen)
    elseif count(j -> j == "1", oxygen_columns[:, i]) > count(j -> j == "0", oxygen_columns[:, i])
        global oxygen = filter(x -> x[i] == "1", oxygen)
    else
        global oxygen = filter(x -> x[i] == "1", oxygen)
    end
end

for i in 1:length(co2[1])
    if length(co2) == 1
        break
    end
    co2_columns = [x[n] for x = co2, n = 1:length(co2[1])]
    if count(j -> j == "0", co2_columns[:, i]) > count(j -> j == "1", co2_columns[:, i])
        global co2 = filter(x -> x[i] == "1", co2)
    elseif count(j -> j == "1", co2_columns[:, i]) > count(j -> j == "0", co2_columns[:, i])
        global co2 = filter(x -> x[i] == "0", co2)
    else
        global co2 = filter(x -> x[i] == "0", co2)
    end
end

oxygen = oxygen |> first |> join |> s -> parse(Int, s, base = 2)
co2 = co2 |> first |> join |> s -> parse(Int, s, base = 2)

println("Part 2: ", oxygen * co2)
