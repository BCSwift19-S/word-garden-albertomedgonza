//
//  ViewController.swift
//  Word Garden
//
//  Created by Alberto Medina on 2/4/19.
//  Copyright © 2019 Alberto Medina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessLabel: UILabel!
    
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In viewDidLoad, is guessedLetterField the first responder?", guessedLetterField.isFirstResponder )
       
    }
    func updateUIAfterGuess()  {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
  
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        print("Hey! The guessedLetter Field Changed!!!")
    }
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        print("In doneKeyPressed, is guessedLetterField the first responder before updateIUAfterguess?", guessedLetterField.isFirstResponder )
        updateUIAfterGuess()
        print("In doneKeyPressed, is guessedLetterField the first responder after updateIUAfterguess?", guessedLetterField.isFirstResponder )
        
    }
    @IBAction func guessLetterButtonPressed(_ sender: Any) {
        print("In guessLetterButtonPressed, is guessedLetterField the first responder before updateIUAfterguess?", guessedLetterField.isFirstResponder )
        updateUIAfterGuess()
        print("In guessLetterButtonPressedA, is guessedLetterField the first responder after updateIUAfterguess?", guessedLetterField.isFirstResponder )
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
    }
}

