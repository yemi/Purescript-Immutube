module Utils where

import DOM
import Data.DOM.Simple.Types
import Control.Monad.Eff
import Control.Monad.JQuery (JQueryEvent())

foreign import target
  """
  function target(e) {
    return function() {
      return e.target
    }
  }
  """ :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) HTMLElement
