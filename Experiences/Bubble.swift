//  Bubble.swift
//  Abner
//
//  Created by Abner  Iván Castro Aguilar on 19/04/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import UIKit
import SpriteKit

class Bubble: SKShapeNode
{
    //MARK: Properties
    var titleLabel: SKLabelNode!
    var imageBubble: SKSpriteNode!
    var sound: SKAction!
    
    var radius: Double!
    var radiusRisen: Double!
    var isRisen: Bool!
    
    //MARK: Init methods
    //This method is not used, but requeried by Swift while subclassing; in this case, from SKShapeNode
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init()
    {
        super.init()
        
        //Set default properties
        self.radius = 30
        self.radiusRisen = 0
        self.isRisen = false
        self.titleLabel.text = ""
        
        //Creation and initialization of the bubble
        self.name = "bubble"
        let myPath = CGPathCreateMutable()
        CGPathAddArc(myPath, nil, 0, 0, CGFloat(self.radius), 0, CGFloat(M_PI * 2), true)
        self.path = myPath
        self.fillColor = Colors.mainPurple()
        
        //Physics body setup
        self.physicsBody = SKPhysicsBody(polygonFromPath: myPath)
        self.physicsBody?.dynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.mass = 0.3
        self.physicsBody?.friction = 0
        self.physicsBody?.linearDamping = 3
        
        
    }
    
    init(radius: Double)
    {
        super.init()
        
        //Set properties
        self.radius = radius
        self.radiusRisen = 0.0
        self.isRisen = false
        self.titleLabel = SKLabelNode(text: "")
        self.imageBubble = SKSpriteNode()
        
        //Creation and initizialization of the circle
        self.name = "bubble"
        let myPath = CGPathCreateMutable()
        CGPathAddArc(myPath, nil, 0, 0, CGFloat(radius), 0, CGFloat(M_PI * 2), true)//Its radius is from the radius parameter
        self.path = myPath
        self.fillColor = Colors.mainPurple()
        
        //PhysicsBody setup
        self.physicsBody = SKPhysicsBody(polygonFromPath: myPath)
        self.physicsBody?.dynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.mass = 0.3
        self.physicsBody?.friction = 0.0
        self.physicsBody?.linearDamping = 3.0
    }
    
    init(radius: Double, title: String)
    {
        super.init()
        
        //Set properties
        self.radius = radius
        self.radiusRisen = 0.0
        self.isRisen = false
        self.titleLabel = SKLabelNode(text: title)
        self.imageBubble = SKSpriteNode()
        
        //Creation and initizialization of the circle
        self.name = "bubble"
        let myPath = CGPathCreateMutable()
        CGPathAddArc(myPath, nil, 0, 0, CGFloat(radius), 0, CGFloat(M_PI * 2), true)//Its radius is from the radius parameter
        self.path = myPath
        self.fillColor = Colors.mainPurple()
        
        //PhysicsBody setup
        self.physicsBody = SKPhysicsBody(polygonFromPath: myPath)
        self.physicsBody?.dynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.mass = 0.3
        self.physicsBody?.friction = 0.0
        self.physicsBody?.linearDamping = 3.0
        
        //Label with text setup
        self.titleLabel.fontName = "Helvetica-Neue"
        self.titleLabel.fontSize = 12
        self.titleLabel.color = SKColor.whiteColor()
        self.titleLabel.position = CGPoint(x: 0, y: -self.frame.size.height/4)
        self.addChild(self.titleLabel)
        
    }
    
    init(radius: Double, title: String, imageName: String)
    {
        super.init()
        
        //Set properties
        self.radius = radius
        self.radiusRisen = 0.0
        self.isRisen = false
        self.titleLabel = SKLabelNode(text: title)
        self.imageBubble = SKSpriteNode()
        
        //Creation and initizialization of the circle
        self.name = "bubble"
        let myPath = CGPathCreateMutable()
        CGPathAddArc(myPath, nil, 0, 0, CGFloat(radius), 0, CGFloat(M_PI * 2), true)//Its radius is from the radius parameter
        self.path = myPath
        self.fillColor = Colors.mainPurple()
        
        //PhysicsBody setup
        self.physicsBody = SKPhysicsBody(polygonFromPath: myPath)
        self.physicsBody?.dynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.mass = 0.3
        self.physicsBody?.friction = 0.0
        self.physicsBody?.linearDamping = 3.0
        
        //Label with text setup
        self.titleLabel.fontName = "Helvetica-Neue"
        self.titleLabel.fontSize = 12
        self.titleLabel.color = SKColor.whiteColor()
        self.titleLabel.position = CGPoint(x: 0, y: -self.frame.size.height/4)
        self.addChild(self.titleLabel)
        
        //ImageView setup
        self.imageBubble = SKSpriteNode(imageNamed: imageName)
        self.imageBubble.position = CGPoint(x: 0, y: self.frame.size.height/5)
        self.imageBubble.hidden = true
        self.imageBubble.alpha = 0
        self.addChild(self.imageBubble)
        
    }
    
    
}



















































































































































