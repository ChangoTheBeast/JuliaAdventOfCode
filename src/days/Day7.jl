#=
Day7:
- Julia version: 1.6.1
- Author: rlouc
- Date: 2021-06-22
=#

struct Program
    name::String
    weight::Int64
    children::Vector{String}
end

function hasChildren(program::Program)
    if !(isempty(program.children))
        return true
    end
    return false
end

function getProgram(programList::Vector{Program}, name::String)
    foreach(x->if x.name == name
        return x
    end, programList)
end
programList = Program[]
open("./inputs/Day7.txt", "r") do f
    for line in readlines(f)
        parts = split(line, " ")
        name = parts[1]
        global weight = 0
        children = String[]
        for i in 2:length(parts)
            part = parts[i]
            if (contains(part, "("))
                global weight = parse(Int64, replace(part, r"[()]+"=>""))
            end
            if (contains(part, ","))
                push!(children, replace(part, ","=>""))
            end
        end
        if !(isempty(children))
            push!(children, parts[length(parts)])
        end
        program = Program(name, weight, children)
        push!(programList, program)
    end
end
parents = Set()
children = Set()
foreach(x-> if hasChildren(x)
    push!(parents, x.name)
    foreach(y -> push!(children, y), x.children)
end, programList)
parents = setdiff(parents, children)
parentList = collect(String, parents)
day7Part1Solution = parentList[1]
day7Part2Solution = 0
println(day7Part1Solution)
println(day7Part2Solution)
open("../out/Day7Solution.txt", "w") do io
    write(io, "Part 1: $day7Part1Solution\n")
    write(io, "Part 2: $day7Part2Solution\n")
end