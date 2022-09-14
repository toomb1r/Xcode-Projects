//
//  ViewController.swift
//  ColorChanger
//
//  Created by wsucatslabs on 8/31/22.
//

import UIKit

class ViewController: UIViewController {
    var model = Model()
    @IBOutlet var colorView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView?.backgroundColor = model.currentColor
    }

    @IBAction func takeValueFrom(sender : UISlider) {
        model.currentValue = sender.value
        colorView?.backgroundColor = model.currentColor
    }

}

