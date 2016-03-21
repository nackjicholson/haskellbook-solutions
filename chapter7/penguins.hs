-- penguins.hs
module Penguins where

data WherePenguinsLive
  = Galapagos
  | Antartica
  | Australia
  | SouthAfrica
  | SouthAmerica
  deriving (Eq, Show)

data Penguin
  = Peng WherePenguinsLive
  deriving (Eq, Show)

isSouthAfrica :: WherePenguinsLive -> Bool
isSouthAfrica SouthAfrica = True
isSouthAfrica _ = False

gimmeWhereTheyLive :: Penguin -> WherePenguinsLive
gimmeWhereTheyLive (Peng whereItLives) = whereItLives

-- my own refactor

isPenguinFrom :: Penguin -> WherePenguinsLive -> Bool
isPenguinFrom (Peng whereItLives) whereItLives' = whereItLives == whereItLives'

galapagosPenguin :: Penguin -> Bool
galapagosPenguin p = isPenguinFrom p Galapagos

-- antarticPenguin :: Penguin -> Bool
-- antarticPenguin (Peng Antartica) = True
-- antarticPenguin _ = False
antarticPenguin :: Penguin -> Bool
antarticPenguin p = isPenguinFrom p Antartica

antarticOrGalapagos :: Penguin -> Bool
antarticOrGalapagos p = (galapagosPenguin p) || (antarticPenguin p)
