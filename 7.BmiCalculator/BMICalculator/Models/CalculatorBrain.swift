//
//  CalculatorBrain.swift
//  BMICalculator
//
//  Created by I L H A N on 27.04.2022.
//

import Foundation
import UIKit
struct CalculatorBrain{
    
    var bmi: BMI?
    
    mutating func calculateBMI(_height: Float, _wheight: Float){
        let value = _wheight/pow(_height,2)
        if(value < 18.5)
        {
            bmi = BMI(value: value, advice: "Leaf in the wind!", color: #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1))
        }
        else if (value < 24.9)
        {
            bmi = BMI(value: value, advice: "Ganbare Ganbare", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        }
        else
        {
            bmi = BMI(value: value, advice: "Twice as heavy as a hippo", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    
        return 
    }
    
    func formatCalculateBMI()-> String{
        return String(format: "%.2f", bmi?.value ?? 0.0)
    }
    
    func getAdvice()-> String{
        return bmi?.advice ?? "No advice"
    }
    
    
    func getColor()-> UIColor{
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
}
