//
//  GameScene.swift
//  SpriteBox
//
//  Created by The Cowans on 26/12/2016.
//  Copyright © 2016 DCC. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    //private var label : SKLabelNode?
    //private var spinnyNode : SKShapeNode?
    
    let motionManager = CMMotionManager()
    
    private let SHORT_EDGE_NO = 3
    private let LONG_EDGE_NO = 5
    
    override func didMove(to view: SKView) {
        
        let leftEdge = -self.size.width / 2
        let bottomEdge = -self.size.height / 2
        let sideStep = self.size.width / CGFloat(SHORT_EDGE_NO + 1)
        let upStep = self.size.height / CGFloat(LONG_EDGE_NO + 1)
        
        
        let screenRect = CGRect(x: leftEdge, y: bottomEdge, width: self.size.width, height: self.size.height)
        
        self.physicsBody = SKPhysicsBody.init(edgeLoopFrom: screenRect)
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        
        
        for i in 1...SHORT_EDGE_NO {
            for j in 1...LONG_EDGE_NO {
                
                let spr = SKShapeNode(circleOfRadius: 30)
                spr.fillColor = SKColor.blue
                spr.strokeColor = SKColor.blue
                spr.position = CGPoint(x: leftEdge + (CGFloat(i) * sideStep), y: bottomEdge + (CGFloat(j) * upStep))
                self.addChild(spr)
                
                spr.physicsBody = SKPhysicsBody(circleOfRadius: 30)
                
            }
            
            //motionManager = CMMotionManager()
            motionManager.startAccelerometerUpdates()
            
        }
        
        
        
        /*
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
 */
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
        let nc = NotificationCenter.default
        nc.post(name:Notification.Name(rawValue:"ShowSettings"),
                object: nil,
                userInfo: nil)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if let accelerometerData = motionManager.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.x * 50, dy: accelerometerData.acceleration.y * 50)
        }
        
    }
}


/*
 func touchDown(atPoint pos : CGPoint) {
 if let n = self.spinnyNode?.copy() as! SKShapeNode? {
 n.position = pos
 n.strokeColor = SKColor.green
 self.addChild(n)
 }
 }
 
 func touchMoved(toPoint pos : CGPoint) {
 if let n = self.spinnyNode?.copy() as! SKShapeNode? {
 n.position = pos
 n.strokeColor = SKColor.blue
 self.addChild(n)
 }
 }
 
 func touchUp(atPoint pos : CGPoint) {
 if let n = self.spinnyNode?.copy() as! SKShapeNode? {
 n.position = pos
 n.strokeColor = SKColor.red
 self.addChild(n)
 }
 }
 
 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
 if let label = self.label {
 label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
 }
 
 for t in touches { self.touchDown(atPoint: t.location(in: self)) }
 }
 
 override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
 for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
 }
 
 override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
 for t in touches { self.touchUp(atPoint: t.location(in: self)) }
 }
 
 override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
 for t in touches { self.touchUp(atPoint: t.location(in: self)) }
 }
 
 */
