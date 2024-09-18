//
//  CoinModel.swift
//  ByteCoin
//
//  Created by I L H A N on 05.05.2022.
//


import Foundation

struct CoinModel {
    
    let rateValue: Double    
    var rateValueString: String{
        return String(format:"%.1f", rateValue)
    }
}
