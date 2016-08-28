//
//  HistoryScene.swift
//  Experiences
//
//  Created by Abner  Iván Castro Aguilar on 28/08/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import UIKit
import SpriteKit

class HistoryScene: SKScene
{
    var gravityField: SKFieldNode!
    
    override func didMoveToView(view: SKView)
    {
        self.backgroundColor = UIColor.whiteColor()
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        //GravityField setup
        self.gravityField = SKFieldNode.radialGravityField()
        self.gravityField.region = SKRegion(radius: 10000)
        self.gravityField.minimumRadius = 10000
        self.gravityField.strength = 8000
        self.gravityField.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(self.gravityField)
        
    }
}









































































































