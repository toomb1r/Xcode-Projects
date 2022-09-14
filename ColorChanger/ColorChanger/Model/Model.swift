//
//  Model.swift
//  ColorChanger
//
//  Created by wsucatslabs on 8/31/22.
//

import UIKit

class Model {
    var currentColor : UIColor {
        get {
            if(currentValue < 20) {
                return UIColor.gray
            } else if(currentValue < 80) {
                return UIColor.green
            
            } else if(currentValue < 90) {
                return UIColor.yellow
            }
            return UIColor.red
        }
    }
    var currentValue : Float = 0.0
}
