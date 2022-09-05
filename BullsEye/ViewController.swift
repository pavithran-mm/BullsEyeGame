//
//  ViewController.swift
//  BullsEye
//
//  Created by pavithran.mm on 02/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    var currentSliderValue : Int = 0
    var randomValue : Int = 0
    var score: Int = 0
    var round: Int = 0
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetLabel : UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel : UILabel!
    @IBOutlet weak var hitMeBtn : UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14))
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
            .resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14))
        
        slider.setMinimumTrackImage(trackLeftImage, for: .normal)
        slider.setMaximumTrackImage(trackRightImage, for: .normal)
        
    }
    

    @IBAction func hitMe(){
        
        let difference : Int = abs(randomValue - currentSliderValue)
        var points  = 100 - difference
        var title: String
        
        
        switch(difference){
        case 0:
            points += 100
            title = "Perfect!!!"
        
        case 1:
            points += 50
            title = "Aaahh!! Missed that!!"
        
        case 2...5:
            points += 25
            title = "Almost there!"
        
        default :
            title = "Needs more precision"
        
        }
        
        score += points
        let alert = UIAlertController(title: title, message: "You scored \(points)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentSliderValue = Int(roundedValue)
    }
    
    @IBAction func startOverAction(){
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound(){
        round += 1
        currentSliderValue = 50
        slider.value = Float(currentSliderValue)
        randomValue = Int.random(in: 1...100)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(randomValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

