#=
Day1:
- Julia version: 1.6.1
- Author: rlouc
- Date: 2021-06-21
=#

function arrayCounter(ints, step)
    solution = 0
    for i in range(1, length = length(ints))
        x = ints[i]
        y = i + step
        if y > length(ints)
            y = y - length(ints)
        end
        y = ints[y]
        if (x == y)
            solution = solution + x
        end
    end
    return solution
end

input = read("./inputs/Day1.txt", String)
strings = split(strip(input), "")
ints = [parse(Int, ss) for ss in strings]
Day1Part1Solution = arrayCounter(ints, 1)
println(Day1Part1Solution)
Day1Part2Solution = arrayCounter(ints, Int64(length(ints)/2))
println(Day1Part2Solution)
open("../out/Day1Solution.txt", "w") do io
    write(io, "Part 1: $Day1Part1Solution\n")
    write(io, "Part 2: $Day1Part2Solution\n")
end

