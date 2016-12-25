//
//  GameSprite.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by The Atlanta Goat on 12/24/16.
//  Copyright © 2016 The Atlanta Goat. All rights reserved.
//

import Foundation
import SpriteKit


protocol GameSprite {
    var textureAtlas: SKTextureAtlas {get set}
    
    func spawn (parentNode: SKNode, position: CGPoint, size: CGSize)
    
    func onTap()
}
