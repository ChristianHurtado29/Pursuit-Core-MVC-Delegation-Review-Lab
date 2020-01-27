//
//  EditingViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Christian Hurtado on 1/27/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

protocol fontSizeDelegate: AnyObject {
    
    func changedFontSize(_ size: CGFloat)
}

class EditingViewController: UIViewController {
    
    
    
    @IBOutlet weak var currentSizeLabel: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var stepperOutlet: UIStepper!
    
    var currentFontSize: CGFloat = 17 {
        didSet{            
            delegate?.changedFontSize(currentFontSize)
        }
    }
    
    weak var delegate: fontSizeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepperOutlet.value = Double(currentFontSize)
        sliderOutlet.value = Float(currentFontSize)
    }
    
   
    @IBAction func sliderAction(_ sender: UISlider) {
        stepperOutlet.value = Double(sender.value)
        currentFontSize = CGFloat(sender.value)
        print("slider = \(Int(currentFontSize))")
        currentSizeLabel.text = "Font Size: \(Int(currentFontSize))"
        currentSizeLabel.font = UIFont(name: "Times New Roman", size: currentFontSize)
         sender.value = Float(currentFontSize)
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        sliderOutlet.value = Float(sender.value)
        currentFontSize = CGFloat(sender.value)
        print("stepper = \(currentFontSize)")
        currentSizeLabel.text = "Font Size: \(Int(currentFontSize))"
        currentSizeLabel.font = UIFont(name: "Times New Roman", size: currentFontSize)
        
        sender.value = Double(currentFontSize)
    }
}
