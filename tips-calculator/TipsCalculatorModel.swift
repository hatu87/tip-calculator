//
//  TipsCalculatorModel.swift
//  tips-calculator
//
//  Created by Anh-Tu Hoang on 11/2/15.
//  Copyright © 2015 hatu. All rights reserved.
//

import Foundation

class TipsCalculatorModel {
    private var _tipsPercentage: Float = 0
    
    var tipsPercentage:Float{
        get{
            return self._tipsPercentage
        }
        set (newPercentage){
            self._tipsPercentage = newPercentage
        }
    }
    
    init(tipsPercentage: Float = 0){
        self.tipsPercentage = tipsPercentage
    }
    
    func calculateTips(bills: Float) -> Float{

            let result = bills + bills * self.tipsPercentage
            
            return result
        
    }
}