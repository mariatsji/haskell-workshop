# haskell-workshop

Welcome!

# Part 1 

## Setup

- Install Stack as a Haskell build tool : https://docs.haskellstack.org/en/stable/README/#how-to-install

- Clone this repository

    `cd haskell-workshop`

    `stack --help`

    `stack setup`

    `stack build`

    `stack test`

    `stack exec haskell-workshop`

    `stack repl`

    `> 1 + 1`

    `> :quit`

## Make the tests green

    Edit the code in `src/Part1.hs` and type `stack test`

## Make the  code in `src/Main.hs` fast!

    See if you are able to use a built in function called `concurrently` to speed up the execution!
    Test your solution with `stack build && time stack exec haskell-workshop` (linux / osx)
    or `stack build` and `Measure-Command {start-process stack exec haskell-workshop -Wait}` (windows / powershell)
        
    
    