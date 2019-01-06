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
    
    var currentValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello... World...", message: "This is hardly my first app!", preferredStyle: .alert)
        
        let doAction = UIAlertAction(title: "Do", style: .default) { action in
            action.completer()
        }
        
        let dontAction = UIAlertAction(title: "Don't", style: .cancel) { action in
            action.completer()
        }
        
        let redAlertAction = UIAlertAction(title: "Red Alert", style: .destructive) { action in
            action.completer()
        }

        let maybeAction = UIAlertAction(title: "Maybe", style: .default) { action in
            action.completer()
        }
        
        alert.addAction(redAlertAction)
        alert.addAction(doAction)
        alert.addAction(maybeAction)
        alert.addAction(dontAction)

        present(alert, animated: true) {
            print("alert was presented and is currently hanging out on the screen!")
        }
        
        // What did we learn about UIAlertControllers and UIAlertActions?
        // - The present() completion block is executed before the UIAlertAction() handlers
        // - Any action styled .cancel wants to be the last option!
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("the value of the slider is now: \(currentValue)")
    }
}

