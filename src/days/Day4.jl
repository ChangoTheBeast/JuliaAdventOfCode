#=
Day4:
- Julia version: 1.6.1
- Author: rlouc
- Date: 2021-06-22
=#
global input = undef
open("./inputs/Day4.txt", "r") do f
    global input = readlines(f)
end
global day4Part1Solution = 0
global day4Part2Solution = 0
for passphrase in input
    words = split(passphrase, " ")
    wordSet = Set(words)
    if length(wordSet) == length(words)
        global day4Part1Solution += 1
    end
    charRepresentations = String[]
    for word in words
        charRep = sort(split(word, ""))
        charRep = join(charRep, "")
        push!(charRepresentations, charRep)
    end
    charRepSet = Set(charRepresentations)
    if length(charRepSet) == length(charRepresentations)
        global day4Part2Solution += 1
    end
end
println(day4Part1Solution)
println(day4Part2Solution)
open("../out/Day4Solution.txt", "w") do io
    write(io, "Part 1: $day4Part1Solution\n")
    write(io, "Part 2: $day4Part2Solution\n")
end