-- https://www.hackerrank.com/challenges/fp-filter-array/problem

module ArrayFilter where

type ArrFilter = Int -> [Int] -> [Int]

-- Return new array of values less than n --
--------------------------------------------
f :: ArrFilter
f _ [] = []
f n (x:xs) =
    if x < n
        then x : f n xs
    else
        f n xs

-- Using ListComp
-----------------
f2 :: ArrFilter
f2 n arr = [num | num <- arr, num < n]

-- Using filter
f3 :: ArrFilter
f3 n arr = filter (< n) arr

-- Using filter - Short
f4 :: ArrFilter
f4 n = filter (< n)

-- Using filter - Shorter
f5 :: ArrFilter
f5 = filter . (<)