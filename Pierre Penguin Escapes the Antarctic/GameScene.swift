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
    
    
    //creating the world as a generic SKNode:
    let world = SKNode()
    
    //creating the bee node as a property of the Game Scene so it can be accessed throughout the code:
    let bee = SKSpriteNode()
    
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        //add the world node as a child of the scene
        self.addChild(world)
        
        //bee is a new function we're adding and I need to call it here:
        self.addTheFlyingBee()
        
    }
    
    //putting of our bee sprite animation code here:
    func addTheFlyingBee(){
        //position the texture of the sprite
        bee.position = CGPoint(x: 250, y: 250)
        bee.size = CGSize.init(width: 28, height: 24)
        //this following line of code is how you attached the bee node to the world node
        world.addChild(bee)
        
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
        
    }
    
    //a new function:
    override func didSimulatePhysics() {
        // To find the correct position, subtract half of the
        // scene size from the bee's position, adjusted for any
        // world scaling.
        // Multiply by -1 and you have the adjustment to keep our
        // sprite centered:
        let worldXPos = -(bee.position.x * world.xScale -
            (self.size.width / 2))
        let worldYPos = -(bee.position.y * world.yScale -
            (self.size.height / 2))
        // Move the world so that the bee is centered in the scene
        world.position = CGPoint(x: worldXPos, y: worldYPos)
    }

}
