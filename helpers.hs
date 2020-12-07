module Helpers where
import System.IO
import Data.Function

-- Reads a list of String as a list of Integer
readAsInt :: [String] -> [Int]
readAsInt = map read

-- Reads a file as Integers
-- The output type is an IO Action
readFileAsInts :: String -> IO [Int]
readFileAsInts path = do
    contents <- readFile path
    return $ readAsInt (lines contents)