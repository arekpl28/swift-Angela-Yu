//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!

    let eggTimes: [String: Int] = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var hardness = ""
    var totalTime = 0
    var secondsPassed = 0
    var audioPlayer: AVAudioPlayer!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        titleLabel.text = "How do you like your eggs?"
        hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        secondsPassed = 0
        progressBar.progress = 0.0

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    func playSound() {
        if let soundURL = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer.play()
            } catch {
                print("Could not load sound file: \(error)")
            }
        }
    }

    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        }
        if totalTime == secondsPassed {
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound()
        }
    }
}
