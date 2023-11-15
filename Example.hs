module Main where

import Data.Hashable
import System.Environment (getArgs)

main = do
  args <- getArgs
  print (hash args)
