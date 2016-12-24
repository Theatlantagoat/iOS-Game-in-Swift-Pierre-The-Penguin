//
//  GameViewController.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by The Atlanta Goat on 12/22/16.
//  Copyright © 2016 The Atlanta Goat. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //create our scene:
        let scene = GameScene()
        
        //configure the view:
        let skView = self.view as! SKView
        
        skView.showsFPS = true
        
        skView.showsNodeCount = true
        
        skView.ignoresSiblingOrder = true
        
        scene.scaleMode = .aspectFill
        
        //size our scene to fit the view exactly:
        
        scene.size = view.bounds.size
        
        //show the new scene:
        skView.presentScene(scene)
        
    }

    override var shouldAutorotate: Bool {
        return true
    }    

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.landscape]
     }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
