//
//  ViewController.swift
//  BullsEye
//
//  Created by pavithran.mm on 02/09/22.
//

import UIKit

class GameViewController: UIViewController {
    
    var gameController : GameController = GameController()
    
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
        gameController.startNewGame()

        styleSlider()
        updateLabelsAndSlider()
    }
    

    @IBAction func hitMe(){
        let (title, message) = gameController.updateScore()
        
        self.showAlert(title: title, message: message){
                self.gameController.startNewRound()
                self.updateLabelsAndSlider()
        }
        
    }

    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        gameController.updateSliderValue(sliderValue: Int(roundedValue))
    }
    
    @IBAction func startOverAction(){
        gameController.startNewGame()
        updateLabelsAndSlider()
    }
    
    func styleSlider(){
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
    
    func updateLabelsAndSlider(){
        let labelValues = gameController.getLabelValues()
        slider.value = Float(labelValues[.slider]!)
        targetLabel.text = String(labelValues[.target]!)
        scoreLabel.text = String(labelValues[.score]!)
        roundLabel.text = String(labelValues[.round]!)
    }
    
    private func showAlert(title: String, message: String, onClickHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {(UIAlertAction) -> Void in onClickHandler()})
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

