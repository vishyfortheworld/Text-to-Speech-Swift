//
//  ViewController.swift
//  TexttoSpeech
//
//  Created by Vishrut Vatsa on 06/10/21.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    /// All Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var speechButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    //Customising Pitch and Rate
    
    @IBOutlet weak var pitchValueLabel: UILabel!
    
    @IBOutlet weak var pitchSlider: UISlider!
    
    @IBOutlet weak var speedRateValue: UIStackView!
    
    @IBOutlet weak var speedRateValueFinal: UILabel!
    
    
    @IBOutlet weak var speedRateSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUIViews()
        pitchSlider.value = 1.0
        pitchSlider.minimumValue = 0.5
        pitchSlider.maximumValue = 2.0
    
        speedRateSlider.value = AVSpeechUtteranceMaximumSpeechRate
        speedRateSlider.maximumValue = AVSpeechUtteranceMaximumSpeechRate
        speedRateSlider.minimumValue = AVSpeechUtteranceMinimumSpeechRate
        
        pitchValueLabel.text = String(format: "%.1f", pitchSlider.value)
        speedRateValueFinal.text = String(format: "%.1f", speedRateSlider.value)
        
        
    
    }
    
    
    
    
    func setupUIViews() {
        
        textView.text = ""
        
        textView.layer.cornerRadius = 2
        textView.layer.borderWidth = 2
        textView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func buttonTappedAction(_ sender: UIButton) {
        
        if sender == clearButton {
            
            //clear button tapped
            textView.text = ""
            textView.becomeFirstResponder()
            
        }
        
        else if sender == speechButton {
            // speech button tapped
            textView.resignFirstResponder()
            
            SpeechService.shared.startSpeech(textView.text)
        }
    }
    
    //Slider VAlue Changed
    
    @IBAction func pitchSliderValueChanged(_ sender: Any) {
        textView.resignFirstResponder()
        pitchValueLabel.text = String(format: "%.1f", pitchSlider.value)
        
        
        SpeechService.shared.pitch = pitchSlider.value
    }
    
    @IBAction func speedSliderValueChanged(_ sender: Any) {
        
        textView.resignFirstResponder()
        speedRateValueFinal.text = String(format: "%.1f", speedRateSlider.value)
        
        SpeechService.shared.rate = speedRateSlider.value
    }
    
}

