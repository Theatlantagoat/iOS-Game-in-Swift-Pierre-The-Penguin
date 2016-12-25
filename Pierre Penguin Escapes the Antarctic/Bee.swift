//
//  Bee.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by The Atlanta Goat on 12/24/16.
//  Copyright © 2016 The Atlanta Goat. All rights reserved.
//

import Foundation
import SpriteKit

class Bee: SKSpriteNode, GameSprite {
    
    //we will store our texture atlas and bee animations as class wide properties so it affects each instance
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "bee atlas")
    
    var flyAnimation = SKAction()
    
    //since we have a limited selection of images for the bee, we will spawn the be with default values for the cgsize
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize = CGSize(width: 28, height: 24)) {
        
        parentNode.addChild(self)
        createAnimations()
        self.size = size
        self.position = position
        self.run(flyAnimation)
    }
    
    func createAnimations(){
        
        //declare the bee atlas that houses the images for the bee
        let beeAtlas = SKTextureAtlas(named: "bee.atlas")
        
        let flyFrames: [SKTexture] = [
            beeAtlas.textureNamed("bee.png"),
            beeAtlas.textureNamed("bee_fly.png")]
        
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.14)
        
        flyAnimation = SKAction.repeatForever(flyAction)
    
    }
    
    func onTap() {
        
    }
    
    
}
