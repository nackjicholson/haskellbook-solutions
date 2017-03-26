-- area.hs
module Area where

area :: Floating t => t -> t
area d = pi * (r * r)
  where r = d / 2
