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
    while i * i <= x
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

# Sum Square Difference
function prob6()
    println(sum_square_difference(10))
    println(sum_square_difference(100))
end

function square(x)
    return x^2
end

function sum_square_difference(n)
    return square(sum(1:n)) - sum(map(square, 1:n))
end

# 10001st Prime
function prob7()
    println(nth_prime(1))
    println(nth_prime(6))
    println(nth_prime(10001))
end

function nth_prime(n)
    x = 1
    for _ in 1:n
        x = next_prime(x)
    end
    return x
end

# Largest Product in a Series
function prob8()
    println(max_product_series(PROB8, 4))
    println(max_product_series(PROB8, 13))
    println(max_product_series_v2(PROB8, 13))
end

const PROB8 = """
73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450
"""

function max_product_series(series, n)
    ls = [parse(Int, c) for c in replace(series, r"\D" => "")]
    max = 0
    for i in 1:length(ls)-n+1
        x = reduce(*, ls[i:i+n-1])
        if x > max
            max = x
        end
    end
    return max
end

function max_product_series_v2(series, n)
    ls = [parse(Int, c) for c in replace(series, r"\D" => "")]
    return maximum([reduce(*, ls[i:i+n-1]) for i in 1:(length(ls)-n+1)])
end

# Special Pythagorean Triplet
function prob9()
    println(sepcial_pythagorean_triplet(12))
    println(sepcial_pythagorean_triplet(1000))
    println(reduce(*, sepcial_pythagorean_triplet(1000)))
end

function sepcial_pythagorean_triplet(x)
    for a in 1:floor(Int, x/3)
        for b in a:x-a
            c = x - a - b
            if a^2 + b^2 == c^2
                return [a, b, c]
            end
        end
    end
    return [0, 0, 0]
end

# Summation of Primes
function prob10()
    println(sum(primes_below(10)))
    println(sum(primes_below(2000000)))
end

function primes_below(x)
    filter(isprime, 1:x)
end

# Largest Product in a Grid
function prob11()
    println(max_grid_product(PROB11, 4))
end

const PROB11 = [
    8  2 22 97 38 15  0 40  0 75  4  5  7 78 52 12 50 77 91  8;
    49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48  4 56 62  0;
    81 49 31 73 55 79 14 29 93 71 40 67 53 88 30  3 49 13 36 65;
    52 70 95 23  4 60 11 42 69 24 68 56  1 32 56 71 37  2 36 91;
    22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80;
    24 47 32 60 99  3 45  2 44 75 33 53 78 36 84 20 35 17 12 50;
    32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70;
    67 26 20 68  2 62 12 20 95 63 94 39 63  8 40 91 66 49 94 21;
    24 55 58  5 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72;
    21 36 23  9 75  0 76 44 20 45 35 14  0 61 33 97 34 31 33 95;
    78 17 53 28 22 75 31 67 15 94  3 80  4 62 16 14  9 53 56 92;
    16 39  5 42 96 35 31 47 55 58 88 24  0 17 54 24 36 29 85 57;
    86 56  0 48 35 71 89  7  5 44 44 37 44 60 21 58 51 54 17 58;
    19 80 81 68  5 94 47 69 28 73 92 13 86 52 17 77  4 89 55 40;
     4 52  8 83 97 35 99 16  7 97 57 32 16 26 26 79 33 27 98 66;
    88 36 68 87 57 62 20 72  3 46 33 67 46 55 12 32 63 93 53 69;
     4 42 16 73 38 25 39 11 24 94 72 18  8 46 29 32 40 62 76 36;
    20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74  4 36 16;
    20 73 35 29 78 31 90  1 74 31 49 71 48 86 81 16 23 57  5 54;
     1 70 54 71 83 51 54 69 16 92 33 48 61 43 52  1 89 19 67 48;
]

function max_grid_product(grid, length)
    max_prod = 0
    rows, cols = size(grid)

    for i in 1:rows
        for j in 1:cols
            if j + length - 1 <= cols
                #horizontal
                prod = reduce(*, (grid[i, j:j+length-1]))
                max_prod = max(max_prod, prod)
            end
            if i + length - 1 <= rows
                #vertical
                prod = reduce(*, grid[i:i+length-1, j])
                max_prod = max(max_prod, prod)
            end
            if i + length - 1 <= rows && j + length - 1 <= cols
                #right-down diagonal
                prod = reduce(*, [grid[i+k, j+k] for k in 0:length-1])
                max_prod = max(max_prod, prod)
            end
            if i + length - 1 <= rows && j - length + 1 >= 1
                #right-up diagonal
                prod = reduce(*, [grid[i+k, j-k] for k in 0:length-1])
                max_prod = max(max_prod, prod)
            end
        end
    end

    return max_prod
end

# Highly Divisible Triangular Number
function prob12()
    println(triangle_with_divisors(500))
end

function count_divisors(n)
    count = 0
    for i in 1:floor(Int, sqrt(n))
        if n % i == 0
            count += 2
        end
    end
    if isqrt(n)^2 == n
        count -= 1
    end
    return count
end

function triangle_with_divisors(limit)
    n = 1
    triangle = 0
    while true
        triangle += n
        if count_divisors(triangle) > limit
            return triangle
        end
        n += 1
    end
end