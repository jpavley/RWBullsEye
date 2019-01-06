//
//  ViewController.swift
//  RWBullsEye
//
//  Created by John Pavley on 1/5/19.
//  Copyright © 2019 John Pavley. All rights reserved.
//

import UIKit

extension UIAlertAction {
    
    func completer() {
        print("action \(self.title!) chosen and alert dimissed")
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert() {
        
        let message = "The value of the slider is \(currentValue)" + "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hello... World...", message: message, preferredStyle: .alert)
        
        let doAction = UIAlertAction(title: "Do", style: .default) { action in
            self.startNewRound()
        }
        
        alert.addAction(doAction)
        present(alert, animated: true)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("the value of the slider is now: \(currentValue)")
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
    }
}

