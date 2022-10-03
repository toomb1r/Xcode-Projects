//
//  ViewController.swift
//  CustomViewDrawing
//
//  Created by wsucatslabs on 10/3/22.
//

import UIKit

class ViewController: UIViewController {
    var engine = Engine()
    @IBOutlet var customView : CustomView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView!.startAutoAnimate()
        // Do any additional setup after loading the view.
    }


}

