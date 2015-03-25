import Foundation

class Game : Printable {
    
    var board : [ [Int] ]
    var empty = 0
    var x = 1
    var o = -1
    var activatePlayer = 1
    
    init() {
        board = [
            [empty, empty, empty],
            [empty, empty, empty],
            [empty, empty, empty]
        ]
    }
    
    var currentPlayerText : String {
        return activatePlayer == x ? "X" : "O"
    }
    
    var hasWinner : Bool {
        var b = board
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
    
    func playCell(row : Int, column : Int) -> Bool {
        var cell = board[row][column]
        
        if cell != empty {
            return false
        }
        
        board[row][column] = self.activatePlayer
        return true
    }
    
    func swapPlayers() {
        self.activatePlayer *= -1
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

}



