# Multiples of 3 or 5
function prob1()
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

# Even Fibonacci Numbers
function prob2()
    println(fibonacci(1, 2, 10))
    println(sum(filter(iseven, fibonacci_below(1, 2, 4000000))))
    println(sum(filter(iseven, fibonacci_below_v2(1, 2, 4000000))))
end

function fibonacci(a, b, count)
    ret = [a, b]
    for _ in 3:count
        a, b = b, a + b
        push!(ret, b)
    end
    return ret
end

function fibonacci_below(a, b, max)
    ret = [a, b]
    while true
        x = a + b
        if (max < x) 
            break
        end
        push!(ret, x)
        a = b
        b = x
    end
    return ret
end

function fibonacci_below_v2(a, b, max)
    ret = [a, b]
    while (x = a + b) <= max
        push!(ret, x)
        a, b = b, x
    end
    return ret
end