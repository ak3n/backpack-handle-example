{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

module HandleRec where

import Data.Vinyl

type HandleRec rs = Rec ElField rs

getMethod
  :: forall l us v record . (HasField record l us us v v, RecElemFCtx record ElField)
  => record ElField us -> v
getMethod = getField . rgetf (Label @l)
