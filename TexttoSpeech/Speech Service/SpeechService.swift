//
//  SpeechService.swift
//  TexttoSpeech
//
//  Created by Vishrut Vatsa on 13/10/21.
//

import Foundation
import AVKit

class SpeechService: NSObject {
    
    //shared instance
    
    static let shared = SpeechService()
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var pitch: Float = 1
    var rate: Float = AVSpeechUtteranceMaximumSpeechRate
    
    // MARK:- SPEECH METHODS
    
    func startSpeech(_ text: String) {
        if let language = NSLinguisticTagger.dominantLanguage(for: text) {
            
            let utterence = AVSpeechUtterance(string: text)
            utterence.voice = AVSpeechSynthesisVoice(language: language)
            
            utterence.pitchMultiplier = pitch
            utterence.rate = rate
            
            speechSynthesizer.speak(utterence)
            
            
        }
    }
    
    func stopSpeeching() {
        speechSynthesizer.stopSpeaking(at: .immediate)
    }
}
