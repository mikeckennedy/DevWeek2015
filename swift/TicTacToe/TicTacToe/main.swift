//
//  main.swift
//  TicTacToe
//
//  Created by Michael Kennedy on 3/25/15.
//  Copyright (c) 2015 DevelopMentor. All rights reserved.
//

import Foundation

println("TIC TAC TOE PRO")
println()

var game = Game()

while !game.hasWinner {
    println(game)
    println()
    println("It's \(game.currentPlayerText)'s turn")
    print("What row do you want to play? ")
    let r = Prompt.input().toInt()!
    print("What column do you want to play? ")
    var c = Prompt.input().toInt()!
    
    
    if game.playCell(r, column: c) == false {
        println("Whoa! That didn't work! Try again")
        continue
    }
    
    if !game.hasWinner {
        game.swapPlayers()
    }
    
    
}

println("Sweet! \(game.currentPlayerText) has won!")
println("Exiting, bye")

