--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
--import qualified Text.Pandoc.Options as Pandoc.Options


--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith config $ do

    -- copy site icon to `favicon.ico`
    match "images/favicon.ico" $ do
        route   (constRoute "favicon.ico")
        compile copyFileCompiler

    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    -- copy js bits
    match "js/**" $ do
        route   idRoute
        compile copyFileCompiler

    -- copy humans.txt and robots.txt to web root
    match (fromList ["humans.txt", "robots.txt"]) $ do
        route   idRoute
        compile copyFileCompiler

    match "about.markdown" $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    create ["contact.html"] $ do
        route idRoute
        compile $ do
            let contactCtx =
                    constField "title" "Contact"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/contact.html" contactCtx
                >>= loadAndApplyTemplate "templates/default.html" contactCtx
                >>= relativizeUrls

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Archives"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls


    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let indexCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Home"                `mappend`
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

--------------------------------------------------------------------------------
config :: Configuration
config = defaultConfiguration
        { deployCommand = "rsync -avz -e ssh ./_site/ username:/srv/www/example.com.au/" }


--pandocWriterOptions :: Pandoc.Options.WriterOptions
--pandocWriterOptions = defaultHakyllWriterOptions
--                        { Pandoc.Options.writerHtml5 = True
--                        , Pandoc.Options.writerHtmlQTags = True
--                        --, Pandoc.Options.writerNumberSections = True
--                        --, Pandoc.Options.writerNumberOffset = [1]
--                        , Pandoc.Options.writerSectionDivs = True
--                        , Pandoc.Options.writerTableOfContents = True
--                    }
--------------------------------------------------------------------------------
