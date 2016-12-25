//
//  Ground.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by The Atlanta Goat on 12/24/16.
//  Copyright © 2016 The Atlanta Goat. All rights reserved.
//

import Foundation
import SpriteKit

class Ground: SKSpriteNode, GameSprite {
    
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "ground.atlas")
    
    //creating an optional property to store the ground textures....hmmm, why an optional?
    var groundTexture: SKTexture?
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize) {
        parentNode.addChild(self)
        self.size = size
        self.position = position
        
        self.anchorPoint = CGPoint(x: 0, y: 1)
        
        // Default to the ice texture:
        if groundTexture == nil {
            groundTexture = textureAtlas.textureNamed("ice-tile.png")
        }
        // We will create child nodes to repeat the texture.
        createChildren()
        
        //adding physics body to the ground:
        // Draw an edge physics body along the top of the ground node.
        // Note: physics body positions are relative to their nodes.
        // The top left of the node is X: 0, Y: 0, given our anchor point.
        // The top right of the node is X: size.width, Y: 0
        let pointTopRight = CGPoint(x: size.width, y: 0)
        self.physicsBody = SKPhysicsBody(edgeFrom: CGPoint.zero, to: pointTopRight)
    }
    
    // Build child nodes to repeat the ground texture
    func createChildren() {
        // First, make sure we have a groundTexture value:
        if let texture = groundTexture {
            var tileCount:CGFloat = 0
            let textureSize = texture.size()
            // We will size the tiles at half the size
            // of their texture for retina sharpness:
            
            let tileSize = CGSize(width: textureSize.width / 2,
                                  height: textureSize.height / 2)
            
            // Build nodes until we cover the entire Ground width
            while tileCount * tileSize.width < self.size.width {
                let tileNode = SKSpriteNode(texture: texture)
                tileNode.size = tileSize
                tileNode.position.x = tileCount * tileSize.width
                // Position child nodes by their upper left corner
                tileNode.anchorPoint = CGPoint(x: 0, y: 1)
                // Add the child texture to the ground node:
                self.addChild(tileNode)
                tileCount += 1
            }
        }
    }
    
    func onTap() {
        
    }
    
}
