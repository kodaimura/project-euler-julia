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

function prob8()
    println(max_product_series(PROB8, 4))
    println(max_product_series(PROB8, 13))
    println(max_product_series_v2(PROB8, 13))
end

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

function prob11()
    println(max_grid_product(PROB11, 4))
end

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

# Large Sum
const PROB13 = """
37107287533902102798797998220837590246510135740250
46376937677490009712648124896970078050417018260538
74324986199524741059474233309513058123726617309629
91942213363574161572522430563301811072406154908250
23067588207539346171171980310421047513778063246676
89261670696623633820136378418383684178734361726757
28112879812849979408065481931592621691275889832738
44274228917432520321923589422876796487670272189318
47451445736001306439091167216856844588711603153276
70386486105843025439939619828917593665686757934951
62176457141856560629502157223196586755079324193331
64906352462741904929101432445813822663347944758178
92575867718337217661963751590579239728245598838407
58203565325359399008402633568948830189458628227828
80181199384826282014278194139940567587151170094390
35398664372827112653829987240784473053190104293586
86515506006295864861532075273371959191420517255829
71693888707715466499115593487603532921714970056938
54370070576826684624621495650076471787294438377604
53282654108756828443191190634694037855217779295145
36123272525000296071075082563815656710885258350721
45876576172410976447339110607218265236877223636045
17423706905851860660448207621209813287860733969412
81142660418086830619328460811191061556940512689692
51934325451728388641918047049293215058642563049483
62467221648435076201727918039944693004732956340691
15732444386908125794514089057706229429197107928209
55037687525678773091862540744969844508330393682126
18336384825330154686196124348767681297534375946515
80386287592878490201521685554828717201219257766954
78182833757993103614740356856449095527097864797581
16726320100436897842553539920931837441497806860984
48403098129077791799088218795327364475675590848030
87086987551392711854517078544161852424320693150332
59959406895756536782107074926966537676326235447210
69793950679652694742597709739166693763042633987085
41052684708299085211399427365734116182760315001271
65378607361501080857009149939512557028198746004375
35829035317434717326932123578154982629742552737307
94953759765105305946966067683156574377167401875275
88902802571733229619176668713819931811048770190271
25267680276078003013678680992525463401061632866526
36270218540497705585629946580636237993140746255962
24074486908231174977792365466257246923322810917141
91430288197103288597806669760892938638285025333403
34413065578016127815921815005561868836468420090470
23053081172816430487623791969842487255036638784583
11487696932154902810424020138335124462181441773470
63783299490636259666498587618221225225512486764533
67720186971698544312419572409913959008952310058822
95548255300263520781532296796249481641953868218774
76085327132285723110424803456124867697064507995236
37774242535411291684276865538926205024910326572967
23701913275725675285653248258265463092207058596522
29798860272258331913126375147341994889534765745501
18495701454879288984856827726077713721403798879715
38298203783031473527721580348144513491373226651381
34829543829199918180278916522431027392251122869539
40957953066405232632538044100059654939159879593635
29746152185502371307642255121183693803580388584903
41698116222072977186158236678424689157993532961922
62467957194401269043877107275048102390895523597457
23189706772547915061505504953922979530901129967519
86188088225875314529584099251203829009407770775672
11306739708304724483816533873502340845647058077308
82959174767140363198008187129011875491310547126581
97623331044818386269515456334926366572897563400500
42846280183517070527831839425882145521227251250327
55121603546981200581762165212827652751691296897789
32238195734329339946437501907836945765883352399886
75506164965184775180738168837861091527357929701337
62177842752192623401942399639168044983993173312731
32924185707147349566916674687634660915035914677504
99518671430235219628894890102423325116913619626622
73267460800591547471830798392868535206946944540724
76841822524674417161514036427982273348055556214818
97142617910342598647204516893989422179826088076852
87783646182799346313767754307809363333018982642090
10848802521674670883215120185883543223812876952786
71329612474782464538636993009049310363619763878039
62184073572399794223406235393808339651327408011116
66627891981488087797941876876144230030984490851411
60661826293682836764744779239180335110989069790714
85786944089552990653640447425576083659976645795096
66024396409905389607120198219976047599490197230297
64913982680032973156037120041377903785566085089252
16730939319872750275468906903707539413042652315011
94809377245048795150954100921645863754710598436791
78639167021187492431995700641917969777599028300699
15368713711936614952811305876380278410754449733078
40789923115535562561142322423255033685442488917353
44889911501440648020369068063960672322193204149535
41503128880339536053299340368006977710650566631954
81234880673210146739058568557934581403627822703280
82616570773948327592232845941706525094512325230608
22918802058777319719839450180888072429661980811197
77158542502016545090413245809786882778948721859617
72107838435069186155435662884062257473692284509516
20849603980134001723930671666823555245252804609722
53503534226472524250874054075591789781264330331690
"""

