-- https://www.hackerrank.com/challenges/fp-reverse-a-list/problem

module ReverseList where

type RevList = [Int] -> [Int]

-- Using Recursion
-- Inefficient, because: 
--   [Haskell (:) and (++) differences] (https://stackoverflow.com/questions/1817865/haskell-and-differences)
--   [Why are difference lists more efficient than regular concatenation?] (https://stackoverflow.com/questions/13879260/why-are-difference-lists-more-efficient-than-regular-concatenation)
--   [Haskell foldl' poor performance with (++)] (https://stackoverflow.com/questions/14938584/haskell-foldl-poor-performance-with)
--   [Performance/Accumulating parameter] (https://wiki.haskell.org/Performance/Accumulating_parameter)
--------------------------
rev :: RevList
rev (x:xs) = rev xs ++ [x]
rev _ = []

-- Using accumulator
------------------------------
rev2 :: RevList
rev2 = foldl (\acc x -> x : acc) []

-- Using accumulator, with flip.
------------------------------------
rev3 :: RevList
rev3 = foldl (flip (:)) []