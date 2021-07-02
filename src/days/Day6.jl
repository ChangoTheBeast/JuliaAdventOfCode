#=
Day6:
- Julia version: 1.6.1
- Author: rlouc
- Date: 2021-06-22
=#

global input = Int64[]
open("./inputs/Day6.txt", "r") do f
for line in readlines(f)
    vals = split(line, "\t")
    for val in vals
        push!(input, parse(Int, val))
    end
end
end
finished = false
inputSet = Set()
inputList = Vector()
day6Part1Solution = 0
day6Part2Solution = 0
while !finished
    if !(input in inputSet)
        push!(inputSet, deepcopy(input))
    else
        global finished = true
        idx = findfirst(x->x==input, inputList)
        global day6Part2Solution = day6Part1Solution - idx + 1
        break
    end
    push!(inputList, deepcopy(input))
    global day6Part1Solution = day6Part1Solution + 1
    global maxVal = maximum(input)
    global index = findfirst(x -> x==maxVal, input)
    input[index] = 0
    while maxVal > 0
        global index = index + 1
        if index > length(input)
            global index = index - length(input)
        end
        input[index] += 1
        global maxVal = maxVal - 1
    end
end
println(day6Part1Solution)
println(day6Part2Solution)
open("../out/Day6Solution.txt", "w") do io
    write(io, "Part 1: $day6Part1Solution\n")
    write(io, "Part 2: $day6Part2Solution\n")
end