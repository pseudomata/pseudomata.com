{-# LANGUAGE OverloadedStrings #-}

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

fonts :: [String]
fonts =
  [ "/fonts/Hubot-Sans.woff2",
    "/fonts/Mona-Sans.woff2",
    "/fonts/Monaspace-Neon.woff2"
  ]

generateFontPreloads :: [String] -> Html
generateFontPreloads =
  mapM_
    ( \fontPath ->
        link
          ! A.rel "preload"
          ! A.href (toValue fontPath)
          ! A.as "font"
          ! A.type_ "font/woff2"
          ! A.crossorigin "anonymous"
    )
    fonts

websiteHead :: Html
websiteHead = H.head $ do
  meta ! A.charset "UTF-8"
  meta ! A.name "viewport" ! A.content "width=device-width, initial-scale=1.0"

  generateFontPreloads fonts

  link ! A.rel "preload" ! A.as "image" ! A.href "/images/pseudomata.png"
  link ! A.rel "icon" ! A.type_ "image/png" ! A.href "/images/pseudomata.png"

  link ! A.rel "preload" ! A.href "/style.css" ! A.as "style"
  link ! A.rel "stylesheet" ! A.href "/style.css"

  meta ! A.name "robots" ! A.content "noindex, nofollow, nosnippet"

  title "Pseudomata"
