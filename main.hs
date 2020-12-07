module Main (main) where

import One.A

main :: IO ()
main = do
    oneA <- runOneA
    print $ oneA
    --print $ oneTwo