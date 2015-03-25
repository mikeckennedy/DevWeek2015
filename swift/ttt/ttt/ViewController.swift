//
//  ViewController.swift
//  ttt
//
//  Created by Michael Kennedy on 3/25/15.
//  Copyright (c) 2015 DevelopMentor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!
    @IBOutlet weak var button23: UIButton!
    
    @IBOutlet weak var button31: UIButton!
    @IBOutlet weak var button32: UIButton!
    @IBOutlet weak var button33: UIButton!
    
    @IBOutlet weak var labelOutcome: UILabel!
    
    var buttons : [[UIButton!]] = []
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        labelOutcome.text = ""
        
//        button11.removeConstraints(button11.constraints())
//        button11.setTranslatesAutoresizingMaskIntoConstraints(true)
//        
//        button11.frame = CGRect(x: 0, y: 0, width: 200, height: 200
        //)
        
        var row1 = [button11, button12, button13]
        var row2 = [button21, button22, button23]
        var row3 = [button31, button32, button33]
        buttons.append(row1)
        buttons.append(row2)
        buttons.append(row3)
        
        syncGameToButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonPlayClicked(sender: UIButton) {
        if game.hasWinner {
            return
        }
        
        let (r, c) = getIndexForButton(sender)
        var currentPlayer = game.currentPlayerName

        if game.play(r, col: c) {
            game.swapPlayers()
        }        
        
        syncGameToButtons()
        


        if game.hasWinner {
            labelOutcome.text = "We have a winner! " + currentPlayer
        }
    }
    
    func getIndexForButton(btn : UIButton!) -> (Int, Int) {
        for (idx_r, row) in enumerate(buttons) {
            for (idx_c, b) in enumerate(row) {
                if b == btn {                    
                    return (idx_r, idx_c)
                }
            }
        }
        
        return (-1, -1)
    }
    
    func syncGameToButtons() {
        for row in buttons {
            for b in row {
                let (r, c) = getIndexForButton(b)

                if let text = game.getCellText(r,c: c) {
                    b.setTitle(text, forState: .Normal)
                } else {
                    b.setTitle("___", forState: .Normal)

                }
            }
        }
    }

}

