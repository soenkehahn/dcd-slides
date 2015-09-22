% dead-code-detection
% Sönke Hahn
% September 22st, 2015

# Overview of this talk

- Motivation
    - The Problem
    - What can `ghc` do?
- What `dead-code-detection` does
- Demonstration

# The Problem

dead code - code that can be deleted without changing the behavior of a program or the interface of a library

This is a problem, because:

- code is longer than necessary,
- unused code has to be maintained,
- unused code has to be understood by new developers.

# How does the Problem come into existence?

1. You add dead code.

2. You refactor some piece of code and stop using a function. You don't notice that
it ends up not being used anywhere else in the code. That function becomes dead code.

# What could Haskell do?

Haskell (the language) has static name resolution and theoretically allows dead code detection
for whole projects.

`ghc` doesn't have that.

# What can ghc do?

- Analysis on a per-module basis

## What ghc can't do:

- Whole program analysis

(example in `ghc`)

# What `dead-code-detection` does:

``` haskell
module A where
foo = baz
bar = baz
baz = 42

module B (x, y, bar) where
import A
x = y
y = x
z = bar
```

# What `dead-code-detection` does:

``` haskell
module A where
foo = baz
bar = baz
baz = 42

module B (x, y, bar) where
import A
x = y
y = x
z = bar
```

![Call graph of modules `A` and `B`](images/call-graph.png)

# What `dead-code-detection` does:

- Inputs:
    - modules that form the roots of the call graph
    - source directories containing all the analysed modules
- `dead-code-detection`
    1. looks up the exports of the root modules,
    2. builds a complete call graph of all analysed modules,
    3. computes every node that is reachable from one of the roots,
    4. computes every node that is not reachable.

![Call graph of modules `A` and `B`](images/call-graph.png)

# Interlude

(We're hiring!)

# Demonstration
