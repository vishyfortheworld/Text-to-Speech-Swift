//
//  ViewController.swift
//  TexttoSpeech
//
//  Created by Vishrut Vatsa on 06/10/21.
//

import UIKit

class ViewController: UIViewController {

    /// All Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var speechButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonTappedAction(_ sender: Any) {
        
        if sender == clearButton {
            //clear button tapped
            textView.text = ""
            
            
        }
        
        else if sender == speechButton {
            // speech button tapped
            
        }
    }
    
    
}

