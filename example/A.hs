
module A where

entry :: ()
entry = foo
  where
    unusedLocal = ()

foo :: ()
foo = ()

bar :: ()
bar = ()
