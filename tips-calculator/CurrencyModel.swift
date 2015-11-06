//
//  LanguageModel.swift
//  tips-calculator
//
//  Created by Anh-Tu Hoang on 11/3/15.
//  Copyright © 2015 hatu. All rights reserved.
//

import Foundation

class CurrencyModel {
    var _name: String
    var _shortName: String
    
    var name: String {
        get {
            return _name
        }
    }
    
    var shortName: String {
        get {
            return _shortName
        }
    }
    
    init(name: String, shortName: String){
        _name = name
        _shortName = shortName
    }
    
}