module Immutube.Player where

create :: String -> String
create yid = 
  "<iframe type='text/html' width='320' height='240' src='http://www.youtube.com/embed/" ++ yid ++ "?enablejsapi=1' frameborder='0'></iframe>"
