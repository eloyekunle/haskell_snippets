-- https://www.hackerrank.com/challenges/fp-filter-array/problem

module RepeatArrayElements where

type RepElms = Int -> [Int] -> [Int]

-- Doing it bottom up
--------------------------
rep :: Int -> Int -> [Int]
rep n x =
  if n == 1
    then [x]
    else x : rep (n-1) x

f :: RepElms
f _ [] = []
f n (x:xs) =
  if null xs
    then rep n x
  else rep n x ++ f n xs


-- Using 'replicate'
---------------------------
f2 :: RepElms
f2 _ [] = []
f2 n (x:xs) =
  if null xs
    then replicate n x
  else rep n x ++ f2 n xs


-- Using 'concatMap' with 'replicate'
-------------------------------------
f3 :: RepElms
f3 n = concatMap (replicate n)

-- Or
-----
f5 :: RepElms
f5 = concatMap . replicate

-- Or
f6 :: RepElms
f6 n arr = arr >>= replicate n


-- Using nested loops
------------------------------
f4 :: RepElms
f4 n arr =
  [num | num <- arr, _ <- [1..n]]
