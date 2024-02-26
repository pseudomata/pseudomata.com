module Website (generate) where

-- Takes paths to directories with different files needed to generate the website
-- e.g. `contentPages` contains all the Markdown files to be rendered as HTML
--      `staticAssets` contains static assets like CSS files, images, fonts
--      `outputDir` is the path to the directory with the final generated website
generate :: IO ()
generate = do
  putStrLn $ "Generating website stuff..."
