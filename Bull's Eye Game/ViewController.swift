//
//  ViewController.swift
//  myFirstProject
//
//  Created by Vladimir on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    
   
    
    
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    var targetValue = 0
    var currentValue: Int = 0
    var score = 0
    var round = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        let thumdImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumdImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(
            top: 0,
            left: 14,
            bottom: 0,
            right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(
          withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
          withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
        let transition = CATransition()
         transition.type = CATransitionType.fade
         transition.duration = 1
         transition.timingFunction = CAMediaTimingFunction(
           name: CAMediaTimingFunctionName.easeOut)
         view.layer.add(transition, forKey: nil)
    }
    
    
    
    func startNewRound() {
        currentValue = 50
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        updateValue()
    }
    
    func updateValue() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        
        score+=points
        
        round += 1
        
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!!!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points)"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK!",
            style: .default,
            handler: { _ in
                self.startNewRound()
                
            })
        if round > 5 {
            startNewGame()
        }
    
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        
    }
    
    
    
}




