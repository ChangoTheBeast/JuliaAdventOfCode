#=
AdventOfCode:
- Julia version: 1.6.1
- Author: rlouc
- Date: 2021-06-21
=#
for (root, dirs, files) in walkdir("./days")
    for file in files
        println("-----------")
        println(SubString(file, 1:length(file)-3))
        println("-----------")
        include(joinpath(root, file))
        println("-----------")
    end
end