{-# LANGUAGE OverloadedStrings #-}

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

websiteFooter :: Html
websiteFooter =
  footer $ do
    "© 2023 "
    a ! A.href "/" $ b "Pseudomata"
    " · Website " a ! A.href "/privacy" $ b "Privacy Policy"
    " · This work is licensed under " a ! A.href "https://creativecommons.org/licenses/by-nc-nd/4.0/" $ b "CC BY-NC-ND 4.0"
