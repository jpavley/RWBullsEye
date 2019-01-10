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
    @IBOutlet weak var targetMarkImage: UIImageView!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    func styleSlider() {
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    func resetTargetMark() {
        targetMarkImage.alpha = 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        styleSlider()
        resetTargetMark()
        startNewGame()
    }
    
    func updateTargetMark() {
        let minX = slider.frame.minX
        let range = slider.frame.size.width
        let position = range * (CGFloat(targetValue) * 0.01)
        targetMarkImage.center.x = position + minX
        showTargetMark()
    }
    
    func hideTargetMark() {
        UIView.animate(withDuration: 2.0) {
            self.targetMarkImage.alpha = 0.0
        }
    }
    
    func showTargetMark() {
        UIView.animate(withDuration: 2.0) {
            self.targetMarkImage.alpha = 1.0
        }
    }
    
    @IBAction func showAlert() {
        
        updateTargetMark()
        
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
        
        let doAction = UIAlertAction(title: "Do", style: .default) { _ in
            self.startNewRound()
            self.hideTargetMark()
        }
        
        alert.addAction(doAction)
        present(alert, animated: true)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
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

