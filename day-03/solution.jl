using DelimitedFiles

input = readdlm("input", String) |> v -> map(s -> split(s, ""), v)
columns = [x[n] for x = input, n = 1:length(input[1])]

gamma_string = ""
epsilon_string = ""

for i in 1:length(input[1])
    if count(j -> j == "0", columns[:, :, i]) > count(j -> j == "1", columns[:, :, i])
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
