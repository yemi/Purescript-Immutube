module Immutube where

import DOM

import Data.DOM.Simple.Document 
import Data.DOM.Simple.Window (document, globalWindow)
import Data.DOM.Simple.Types
import Data.DOM.Simple.Element
import Data.Foreign
import Data.Foreign.Class
import Data.Foreign.Index
import Data.Foldable
import Data.Either
import Data.Maybe
import Data.Traversable

import Debug.Trace

import Rx.Observable
import Rx.JQuery

import Control.Bind
import Control.Monad.Eff
import Control.Monad.Eff.Class
import Control.Monad.Aff
import qualified Control.Monad.JQuery as J

import Network.HTTP.Affjax

import Immutube.Types
import qualified Immutube.Player as P

import Utils


apiKey :: String
apiKey = "AIzaSyAWoa7aqds2Cx_drrrb5FPsRObFa7Dxkfg"

eventValue :: forall eff. J.JQueryEvent -> Eff (dom :: DOM | eff) String
eventValue = value <=< target

valueStream :: forall eff. J.JQuery -> Eff (dom :: DOM | eff) (Observable String)
valueStream = (unwrap <<< (<$>) eventValue) <=< fromEvent "keyup"

termToUrl :: String -> String
termToUrl term = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=" ++ term ++ "&key=" ++ apiKey

urlStream :: forall eff. J.JQuery -> Eff (dom :: DOM | eff) (Observable String)
urlStream = (return <<< (<$>) termToUrl) <=< valueStream

getItems :: forall eff. F Items -> Items
getItems (Right items) = items

renderItem :: forall e. Item -> Eff (dom :: DOM | e) J.JQuery
renderItem (Item o)= do
  li <- J.setAttr "data-youtubeid" o.id =<< J.create "<li>"
  J.appendText o.title li

renderItems :: forall eff. Items -> Eff (dom :: DOM | eff) [J.JQuery]
renderItems (Items items) = traverse renderItem items

search :: forall aff. String -> Aff (dom :: DOM, ajax :: AJAX | aff) [J.JQuery]
search = (liftEff <<< renderItems <<< getItems <<< readJSON <<< _.response) <=< get

clickStream :: forall eff. J.JQuery -> Eff (dom :: DOM | eff) (Observable HTMLElement)
clickStream = (unwrap <<< (<$>) target) <=< fromEvent "click"

youtubeId :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) (Maybe String)
youtubeId el = do
  id <- getAttribute "data-youtubeid" el
  case id of
       "" -> pure $ Nothing
       id' -> pure $ Just id'

main = do

  urls <- urlStream =<< J.select "#search"
  subscribe urls $ \term -> launchAff $ do
    items <- search term

    let results = J.select "#results"
    liftEff $ J.clear =<< results
    liftEff $ foldl (\acc curr -> acc >>= J.append curr) results items

  clicks <- clickStream =<< J.select "#results"
  subscribe clicks $ \el -> do
    document' <- document globalWindow
    Just player <- querySelector "#player" document'
    id <- youtubeId el

    maybe (pure unit) (flip setInnerHTML player <<< P.create) id

