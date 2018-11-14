# haskell-workshop

# Preparations

## Setup

- Install Stack as a Haskell build tool : https://docs.haskellstack.org/en/stable/README/#how-to-install

- Clone this repository

    cd haskell-workshop

    stack --help

    stack setup

    stack install

    stack test

    stack exec haskell-workshop

    stack repl

    > 1 + 1

    > :quit

## Open `src/Part1.hs` in an editor

Edit the code in `src/Part1.hs` and type 

    stack test

until Part 1 is green!

## Open `src/Part2.hs` in an editor

Edit the code in `src/Part2.hs` and type

    stack test
    
until Part 2 is green!

## Open `src/Part3.hs` in an editor

Edit the code in `src/Part3.hs` and type

    stack test
    
until Part 3 is green!

## Bonus-task : Make the  code in `src/Main.hs` fast!

See if you are able to use a built in function called `concurrently` to speed up the execution!
Test your solution on linux/osx with 
    
    stack build && time stack exec haskell-workshop
    
or on Windows /w power-shell :
    
    stack build
    Measure-Command {start-process stack exec haskell-workshop -Wait}
        
    
    