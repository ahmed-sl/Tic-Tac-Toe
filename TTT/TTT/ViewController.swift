//
//  ViewController.swift
//  TTT
//
//  Created by Ahmed.sl on 01/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnar: UILabel!
    
    
    var activPlaert = 1
    var state = [0,0,0,0,0,0,0,0,0]
    var active = true
    let winnerRole = [[0,1,2],[3,4,5],
                      [6,7,8],[0,3,6],
                      [1,4,7],[2,5,8],
                      [0,4,8],[2,4,6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        winnar.text = "No One Winnar yet !!"
    }
    
    
    @IBAction func games(_ sender: UIButton) {
        if state[sender.tag - 1] == 0 && active == true {
            state[sender.tag - 1] = activPlaert
            if activPlaert == 1 {
                sender.backgroundColor = .blue
                activPlaert = 2
            }else {
                sender.backgroundColor = .red
                activPlaert = 1
            }
        }
        
        checkWinner()
        
    }
    func checkWinner(){
        
        for game in winnerRole {
            if (state[game[0]] != 0 && state[game[0]] == state[game[1]] && state[game[1]] == state[game[2]]) {
                active = false
                
                if state[game[0]] == 1 {
                    winnar.text = "Blue is Winner !!"
                }else {
                    winnar.text = "Red is Winner !!"
                }
            }
        }
    }
    @IBAction func reset(_ sender: UIButton) {
         state = [0,0,0,0,0,0,0,0,0]
         active = true
        activPlaert = 1
        
        for i in 1...9 {
            let btn = view.viewWithTag(i) as? UIButton
            btn?.backgroundColor = .darkGray
        }
    }

}

