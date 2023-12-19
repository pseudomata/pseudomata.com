module Main where

import qualified Website (generate)
import System.Directory (doesDirectoryExist)
import Control.Monad (unless)

-- Paths to directories, assuming the command is run from the root of the repository.
contentPages :: String
contentPages = "content/"

staticAssets :: String
staticAssets = "static/"

outputDir :: String
outputDir = "generated/"

checkDirectories :: [String] -> IO ()
checkDirectories dirs = mapM_ checkDirectoryExistence dirs

checkDirectoryExistence :: String -> IO ()
checkDirectoryExistence dir = do
  exists <- doesDirectoryExist dir
  unless exists $ error $ "Error: Directory not found - " ++ dir

main :: IO ()
main = do
  putStrLn "Preliminary checks..."
  checkDirectories [contentPages, staticAssets, outputDir]

  putStrLn "Generating static webpages..."
  Website.generate contentPages staticAssets outputDir
