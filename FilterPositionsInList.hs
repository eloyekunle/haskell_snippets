-- https://www.hackerrank.com/challenges/fp-filter-positions-in-a-list/problem

module FilterPositionsInList where

type FilterPos = [Int] -> [Int]

-- Using Pattern Matching
-------------------------
f2 :: FilterPos
f2 (_:x:xs) = x : f xs
f2 _ = []

-- Using List Comprehension
------------------------------------------------
f :: FilterPos
f lst = [lst!!n | n<-[0..length lst - 1], odd n]

-- Using map/filter/zip
f3 :: FilterPos
f3 = map snd . filter (odd . fst) . zip [0..]