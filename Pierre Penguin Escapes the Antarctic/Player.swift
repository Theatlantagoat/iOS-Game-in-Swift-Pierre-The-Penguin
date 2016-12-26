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
        
        //creating the physics body for Pierre by using the third frame where his wings are tucked in.  Also we'll use the size parameter passed into this function as the size of the physics body:
        let bodyTexture = textureAtlas.textureNamed("pierre-flying-3.png")
        self.physicsBody = SKPhysicsBody(texture: bodyTexture, size: size)
        
        //We'll make Pierre lose momenturm quickly with linear damping set at 0.9:
        self.physicsBody?.linearDamping = 0.9
        //Adult penguins weigh around 30 kilograms:
        self.physicsBody?.mass = 30
        //the following variable will prevent Pierre from rotating:
        self.physicsBody?.allowsRotation = false
        
        
        
        
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
    
    func update(){
        
    }
}
