//
//  ViewController.swift
//  Calculator
//
//  Created by I L H A N on 25.04.2022.
//


import UIKit

class ViewController: UIViewController {
    
    var isFinishedTypingNumber : Bool = false
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(Double(displayLabel.text!)!)
        if let calcMethod = sender.currentTitle{
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("The result of the calculation is nil")
            }
            displayValue = result
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle{
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
                return
            }
            else{
                if numValue == "." {
                    
                }
                let isInt = floor(displayValue) == displayValue
                
                if !isInt {
                    return
                }
            }
            
            displayLabel.text = displayLabel.text! + numValue
        }
    }
}

