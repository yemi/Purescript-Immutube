module Utils where

import DOM

import Data.DOM.Simple.Types
import Data.Maybe

import Control.Monad.Eff
import Control.Monad.JQuery (JQuery(), JQueryEvent())

import Rx.Observable

foreign import target
  """
  function target(e) {
    return function() {
      return e.target
    }
  }
  """ :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) HTMLElement

foreign import fromEvent
  """
  function fromEvent(evt) {
    return function(ob) {
      return function() {
        var Rx = require('rx');
        return Rx.Observable.fromEvent(ob, evt);
      }
    }
  }
  """ :: forall eff a. String -> JQuery -> Eff (dom :: DOM | eff) (Observable JQueryEvent)

fromEmpty :: String -> Maybe String
fromEmpty "" = Nothing
fromEmpty str = Just str
