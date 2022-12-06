//
//  GameViewController.swift
//  Project 3
//
//  Created by Tiffany Behr
//
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit


class GameViewController: UIViewController {
    

    var scene : SCNScene?
    @IBOutlet var scnView : SCNView?
    @IBOutlet var numberOfTouchedLabel : UILabel?
    var numberOfTouches = 0
    var labelSceneLabel : SKLabelNode?
    var moveScaler = CGFloat(-5.0)

    
   override func viewDidLoad() {
      super.viewDidLoad()
       
       let labelScene = SKScene(fileNamed: "GameScene")
       labelSceneLabel = (labelScene?.childNode(withName: "helloLabel") as! SKLabelNode)
       labelSceneLabel?.yScale = -1.0 // Flip to match scenekit coordinate system
       
       // create a new scene
       scene = SCNScene(named: "Walking/Walking.dae")!
       
       // create and add a camera to the scene
       let cameraNode = SCNNode()
       cameraNode.camera = SCNCamera()
       cameraNode.camera?.zFar = 2048.0
       scene!.rootNode.addChildNode(cameraNode)
       
       // place the camera
       cameraNode.position = SCNVector3(x: 0, y: 0, z: 25)
       
       // create and add a light to the scene
       let lightNode = SCNNode()
       lightNode.light = SCNLight()
       lightNode.light!.type = .directional
       lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
       scene!.rootNode.addChildNode(lightNode)
       
       // create and add an ambient light to the scene
       let ambientLightNode = SCNNode()
       ambientLightNode.light = SCNLight()
       ambientLightNode.light!.type = .ambient
       ambientLightNode.light!.color = UIColor.darkGray
       scene!.rootNode.addChildNode(ambientLightNode)
       
       // retrieve the ship node
       let ship = scene!.rootNode.childNode(withName: "Sitting", recursively: true)!
       
       // animate the 3d object
       ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
       
       let box = scene!.rootNode.childNode(withName: "cube", recursively: true)!
       labelScene!.scaleMode = .aspectFill
       let material = box.geometry!.firstMaterial!
       material.diffuse.contents = labelScene!
       
       // set the scene to the view
       scnView!.scene = scene
       
       // allows the user to manipulate the camera
       scnView!.allowsCameraControl = true
       
       // show statistics such as fps and timing information
       scnView!.showsStatistics = true
       
       // configure the view
       scnView!.backgroundColor = UIColor.black
       
       // add a tap gesture recognizer
       let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
       scnView!.addGestureRecognizer(tapGesture)
   }
   
    

   

   override var shouldAutorotate: Bool {
      return true
   }
   
   override var prefersStatusBarHidden: Bool {
      return true
   }
   
   override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
      if UIDevice.current.userInterfaceIdiom == .phone {
         return .allButUpsideDown
      } else {
         return .all
      }
   }
   
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // check what nodes are tapped
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView!.hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            numberOfTouches += 1;
            numberOfTouchedLabel!.text = "\(numberOfTouches)"
            labelSceneLabel!.text = "\(numberOfTouches)"
            
            // retrieved the first clicked object
            let result = hitResults[0]
            
            // retrieve the ship node
            let ship = scene!.rootNode.childNode(withName: "thing", recursively: true)!
            
            // animate the 3d object
            ship.runAction(SCNAction.moveBy(x: 1 * moveScaler, y: 0, z: 0, duration: 0.5))
            moveScaler *= -1.0
            
           // get its material
            let material = result.node.geometry!.firstMaterial!
            
            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                
                material.emission.contents = UIColor.black
                
                SCNTransaction.commit()
            }
            
            material.emission.contents = UIColor.red
            
            SCNTransaction.commit()
        }
    }
    
}
