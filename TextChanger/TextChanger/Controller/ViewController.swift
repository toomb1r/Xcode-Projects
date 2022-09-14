//      Tiffany Behr
//  ViewController.swift
//      09-04-22
//      Project 00
//

import UIKit

class ViewController: UIViewController {
    var model = Model()
    @IBOutlet var textView : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView?.text = model.currentText
    }

    @IBAction func takeValueFrom(sender : UIStepper) {
        model.currentValue = sender.value
        textView?.text = model.currentText
    }

}

