module Main where

import qualified Website (generate)

-- Paths to directories, assuming the command is run from the root of the repository.
contentPages = "content/"
staticAssets = "static/"
templatesDir = "templates/"
outputDir = "generated/"

main :: IO ()
main = do
  putStrLn "Generating static webpages..."
  Website.generate contentPages staticAssets templatesDir outputDir
