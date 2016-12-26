//
//  Skeleton.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by The Atlanta Goat on 12/25/16.
//  Copyright © 2016 The Atlanta Goat. All rights reserved.
//

import Foundation
import SpriteKit

class Skeleton: SKSpriteNode, GameSprite {
    
    //we will store our texture atlas and bee animations as class wide properties so it affects each instance
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "skeletonAppear.atlas")
    
    var growFromTheDeadAnimation = SKAction()
    
    var walkingDeadAnimation = SKAction()
    
    var walkingDeadForwardAnimation = SKAction()
    
    var skeletonStrikingAnimation = SKAction()
    
    var skeletonFullAnimation = SKAction()
    
    var foreverWalkingAnimation = SKAction()
    
    //since we have a limited selection of images for the skeleton, we will spawn the be with default values for the cgsize
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize = CGSize(width: 56, height: 91)) {
        
        parentNode.addChild(self)
        createAnimations()
        self.size = size
        self.position = position
        self.run(skeletonFullAnimation)
        
        
        //Attaching a physics body, shaped like a circle and sized roughly to the size of the skeletor.
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.affectedByGravity = false
        
        //creating the physics body for each Skeletor by using the first appearance frame.  Also we'll use the size parameter passed into this function as the size of the physics body:
        let bodyTexture = textureAtlas.textureNamed("appear_1.png")
        self.physicsBody = SKPhysicsBody(texture: bodyTexture, size: size)
        
        //We'll make the skeletor lose momenturm quickly with linear damping set at 0.9:
        self.physicsBody?.linearDamping = 0.1
        //Skeletors could weigh around 15 kilograms:
        self.physicsBody?.mass = 15
        //the following variable will prevent the Teddy Bear from rotating:
        //self.physicsBody?.allowsRotation = false
       
        
        
    }
    
    func createAnimations(){
        
        //declare the skeleton atlas that houses the images for the skeleton appearing:
        let skeletonAtlas = SKTextureAtlas(named: "skeletonAppear.atlas")
        
        let growOutTheGroundFrames: [SKTexture] = [
            skeletonAtlas.textureNamed("appear_1.png"),
            skeletonAtlas.textureNamed("appear_2.png"),
            skeletonAtlas.textureNamed("appear_4.png"),
            skeletonAtlas.textureNamed("appear_5.png"),
            skeletonAtlas.textureNamed("appear_6.png"),
            skeletonAtlas.textureNamed("appear_7.png"),
            skeletonAtlas.textureNamed("appear_8.png"),
            skeletonAtlas.textureNamed("appear_9.png"),
            skeletonAtlas.textureNamed("appear_10.png")]
        
        growFromTheDeadAnimation = SKAction.animate(with: growOutTheGroundFrames, timePerFrame: 0.24)
        
        //declare the skeleton atlas that houses the images for the skeleton walking:
        let skeletonWalkingAtlas = SKTextureAtlas(named: "skeletonWalk.atlas")
        
        let walkingSkeletonFrames: [SKTexture] = [
        skeletonWalkingAtlas.textureNamed("go_1.png"),
        skeletonWalkingAtlas.textureNamed("go_2.png"),
        skeletonWalkingAtlas.textureNamed("go_3.png"),
        skeletonWalkingAtlas.textureNamed("go_4.png"),
        skeletonWalkingAtlas.textureNamed("go_5.png"),
        skeletonWalkingAtlas.textureNamed("go_6.png"),
        skeletonWalkingAtlas.textureNamed("go_7.png"),
        skeletonWalkingAtlas.textureNamed("go_8.png")
        ]
        
        walkingDeadAnimation = SKAction.animate(with: walkingSkeletonFrames, timePerFrame: 0.24)
        
        foreverWalkingAnimation = SKAction.repeatForever(walkingDeadAnimation)
        
        let skeletonAttackAtlas = SKTextureAtlas(named: "skeletonAttack.atlas")
        
        let skeletonAttackingFrames: [SKTexture] = [
        skeletonAttackAtlas.textureNamed("hit_1.png"),
        skeletonAttackAtlas.textureNamed("hit_2.png"),
        skeletonAttackAtlas.textureNamed("hit_4.png"),
        skeletonAttackAtlas.textureNamed("hit_5.png"),
        skeletonAttackAtlas.textureNamed("hit_6.png"),
        skeletonAttackAtlas.textureNamed("hit_7.png"),
        skeletonAttackAtlas.textureNamed("hit_8.png")
        ]
        
        skeletonStrikingAnimation = SKAction.animate(with: skeletonAttackingFrames, timePerFrame: 0.24)
        
        skeletonFullAnimation = SKAction.sequence([growFromTheDeadAnimation,walkingDeadAnimation,foreverWalkingAnimation])
        
    
        
    }
    
    func onTap() {
        
    }
    
    func update(){
        
    }
    
    
}

