//
//  GameScene.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by The Atlanta Goat on 12/22/16.
//  Copyright © 2016 The Atlanta Goat. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    
    
    override func didMove(to view: SKView) {
        
        
        //setting the scenes background to a nice sky blue:
        //Note: UIColor uses a scale from 1-10 for its colors??Whhhaa??
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        //creating our bee node:
        let bee = SKSpriteNode()
        
        //size our bee node:
        bee.size = CGSize(width: 28, height: 24)
        
        //position our bee node:
        bee.position = CGPoint(x: 250, y: 250)
        
        //declare the bee atlas that houses the images for the bee
        let beeAtlas = SKTextureAtlas(named: "bee.atlas")
        
        let beeFrames : [SKTexture] = [
        beeAtlas.textureNamed("bee.png"),
        beeAtlas.textureNamed("bee_fly.png")]
        
        let flyAction = SKAction.animate(with: beeFrames, timePerFrame: 0.14)
        
        //create an action to run the flyAction repeatedly
        let beeAction = SKAction.repeatForever(flyAction)
        
        //instruct our bee to run the final repeat action:
        bee.run(beeAction)
        
        //setup new actions to move the bee back and forth:
        let pathLeft = SKAction.moveBy(x: -200, y: -10, duration: 2)
        let pathRight = SKAction.moveBy(x: 200, y: 10, duration: 2)
        
        //The following two scaleTo actions flip the bee texture back and fourth:
        let flipTextureNegative = SKAction.scaleX(to: -1, duration: 0)
        let flipTexturePositive = SKAction.scaleX(to: 1, duration: 0)
        
        //combining actions into a cohesive flight sequence for our bee:
        let flightOfTheBee = SKAction.sequence([pathLeft,flipTextureNegative,pathRight,flipTexturePositive])
        
        //last we'll create a looping action that will repeat forever:
        let neverEndingFlight = SKAction.repeatForever(flightOfTheBee)
        
        //now we're telling our bee to run the flight path, and away it goes:
        bee.run(neverEndingFlight)
        
        //attach our bee to the scene's node tree:
        self.addChild(bee)
        
        
    }

}
