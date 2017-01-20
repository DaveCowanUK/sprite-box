//
//  GameViewController.swift
//  SpriteBox
//
//  Created by The Cowans on 26/12/2016.
//  Copyright © 2016 DCC. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
       // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showDifferentView) name:@"showDifferenView" object:nil];

        let nc = NotificationCenter.default
        nc.addObserver(forName:Notification.Name(rawValue:"ShowSettings"),
                       object:nil, queue:nil,
                       using:showDifferentView)
    
        
    }
    
    func showDifferentView(_: Notification) -> Void {
        print("showDifferentView")
        performSegue(withIdentifier: "xx", sender: self)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func cancelToSettingsViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveSettings(segue:UIStoryboardSegue) {
    }
}
