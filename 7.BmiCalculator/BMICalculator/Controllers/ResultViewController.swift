//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by I L H A N on 27.04.2022.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var bmiResultLbl: UILabel!
    @IBOutlet weak var adviceLbl: UILabel!
    
    var bmiValue : String?
    var advice : String?
    var color : UIColor?
    
    @IBAction func recalculateBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiResultLbl.text = bmiValue
        adviceLbl.text = advice
        view.backgroundColor = color
    }
    
 }
