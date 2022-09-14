//      Tiffany Behr
//      Model.swift
//      09-04-22
//      Project 00
//


import UIKit

class Model {
     var currentText : String {
        get {
            if(currentValue < 1) {
                return "Beginning";
                
            } else if(currentValue < 2) {
                return "Middle"
                
            } else if(currentValue < 3) {
                return "End"
                
            } else if(currentValue < 4) {
                return "WATCH OUT"
                
            } else if(currentValue < 5) {
                return "It's the..."
                
            } 
            return "The VOID"
        }
         
    }
    var currentValue : Double = 0.0
}

