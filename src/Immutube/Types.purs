module Immutube.Types where

import Data.Foreign
import Data.Foreign.Class
import Data.Foreign.Index

import Debug.Trace

import Control.Bind

newtype Item = Item { title :: String, id :: String }
newtype Items = Items [Item]

instance itemsIsForeign :: IsForeign Items where
  read value = do
    items <-  value # readProp "items"
    return $ Items items

instance itemIsForeign :: IsForeign Item where
  read value = do
    title <- value # readProp "snippet" >=> readProp "title"
    id <- value # readProp "id" >=> readProp "videoId"
    return $ Item { title: title, id: id }

