//
//  Sotry.swift
//  Destination
//
//  Created by I L H A N on 02.05.2022.
//

import Foundation
struct Story     {
    let title: String
    let choice1: String
    let choice1Destination: Int
    let choice2: String
    let choice2Destination: Int
    
    init(_title:String, _choice1:String, _choice1Destination:Int, _choice2:String, _choice2Destination:Int){
        title = _title
        choice1 = _choice1
        choice1Destination = _choice1Destination
        choice2 = _choice2
        choice2Destination = _choice2Destination
    }
}
