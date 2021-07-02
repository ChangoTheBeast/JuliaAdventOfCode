#=
Day5:
- Julia version: 1.6.1
- Author: rlouc
- Date: 2021-06-22
=#
open("./inputs/Day5.txt") do f
    cpuInstructions = Int64[]
    for line in readlines(f)
        push!(cpuInstructions, parse(Int, line))
    end
    cpuInstructionsPart2 = deepcopy(cpuInstructions)
    try
        i = 1
        global day5Part1Solution = 0
            while true
                jumpOffset = cpuInstructions[i]
                cpuInstructions[i]+=1
                i += jumpOffset
                global day5Part1Solution += 1
            end
    catch
    end

    try
        i = 1
        global day5Part2Solution = 0
            while true
                jumpOffset = cpuInstructionsPart2[i]
                if jumpOffset < 3
                    cpuInstructionsPart2[i]+=1
                else
                    cpuInstructionsPart2[i]-=1
                end
                i += jumpOffset
                global day5Part2Solution += 1
            end
    catch
    end

    println(day5Part1Solution)
    println(day5Part2Solution)
    open("../out/Day5Solution.txt", "w") do io
        write(io, "Part 1: $day5Part1Solution\n")
        write(io, "Part 2: $day5Part2Solution\n")
    end
end
