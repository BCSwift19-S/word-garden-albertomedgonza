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
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        
       
    }
    func updateUIAfterGuess()  {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        
        for letters in wordToGuess {
            if lettersGuessed.contains(letters) {
                revealedWord = revealedWord + " \(letters)"
            } else {
                revealedWord += " _"
            }
            
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessALetter()  {
        formatUserGuessLabel()
        guessCount += 1
        
        // decrements the wrongGuessRemaining and shows the next flower image with one less petal
        let currentLetterGuess = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuess) {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named:"flower\(wrongGuessesRemaining)")
        }
        
        let revealedWord = userGuessLabel.text!
        //stop game if wrongGuessesRemaining equals 0
        if wrongGuessesRemaining == 0 {
            playAgainButton.isEnabled = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So sorry, youre all out of guesses. Try Again?"
        } else if !revealedWord.contains("_") {
            // Youve've won a game
            playAgainButton.isEnabled = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "Youve got it! It took you \(guessCount) guesses to guess the word."
        } else {
            // Update guess
            let guess = (guessCount == 1 ? "guess" : "guesses")
            guessCountLabel.text = "You've made \(guessCount) \(guess)"
        }
    }
        
    
  
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        } else {
            // enables button if I dont have a single character in the guessed letter field
            guessLetterButton.isEnabled = false
        
        }
    }
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
       
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
    }
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isEnabled = true
        guessLetterButton.isEnabled = true
        guessedLetterField.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've made 0 Guesses."
        guessCount = 0
     
    }
    
   
}

