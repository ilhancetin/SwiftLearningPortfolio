//
//  ViewController.swift
//  Quizzler
//
//  Created by I L H A N on 30.04.2022.
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var answer1Btn: UIButton!
    @IBOutlet weak var answer2Btn: UIButton!

    
    @IBOutlet weak var answer3Btn: UIButton!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var timer: Timer? = nil
    var quizBrain = QuizBrain()
    
    
    @IBAction func answerPressed(_ sender: UIButton)
    {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
         
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            quizBrain.getScore()
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
           
    }
           
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        answer1Btn.setTitle(quizBrain.getOptionText(), for: .normal)
        answer2Btn.setTitle(quizBrain.getOptionText(), for: .normal)
        answer3Btn.setTitle(quizBrain.getOptionText(), for: .normal)
        answer1Btn.backgroundColor = UIColor.clear
        answer2Btn.backgroundColor = UIColor.clear
        answer3Btn.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = String(quizBrain.score)
    }
}
