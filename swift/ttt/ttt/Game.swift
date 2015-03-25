//
//  Game.swift
//  game_test
//
//  Created by Michael Kennedy on 3/24/15.
//  Copyright (c) 2015 DevelopMentor. All rights reserved.
//

import Foundation

class Game : Printable {
    var board : [[Int]]
    var empty = 0
    var x = 1
    var o = -1
    var activePlayer : Int


    
    init() {
        self.board = [
            [empty, empty, empty],
            [empty, empty, empty],
            [empty, empty, empty],
        ]
        activePlayer = x



    }
    
    func play(row : Int, col : Int) -> Bool {
        var val = self.board[row][col]
        if val != self.empty {
            return false
        }
        
        board[row][col] = activePlayer
        
        return true
    }
    
    func swapPlayers() {
        activePlayer *= -1
    }
    
    var description : String {
        var txt = ""
        
        for r in board {
            txt += "|"
            
            var first = true
            for c in r {
                if !first {
                    txt += " "
                }
                txt += c == empty ? "." : (c == x ? "x" : "o")
                first = false
            }
            
            txt += "|\n"
        }
        
        return txt
        
    }
    
    func getCellText(r : Int, c : Int) -> String? {
        var c = board[r][c]
        return c == empty ? nil : (c == x ? "x" : "o")
    }
    
    var currentPlayerName : String {
        return activePlayer == x ? "x" : "o"
    }
    
    var hasWinner : Bool {
        var b = self.board
        
        var w1 = (b[0][0] + b[1][1] + b[2][2])
        var w2 = (b[2][0] + b[1][1] + b[0][2])
        var w3 = (b[0][0] + b[0][1] + b[0][2])
        var w4 = (b[1][0] + b[1][1] + b[1][2])
        var w5 = (b[2][0] + b[2][1] + b[2][2])
        var w6 = (b[0][0] + b[1][0] + b[2][0])
        var w7 = (b[0][1] + b[1][1] + b[2][1])
        var w8 = (b[0][2] + b[1][2] + b[2][2])
        
        var wins : [Int] = [w1, w2, w3, w4, w5, w6, w7, w8]
        
        for w in wins {
            if abs(w) == 3 {
                return true
            }
        }
        
        return false
        
    }
    
}