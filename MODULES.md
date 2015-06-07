# Module Documentation

## Module Immutube

#### `Item`

``` purescript
newtype Item
  = Item { stars :: Number, name :: String }
```


#### `Items`

``` purescript
newtype Items
  = Items [Item]
```


#### `showItem`

``` purescript
instance showItem :: Show Item
```


#### `showItems`

``` purescript
instance showItems :: Show Items
```


#### `itemsIsForeign`

``` purescript
instance itemsIsForeign :: IsForeign Items
```


#### `itemIsForeign`

``` purescript
instance itemIsForeign :: IsForeign Item
```


#### `target`

``` purescript
target :: forall eff. J.JQueryEvent -> Eff (dom :: DOM | eff) HTMLElement
```


#### `eventValue`

``` purescript
eventValue :: forall eff. J.JQueryEvent -> Eff (dom :: DOM | eff) String
```


#### `valueStream`

``` purescript
valueStream :: forall eff. J.JQuery -> Eff (dom :: DOM | eff) (Observable String)
```


#### `termToUrl`

``` purescript
termToUrl :: String -> String
```


#### `urlStream`

``` purescript
urlStream :: forall eff. J.JQuery -> Eff (dom :: DOM | eff) (Observable String)
```


#### `renderItem`

``` purescript
renderItem :: forall e. Item -> Eff (dom :: DOM | e) J.JQuery
```


#### `getItems`

``` purescript
getItems :: forall eff. F Items -> Items
```


#### `renderItems`

``` purescript
renderItems :: forall eff. Items -> Eff (dom :: DOM | eff) [J.JQuery]
```




