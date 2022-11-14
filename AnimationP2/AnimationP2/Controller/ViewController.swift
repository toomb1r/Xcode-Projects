//
//  ViewController.swift
//  AnimationP2
//
//  Created by wsucatslabs on 11/14/22.
//
import UIKit

class ViewController: UIViewController {
   var animator : UIDynamicAnimator?
   @IBOutlet var puck : UIView?
    @IBOutlet var textView : UIView?
    @IBOutlet var slider : UIView?

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      
      animator = UIDynamicAnimator(referenceView: view)

      let gravityBehavior = UIGravityBehavior(items: [puck!])
      animator!.addBehavior(gravityBehavior)

    let snapBehavior = UISnapBehavior(item: slider!, snapTo: slider!.center)
    snapBehavior.damping = 0.0
    animator!.addBehavior(snapBehavior)

      let collisionBehavior = UICollisionBehavior(items: [puck!, textView!, slider!])
      collisionBehavior.translatesReferenceBoundsIntoBoundary = true
      animator!.addBehavior(collisionBehavior)
      
   }


}
