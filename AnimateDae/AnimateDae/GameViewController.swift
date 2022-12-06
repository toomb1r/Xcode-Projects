//
//  GameViewController.swift
//  AnimateDae
//
//  Created by wsucatslabs on 12/5/22.
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit

class GameViewController: UIViewController {
  //  @IBOutlet var numberOfHitLabel : UILabel
    var numberOfHits = 0;
    var labelSceneLabel : SKLabelNode?
    var moveScaler = CGFloat(-10.0)
//
//    // add a SCNScene as childNode to another SCNScene (in this case to scene)
//    func moveShip() {
//        let geoScene = SCNScene(named: "art.scnassets/Walking.dae")
//        scene.rootNode.addChildNode(geoScene.rootNode.childNode(withName: "Walking", recursively: true))
//    }
//    addSceneToScene()

    let scene = SCNScene(named: "art.scnassets/Pistol Kneeling Idle2,0.scn")!
    let shipScene = SCNScene(named: "art.scnassets/ship.scn")!
    let labelScene = SKScene(fileNamed: "LabelScene")
    let cameraNode = SCNNode()
    let lightNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelSceneLabel = (labelScene?.childNode(withName: "label") as! SKLabelNode)
        labelSceneLabel?.yScale = -1.0 // Flip to match scenekit coordinate system
        
        // create and add a camera to the scene
        
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.zFar = 750.0
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 50, z: 200)
        //cameraNode.camera.zFar = 500.0
        
        // create and add a light to the scene
        
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 100, z: 0)
        scene.rootNode.addChildNode(lightNode)
        
        let lightNode2 = SCNNode()
        lightNode2.light = SCNLight()
        lightNode2.light!.type = .omni
        lightNode2.position = SCNVector3(x: 20, y: 50, z: 0)
        scene.rootNode.addChildNode(lightNode2)
        
        let lightNode3 = SCNNode()
        lightNode3.light = SCNLight()
        lightNode3.light!.type = .omni
        lightNode3.position = SCNVector3(x: -20, y: 50, z: 0)
        scene.rootNode.addChildNode(lightNode2)
        
        
        let lightNode4 = SCNNode()
        lightNode4.light = SCNLight()
        lightNode4.light!.type = .omni
        lightNode4.position = SCNVector3(x: 0, y: 20, z: 30)
        scene.rootNode.addChildNode(lightNode2)
        
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        
        // retrieve the ship node
        let ship = shipScene.rootNode.childNode(withName: "ship", recursively: true)!
        ship.position = SCNVector3(x: 50, y: 150, z: -300)
        let character = scene.rootNode.childNode(withName: "Ch03", recursively: true)!
//        
//        let action = SCNAction.scale(by: sender.scale, duration: 1.0)
//        character.runAction(action)
//        
        scene.rootNode.addChildNode(ship)
        scene.rootNode.addChildNode(character)
        
        // animate the 3d object
        ship.runAction((SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 10)))
        
        
        let box = scene.rootNode.childNode(withName: "box", recursively: true)!
        labelScene!.scaleMode = .aspectFill
        let material = box.geometry!.firstMaterial!
        material.diffuse.contents = labelScene!
        box.runAction(SCNAction.repeatForever(SCNAction.rotate(by: 30, around: SCNVector3(x: 2, y: 171.6, z: -61), duration: 20)))
        
        
        //character.runAction(SCNAction.fadeIn(duration: 10))
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.black
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
    }
    

    
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            numberOfHits += 1;
            //numberOfTouchedLabel!.text = "\(numberOfTouches)"
            labelSceneLabel!.text = "\(numberOfHits)"
            // retrieved the first clicked object
            let result = hitResults[0]
            
//            let shipScene = SCNScene(named: "art.scnassets/ship.scn")!
//            let ship = shipScene.rootNode.childNode(withName: "ship", recursively: true)!
            
//
            
            let ship = scene.rootNode.childNode(withName: "thing", recursively: true)!
            
            // animate the 3d object
            ship.runAction(SCNAction.moveBy(x: 0, y: 1 * moveScaler, z: 0, duration: 0.5))
            moveScaler *= -1.0
            ship.runAction(SCNAction.rotate(by: 50, around: SCNVector3(x: 2, y: 171.6, z: -61), duration: 2))
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

}
