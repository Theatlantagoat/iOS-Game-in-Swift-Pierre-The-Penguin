//
//  Player.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by The Atlanta Goat on 12/24/16.
//  Copyright © 2016 The Atlanta Goat. All rights reserved.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode, GameSprite{
    
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "pierre.atlas")
    
    
    var flyAnimation = SKAction()
    
    var soarAnimation = SKAction()
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize = CGSize(width: 64, height: 64)) {
        parentNode.addChild(self)
        
        createAnimations()
        
        self.size = size
        self.position = position
        
        self.run(flyAnimation, withKey: "flapAnimation")
        
    }
    
    func createAnimations(){
        
        let rotateUpAction = SKAction.rotate(toAngle: 0, duration: 0.475)
        
        rotateUpAction.timingMode = .easeOut
        
        let rotateDownAction = SKAction.rotate(toAngle: -1, duration: 0.8)
        
        rotateDownAction.timingMode = .easeIn
        
        //create the flying animation:
        let flyFrames: [SKTexture] = [
        textureAtlas.textureNamed("pierre-flying-1.png"),
        textureAtlas.textureNamed("pierre-flying-2.png"),
        textureAtlas.textureNamed("pierre-flying-3.png"),
        textureAtlas.textureNamed("pierre-flying-4.png"),
        textureAtlas.textureNamed("pierre-flying-3.png"),
        textureAtlas.textureNamed("pierre-flying-2.png")
        ]
        
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.03)
        
        //group the anmiations together with a rotation up:
        flyAnimation = SKAction.group([SKAction.repeatForever(flyAction), rotateUpAction])
        
        
        
        //creating the soaring animation, just one frame for now:
        let soarFrame: [SKTexture] = [textureAtlas.textureNamed("pierre-flying-1.png")]
        
        let soarAction = SKAction.animate(with: soarFrame, timePerFrame: 1)
        
        //grouping the soaring animation with the rotation down:
        soarAnimation = SKAction.group([SKAction.repeatForever(soarAction),rotateDownAction])
    }
    
    func onTap() {
        
    }
}
