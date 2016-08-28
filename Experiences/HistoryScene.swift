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
    let arrayTitles = ["Cozumel", "Cancún", "Puebla", "Coyoacán", "Guadalajara", "Teotihuacán", "Cuernavaca", "El Bajío", "Chihuaha"]
    let arrayImages = ["airplane.png", "card.png", "star.png", "eagle.png", "smile.png", "badge.png", "natural.png", "next.png", "train.png"]
    let arrayColors = Colors.arrayColors()
    
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
        
        //Create bubbles
        self.createBubbleWithInfo(self.arrayTitles.count, radius: 40)
        self.createBubbles(5, radius: 35)
        self.createBubbles(7, radius: 30)
        
    }
    
    //MARK: Touches methods
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let plin = touch.previousLocationInNode(self)
            let lin = touch.locationInNode(self)
            var dx = lin.x - plin.x
            var dy = lin.y - plin.y
            let b = sqrt(pow(Double(lin.x), 2) + pow(Double(lin.y), 2))
            
            dx = b == 0 ? 0 : (dx / CGFloat(b))
            dy = b == 0 ? 0 : (dy / CGFloat(b))
            
            let node = self.nodeAtPoint(touch.locationInNode(self))
            if node is Bubble{
                let direction = CGVector(
                    dx: 80000 * dx,
                    dy: 80000 * dy
                )
                node.physicsBody?.applyForce(direction)
            }
            
            
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let node = self.nodeAtPoint(touch.locationInNode(self))
            if node is Bubble{
                let bubble = node as! Bubble
                self.scaleBubbleSize(bubble, risePercentage: 1.0)
            }
        }
    }
    
    func createBubbleWithInfo(numberOfBubbles: Int, radius: Double)
    {
        for i in 0 ..< numberOfBubbles{
            let randomDeltaWidth = arc4random_uniform(UInt32(self.size.width))
            let bubble = Bubble(radius: radius, title: self.arrayTitles[i], imageName: self.arrayImages[i])
            //let bubble = Bubble(radius: radius, title: self.arrayTitles[i])
            bubble.name = "bubbleMe"
            bubble.position = CGPoint(x: CGFloat(randomDeltaWidth), y: self.size.height)
            let randomColor = Int(arc4random_uniform(UInt32(self.arrayColors.count)))
            bubble.fillColor = self.arrayColors[randomColor]
            self.addChild(bubble)
        }
    }
    
    func createBubbles(numberOfBubbles: Int, radius: Double)
    {
        for _ in 0 ..< numberOfBubbles{
            let randomDeltaWidth = arc4random_uniform(UInt32(self.size.width))
            let bubble = Bubble(radius: radius)
            bubble.position = CGPoint(x: CGFloat(randomDeltaWidth), y: self.size.height)
            let randomColor = Int(arc4random_uniform(UInt32(self.arrayColors.count)))
            bubble.fillColor = self.arrayColors[randomColor]
            self.addChild(bubble)
        }
    }
    
    //MARK: Methods
    func scaleBubbleSize(bubble: Bubble, risePercentage: Double)
    {
        var increment = 0.0
        self.showBubbleImage(bubble)
        if bubble.isRisen == false{
            increment = 1 + risePercentage
            let riseBubble = SKAction.scaleBy(CGFloat(increment), duration: 0.5)
            bubble.runAction(riseBubble)
            bubble.isRisen = true
            bubble.radiusRisen = bubble.radius + (bubble.radius * risePercentage)
        }
        else{
            bubble.isRisen = false
            increment = ((bubble.radius * 100)/bubble.radiusRisen)/100
            bubble.radiusRisen = 0.0
            let decreaseBall = SKAction.scaleBy(CGFloat(increment), duration: 0.5)
            bubble.runAction(decreaseBall)
            
            /*if bubble.name == "bubbleMe" {
                self.createNextView(bubble.titleLabel.text!)
            }*/
        }
    }
    
    func showBubbleImage(bubble: Bubble)
    {
        if bubble.isRisen == false{
            let unhide = SKAction.unhide()
            let fadeIn = SKAction.fadeInWithDuration(0.5)
            let sequence = SKAction.sequence([unhide, fadeIn])
            bubble.imageBubble.runAction(sequence)
        }
        else{
            let hide = SKAction.hide()
            let fadeOut = SKAction.fadeOutWithDuration(0.5)
            let sequence = SKAction.sequence([fadeOut, hide])
            bubble.imageBubble.runAction(sequence)
        }
    }
}









































































































