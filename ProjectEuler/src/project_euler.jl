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
        max < x && break
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

# Largest Prime Factor
function prob3()
    println(isprime(2))
    println(isprime(3))
    println(isprime(8))
    println(isprime(19))
    println(prime_factor(13195))
    println(maximum(prime_factor(600851475143)))
end

function isprime(x)
    if x == 2
        return true
    end
    if x < 2 || iseven(x)
        return false
    end
    i = 3
    while i * i < x
        if x % i == 0
            return false
        end
        i += 2
    end
    return true
end

function next_prime(x)
    i = x + 1
    while !isprime(i)
        i += 1
    end
    return i
end

function prime_factor(x)
    ret = []
    i = 2
    while !isprime(x)
        if x % i == 0
            push!(ret, i)
            x /= i
        else
            i = next_prime(i)
        end
    end
    push!(ret, Int(x))
    return ret
end

# Largest Palindrome Product
function prob4()
    println(max_palindrome_product(3))
end

function is_palindrome(s)
    return reverse(s) == s
end

function max_palindrome_product(digit)
    if digit == 1
        return 
    end
    max = 0
    for x in 10^(digit-1):10^digit-1
        for y in x:10^digit-1
            product = x * y
            product < max && continue
            if is_palindrome(string(product))
                max = product
            end
        end
    end
    return max
end

# Smallest Multiple
function prob5()
    println(smallest_multiple(1:10))
    #println(smallest_multiple(1:20))
end

function smallest_multiple(ls)
    i = 1
    while any(x -> i%x != 0, ls)
        i += 1
    end
    return i
end