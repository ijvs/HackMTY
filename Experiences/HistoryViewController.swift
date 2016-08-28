//
//  HistoryViewController.swift
//  Experiences
//
//  Created by Abner  Iván Castro Aguilar on 28/08/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import UIKit
import SpriteKit

class HistoryViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.navigationItem.title = "History"
        let shareButton = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(shareExp))
        self.navigationItem.rightBarButtonItem = shareButton
        
        let skView = SKView(frame: self.view.bounds)
        self.view.addSubview(skView)
        
        let scene = HistoryScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }
    
    func shareExp()
    {
        let activityView = UIActivityViewController(activityItems: [], applicationActivities: nil)
        let excludeActivities = [UIActivityTypeAirDrop,
                                 UIActivityTypePrint,
                                 UIActivityTypeAssignToContact,
                                 UIActivityTypeSaveToCameraRoll,
                                 UIActivityTypeAddToReadingList,
                                 UIActivityTypePostToFlickr,
                                 UIActivityTypePostToVimeo]
        activityView.excludedActivityTypes = excludeActivities
        self.presentViewController(activityView, animated: true, completion: nil)
    }
    
    

}
































