function prob13()
    ls = map(x -> parse(BigInt, x), filter(!isempty, split(PROB13, "\n")))
    println(string(sum(ls))[1:10])    
end

# Longest Collatz Sequence
function prob14()
    println(collatz_sequence(13))
    println(longest_collatz_sequence(1000000))
end

function longest_collatz_sequence(limit)
    ret = 0
    max_len = 0
    for i in 1:limit
        len = length(collatz_sequence(i))
        if len > max_len
            max_len = len
            ret = i
        end
    end
    return ret
end

function collatz_sequence(x)
    ret = [x]
    while true
        x = iseven(x) ? Int(x / 2) : 3x + 1 
        push!(ret, x)
        x == 1 && break
    end
    return ret 
end

# Lattice Paths
function prob15()
    println(lattice_paths(2))
    println(lattice_paths(20))
end

function lattice_paths(n)
    factorial(BigInt(2n)) ÷ (factorial(BigInt(n))^2)
end

# Power Digit Sum
function prob16()
    println(sum_digits(2^15))
    println(sum_digits(BigInt(2)^1000))
end

function sum_digits(n)
    sum(map(x -> parse(Int, x), split(string(n), "")))
end

# Maximum Path Sum I
const PROB18 = [
    [75],
    [95, 64],
    [17, 47, 82],
    [18, 35, 87, 10],
    [20, 4, 82, 47, 65],
    [19, 1, 23, 75, 3, 34],
    [88, 2, 77, 73, 7, 63, 67],
    [99, 65, 4, 28, 6, 16, 70, 92],
    [41, 41, 26, 56, 83, 40, 80, 70, 33],
    [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
    [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
    [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
    [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
    [63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
    [4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]
]

function prob18()
    println(maximum_path_sum([[3],[7, 4],[2, 4, 6],[8, 5, 9, 3]]))
    println(maximum_path_sum(PROB18))
end

function maximum_path_sum(triangle)
    for row in length(triangle)-1:-1:1
        for col in 1:length(triangle[row])
            triangle[row][col] += maximum([triangle[row+1][col], triangle[row+1][col+1]])
        end
    end
    return triangle[1][1]
end

# Counting Sundays
function prob19()
    println(count_sundays(1901, 2000, get_day_of_week(1901, 1, 1)))
end

function is_leapyear(year)
    return year % 4 == 0 && !(year % 100 == 0 && year % 400 != 0)
end

function get_day_of_week(year, month, day)
    month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    day_of_week = 1 #1900/1/1 -> monday

    for y in 1900:year
        for m in 1:12
            if y == year && m == month
                for m in 1:month
                    day_of_week = (day_of_week + day - 1) % 7 + 1
                end
                break
            end
            days = month_days[m]
            if m == 2 && is_leapyear(y)
                days += 1
            end
            day_of_week = (day_of_week + days - 1) % 7 + 1
        end
    end
    
    return day_of_week
end

function count_sundays(start_year, end_year, start_day_of_week)
    ret = 0
    month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    day_of_week = start_day_of_week

    for y in start_year:end_year
        for m in 1:12
            if day_of_week == 7
                ret += 1
            end
            days = month_days[m]
            if m == 2 && is_leapyear(y)
                days += 1
            end
            day_of_week = (day_of_week + days - 1) % 7 + 1
        end
    end
    
    return ret
end

# Factorial Digit Sum
function prob20()
    println(sum_digits(factorial(10)))
    println(sum_digits(factorial(BigInt(100))))
end