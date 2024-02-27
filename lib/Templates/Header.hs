{-# LANGUAGE OverloadedStrings #-}

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

data Page = About | Writing | Contact | Misc

pageName :: Page -> String
pageName page = case page of
  About -> "About"
  Writing -> "Writing"
  Contact -> "Contact"
  Misc -> "Misc."

pageLink :: Page -> AttributeValue
pageLink page = case page of
  About -> "/"
  Writing -> "/writing"
  Contact -> "/contact"
  Misc -> "/misc"

generateLink :: Page -> Bool -> H.Html
generateLink page isCurrent =
  H.a ! A.class_ "nav-link" ! A.href (pageLink page) $
    if isCurrent
      then H.b ! A.class_ "current-nav" $ pageName page
      else H.toHtml $ pageName page

headerTemplate :: H.Html
headerTemplate = H.header $ do
  H.img ! A.class_ "header-img" ! A.src "/images/pseudomata.png"
  H.h1 ! A.class_ "header-text" $ "Pseudomata"
  H.div ! A.class_ "navigation" $ do
    generateLink About False
    generateLink Writing False
    generateLink Contact False
    generateLink Misc False
