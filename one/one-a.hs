module One.A where

import Prelude
import System.IO
import Data.List

import Helpers

-- | Finds the pair of values in the list that sum to the target
findPairForTarget   :: Int          -- ^ The target sum
                    -> [Int]        -- ^ The list of values
                    -> Int          -- ^ The left index
                    -> Int          -- ^ The right index
                    -> (Int, Int)   -- ^ The matching pair
findPairForTarget t vs l r
    | l >= r    = (0, 0)
    | s < t     = findPairForTarget t vs (l + 1) r
    | s > t     = findPairForTarget t vs l (r - 1)
    | otherwise = (vs !! l, vs !! r)
  where
    s = (vs !! l) + (vs !! r)

-- multiplies a pair of integers
multiplyPair :: (Int, Int) -> Int
multiplyPair (a, b) = a * b

runOneA :: IO Int
runOneA = do
    values <- readFileAsInts "one/input.txt"
    let sortedValues = sort values
    let l = 0
    let r = (length sortedValues) - 1
    let p = findPairForTarget 2020 sortedValues l r
    return $ multiplyPair p