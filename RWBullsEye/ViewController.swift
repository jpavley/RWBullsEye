//
//  ViewController.swift
//  RWBullsEye
//
//  Created by John Pavley on 1/5/19.
//  Copyright © 2019 John Pavley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let titles = ["Hot", "Warm", "Cool", "Cold"]
        let title: String
        
        switch difference {
        case 0:
            title = titles[0]
            points += 100
        case 1..<5:
            title = titles[1]
            points += 50
        case 6..<10:
            title = titles[2]
        default:
            title = titles[3]
        }
        
        score += points
        
        let message = "You scored \(points) points!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let doAction = UIAlertAction(title: "Do", style: .default) { action in
            self.startNewRound()
        }
        
        alert.addAction(doAction)
        present(alert, animated: true)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
    }
}

