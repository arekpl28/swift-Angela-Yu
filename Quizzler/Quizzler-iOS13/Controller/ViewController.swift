//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!

    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        trueButton.isUserInteractionEnabled = false
        falseButton.isUserInteractionEnabled = false

        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }

        quizBrain.nextQuestion()

        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"

        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        
        trueButton.isUserInteractionEnabled = true
        falseButton.isUserInteractionEnabled = true
    }
}
