//
//  GameScene.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by The Atlanta Goat on 12/22/16.
//  Copyright © 2016 The Atlanta Goat. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    
    //creating the world as a generic SKNode:
    let world = SKNode()

    let player = Player()

    //creating an instance of the ground class:
    let ground = Ground()
    
    //creating a skeleton instance:
    let skeleton1 = Skeleton()
    
    //creating a constant for Core Motion:
    let motionManager = CMMotionManager()
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        //add the world node as a child of the scene
        self.addChild(world)
      
        //after creating the GameSprite protocol and the bee class, I will implement three new instances of bees:
        let bee2 = Bee()
        let bee3 = Bee()
        let bee4 = Bee()
        
        let teddyBear1 = TeddyBear()
    
        
        //now I'll user the spawn function from the protocol to bring the three new bees into the world:
        bee2.spawn(parentNode: world, position: CGPoint(x: 325, y: 325))
        bee3.spawn(parentNode: world, position: CGPoint(x: 200, y: 325))
        bee4.spawn(parentNode: world, position: CGPoint(x: 50, y: 200))
        
        player.spawn(parentNode: world, position: CGPoint(x: 150, y: 250))
        
        skeleton1.spawn(parentNode: world, position: CGPoint(x: 20, y: 145))
        
        teddyBear1.spawn(parentNode: world, position: CGPoint(x: 70, y: 130))
        
        
        
        // size and position the ground based on the screen size.
        // Position X: Negative one screen width.
        // Position Y: 100 above the bottom (remember the ground's top
        // left anchor point).
        let groundPosition = CGPoint(x: -self.size.width, y: 30)
        // Width: 3x the width of the screen.
        // Height: 0. Our child nodes will provide the height.
        let groundSize = CGSize(width: self.size.width * 3, height:
            0)
        // Spawn the ground!
        ground.spawn(parentNode: world, position: groundPosition, size: groundSize)
        
        //bee2.physicsBody?.mass = 0.2
        //bee2.physicsBody?.applyImpulse(CGVector(dx: -15, dy: 0))
        skeleton1.physicsBody?.applyImpulse(CGVector(dx: -3, dy: 0))
        teddyBear1.physicsBody?.applyImpulse(CGVector(dx: 3, dy: 0))
        
        //let the device know we want to use the core motion manager to start polling for motion data of the device:
        self.motionManager.startAccelerometerUpdates()
    }
    
    //a new function:
    override func didSimulatePhysics() {
        // To find the correct position, subtract half of the
        // scene size from the bee's position, adjusted for any
        // world scaling.
        // Multiply by -1 and you have the adjustment to keep our
        // sprite centered:
        let worldXPos = -(player.position.x * world.xScale - (self.size.width / 2))
        let worldYPos = -(player.position.y * world.yScale - (self.size.height / 2))
        // Move the world so that the bee is centered in the scene
        world.position = CGPoint(x: worldXPos, y: worldYPos)
    }
    
    override func update(_ currentTime: TimeInterval) {
        player.update()
        skeleton1.update()
        
        //Unwrap the accelerometer data optional:
        if let accelData = self.motionManager.accelerometerData {
            var forceAmount: CGFloat
            var movement = CGVector()
            
            //based on the device orientation, the tilt number can indicate the opposite desires.  The UIApplication enum exposes an enum that allows us to pull the current orientation.
            switch UIApplication.shared.statusBarOrientation {
            case .landscapeLeft:
                forceAmount = 20000
            case .landscapeRight:
                forceAmount = -20000
            default:
                forceAmount = 0
            }
            
            //if the device is titled more than 15% towards complete vertical, then we want to move the character
            if accelData.acceleration.y > 0.15{
                movement.dx = forceAmount
            } else if accelData.acceleration.y < -0.15 {
                movement.dx = -forceAmount
            }
        //apply the force we have just created to the character:
            player.physicsBody?.applyForce(movement)
            skeleton1.physicsBody?.applyForce(movement)
            
        }
    }

}
