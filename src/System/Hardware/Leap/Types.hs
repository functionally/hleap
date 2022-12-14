{-|
Module      :  $Header$
Copyright   :  (c) 2016-19 Brian W Bush
License     :  MIT
Maintainer  :  Brian W Bush <code@functionally.io>
Stability   :  Stable
Portability :  Portable

Types for Leap Motion \<<https://www.leapmotion.com/product/desktop>\>, based on the Web Socket API \<<https://developer.leapmotion.com/documentation/javascript/supplements/Leap_JSON.html>\>.
-}


module System.Hardware.Leap.Types (
-- * Types
  LeapId
, Duration
, Vector
, Basis
, Matrix
) where


-- | ID for an item tracked by Leap.
type LeapId = Int


-- | Measurement of time.
type Duration = Int


-- | Three dimensional vector.
type Vector a = (a, a, a)


-- | Three dimensional basis.
type Basis a = (Vector a, Vector a, Vector a)


-- | Three dimensional rotation matrix.
type Matrix a = (Vector a, Vector a, Vector a)
