//
//  ViewController.swift
//  Calculator
//
//  Created by Lina on 4/21/16.
//  Copyright © 2016 Lina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    private var userIsInyhrMiddleofTyping = false
    @IBAction private func touchButton(sender: UIButton) {
        let digit = sender.currentTitle!
      
        if userIsInyhrMiddleofTyping {
            let textCurrentlyDisplay = display.text!
            display.text = textCurrentlyDisplay + digit
            print("touched \(digit) digit")
        }
        else{
             display!.text = digit
        }
        userIsInyhrMiddleofTyping = true
    }
    private var displayValue: Double {
        get{
            return Double(display.text!)!
            
        }
        set{
            display.text = String(newValue)
            
        }
    }
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInyhrMiddleofTyping{
            brain.setOperand(displayValue)
            userIsInyhrMiddleofTyping = false
        }
        
        if let mathematicalSymble = sender.currentTitle{
            brain.perfornOperation(mathematicalSymble)
        }
        displayValue = brain.result
    }
}

