#=
Day3:
- Julia version: 1.6.1
- Author: rlouc
- Date: 2021-06-21
=#

function getSurrounding(matrix::Array{Int}, coord::CartesianIndex)
    sum = 0
    matSize = size(matrix)
    if (coord[2] + 1 <= matSize[2])
        if (coord[1] + 1 <= matSize[1])
            sum = sum + matrix[coord[1] + 1, coord[2] + 1]
        end
        sum = sum + matrix[coord[1], coord[2] + 1]
        if (coord[1] - 1 > 0)
            sum = sum + matrix[coord[1] - 1, coord[2] + 1]
        end
    end
    if (coord[2] - 1 > 0)
        if (coord[1] + 1 <= matSize[1])
            sum = sum + matrix[coord[1] + 1, coord[2] - 1]
        end
        sum = sum + matrix[coord[1], coord[2] - 1]
        if (coord[1] - 1 > 0)
            sum = sum + matrix[coord[1] - 1, coord[2] - 1]
        end
    end
    if (coord[1] + 1 <= matSize[1])
        sum = sum + matrix[coord[1] + 1, coord[2]]
    end
    if (coord[1] - 1 > 0)
        sum = sum + matrix[coord[1] - 1, coord[2]]
    end
    if sum == 0
        sum+=1
    end
    return sum
end

function spiral_matrix(n::Int)
    spm = Array{Int}(undef, n, n)
    num = r = c = 1
    rend = cend = n
    while r <= rend && c <= cend

    # bottom-most row
        for i in cend:-1:c
            spm[rend, i] = n^2 -  num + 1
            num += 1
        end
        rend -= 1

    # left-most column
        for i in rend:-1:r
            spm[i, c] = n^2 -  num + 1
            num += 1
        end
        c += 1
    # top-most row
        for i in c:cend
            spm[r, i] = n^2 - num + 1
            num += 1
        end
        r += 1

    # right-most column
    for i in r:rend
        spm[i, cend] = n^2 -  num + 1
        num += 1
    end
    cend -= 1

    end
    return spm
end

function spiral_matrix_adjacent(originalSpiral::Array{Int}, targetVal::Int64)
    spm = zeros(Int64, size(originalSpiral))
    for i in 1:length(originalSpiral)
        coord = findfirst(x->x==i, originalSpiral)
        val = getSurrounding(spm, coord)
        if (val > targetVal)
            return val
        end
        spm[coord[1], coord[2]] = val
    end
end

n = 277678
spiral = spiral_matrix(Int64(ceil(sqrt(n))))
centre = findfirst(x->x==1, spiral)
valueLocation = findfirst(x->x==n, spiral)
Day3Part1Solution = abs(centre[1] - valueLocation[1]) + abs(centre[2] - valueLocation[2])
println(Day3Part1Solution)
Day3Part2Solution = spiral_matrix_adjacent(spiral, n)
println(Day3Part2Solution)
open("../out/Day3Solution.txt", "w") do io
    write(io, "Part 1: $Day3Part1Solution\n")
    write(io, "Part 2: $Day3Part2Solution\n")
end