//
//  Question.swift
//  Quizzler
//
//  Created by I L H A N on 30.04.2022.
//


import Foundation

struct 	Question	 {
    let text: String
    let answer: [String]
    let correctAns: String
    
    init(q:String, a:[String], correctAnswer:String){
        text=q
        answer=a
        correctAns=correctAnswer
    }
}
