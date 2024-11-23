//
//  ViewController.swift
//  DiceeGame
//
//  Created by Arkadiusz Plumbaum on 23/11/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    let DiceArray:[String]=["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        
        diceImageView1.image=UIImage(named:DiceArray.randomElement()!)
        diceImageView2.image=UIImage(named:DiceArray.randomElement()!)
    }
    

}

