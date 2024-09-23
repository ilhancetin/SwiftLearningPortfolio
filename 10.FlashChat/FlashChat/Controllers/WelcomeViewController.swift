//
//  WelcomeViewController.swift
//  FlashChat
//
//  Created by I L H A N on 10.05.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden=true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden=false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var charIndex = 0.0
        titleLabel.text = ""
        let titletext = K.appName
        for letter in titletext
        {            
            Timer.scheduledTimer(withTimeInterval: 0.1*charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
       
    }
    

}
