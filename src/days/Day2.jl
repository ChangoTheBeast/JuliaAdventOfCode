#=
Day2:
- Julia version: 1.6.1
- Author: rlouc
- Date: 2021-06-21
=#
open("./inputs/Day2.txt") do f
    lines = readlines(f)
    global Day2Part1Solution = 0
    global Day2Part2Solution = 0
    global num = 0
    for line in lines
        strings = split(line, "\t")
        ints = [parse(Int, ss) for ss in strings]
        done = false
        for i in 1:length(ints)
            for j in i+1:length(ints)
                if done
                    break
                end
                global num = ints[i]/ints[j]
                if !isinteger(num)
                    global num = ints[j]/ints[i]
                    if isinteger(num)
                        num = Int64(num)
                        done = true
                    end
                else
                    num = Int64(num)
                    done = true
                end
            end
            if done
                break
            end
        end
        global Day2Part2Solution = Day2Part2Solution + num
        smallestNumber = minimum(ints)
        biggestNumber = maximum(ints)
        difference = biggestNumber - smallestNumber
        global Day2Part1Solution = Day2Part1Solution + difference
    end
    println(Day2Part1Solution)
    println(Day2Part2Solution)
end
open("../out/Day2Solution.txt", "w") do io
    write(io, "Part 1: $Day2Part1Solution\n")
    write(io, "Part 2: $Day2Part2Solution\n")
end