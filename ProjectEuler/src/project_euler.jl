# Multiples of 3 or 5
function prob1()
    println(multiples_of(10, [3, 5]))
    println(sum(multiples_of(1000, [3, 5])))
    println(sum(multiples_of_v2(1000, [3, 5])))
end

function multiples_of(x, ls)
    ret = []
    for i in 1:x-1
        any(y -> i % y == 0, ls) && push!(ret, i)
    end
    return ret
end

function multiples_of_v2(x, ls)
    filter(i -> any(y -> i % y == 0, ls), 1:x-1)
end