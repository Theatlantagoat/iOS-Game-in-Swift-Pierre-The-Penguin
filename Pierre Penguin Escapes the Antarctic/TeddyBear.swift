//
//  TeddyBear.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by The Atlanta Goat on 12/26/16.
//  Copyright © 2016 The Atlanta Goat. All rights reserved.
//

import Foundation
import SpriteKit

class TeddyBear: SKSpriteNode, GameSprite {
    
    //we will store our texture atlas and bee animations as class wide properties so it affects each instance
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "teddyBearWalk.atlas")
    
    var flyAnimation = SKAction()
    
    //since we have a limited selection of images for the bee, we will spawn the be with default values for the cgsize
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize = CGSize(width: 45, height: 59)) {
        
        parentNode.addChild(self)
        createAnimations()
        self.size = size
        self.position = position
        self.run(flyAnimation)
        
        //Attaching a physics body, shaped like a circle and sized roughly to the size of the bee.
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.affectedByGravity = false
        
        
    }
    
    func createAnimations(){
        
        //declare the bee atlas that houses the images for the bee
        let beeAtlas = SKTextureAtlas(named: "teddyBearWalk.atlas")
        
        let flyFrames: [SKTexture] = [
            beeAtlas.textureNamed("walk1.png"),
            beeAtlas.textureNamed("walk2.png")]
        
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.30)
        
        flyAnimation = SKAction.repeatForever(flyAction)
        
    }
    
    func onTap() {
        
    }
    
    
}
