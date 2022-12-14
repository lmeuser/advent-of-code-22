import System.Environment (getArgs)
import Text.Read (readMaybe)

import qualified Days.Day1
import qualified Days.Day2
import qualified Days.Day3
import qualified Days.Day4
import qualified Days.Day5
import qualified Days.Day6
import qualified Days.Day7
import qualified Days.Day8
import qualified Days.Day9
import qualified Days.Day10
import qualified Days.Day11

days = [ Days.Day1.solution
       , Days.Day2.solution
       , Days.Day3.solution
       , Days.Day4.solution
       , Days.Day5.solution
       , Days.Day6.solution
       , Days.Day7.solution
       , Days.Day8.solution
       , Days.Day9.solution
       , Days.Day10.solution
       , Days.Day11.solution
       ]

runDay day = (days !! (day - 1)) day

main :: IO ()
main = do
    args <- getArgs
    let existingDays = [1..length days]
    if null args then
         mapM_ runDay existingDays
    else
        case readMaybe . head $ args of
            Nothing -> putStrLn "You need to provide either no arguments, or a day number"
            Just x -> if x `elem` existingDays then
                          runDay x
                      else
                          putStrLn ("Day " ++ show x ++ " does not exist")
