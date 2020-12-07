module One.A.1 where

import Prelude
import System.IO
import Data.Char
import Data.List
import Data.Function

-- finds the pair of values in the list that add to 2020
-- function (h:t) - this notation describes the head (first value) and the tail (remaining values) of a list
-- elem - returns true if the first argument exists in the second argument list
-- using elem is pretty clever, https://github.com/haskelling/aoc2020/blob/main/1a.hs
findPair :: [Integer] -> (Integer, Integer)
findPair [] = (0, 0)
findPair (h:t) =
    if elem (2020 - h) t then (h, 2020 - h)
    else findPair t

-- multiplies a pair of integers
multiplyPair :: (Integer, Integer) -> Integer
multiplyPair (a, b) = a * b

-- maps read to each value, haskell figures out the data types from the toInts declaration
toInts :: [String] -> [Integer]
toInts = map read

runOneA_1 :: IO ()
runOneA_1 = do
    contents <- readFile "input.txt"
    print $
        contents
        & lines
        & toInts
        & findPair
        & multiplyPair