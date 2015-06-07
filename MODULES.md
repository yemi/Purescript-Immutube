# Module Documentation

## Module Immutube

#### `apiKey`

``` purescript
apiKey :: String
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


#### `getItems`

``` purescript
getItems :: forall eff. F Items -> Items
```


#### `renderItem`

``` purescript
renderItem :: forall e. Item -> Eff (dom :: DOM | e) J.JQuery
```


#### `renderItems`

``` purescript
renderItems :: forall eff. Items -> Eff (dom :: DOM | eff) [J.JQuery]
```


#### `search`

``` purescript
search :: forall aff. String -> Aff (ajax :: AJAX, dom :: DOM | aff) [J.JQuery]
```


#### `clickStream`

``` purescript
clickStream :: forall eff. J.JQuery -> Eff (dom :: DOM | eff) (Observable HTMLElement)
```


#### `youtubeId`

``` purescript
youtubeId :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) (Maybe String)
```



## Module Utils

#### `target`

``` purescript
target :: forall eff. JQueryEvent -> Eff (dom :: DOM | eff) HTMLElement
```



## Module Immutube.Player

#### `create`

``` purescript
create :: String -> String
```



## Module Immutube.Types

#### `Item`

``` purescript
newtype Item
  = Item { id :: String, title :: String }
```


#### `Items`

``` purescript
newtype Items
  = Items [Item]
```


#### `itemsIsForeign`

``` purescript
instance itemsIsForeign :: IsForeign Items
```


#### `itemIsForeign`

``` purescript
instance itemIsForeign :: IsForeign Item
```




