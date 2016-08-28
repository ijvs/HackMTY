//
//  ExperienceCollectionCell.swift
//  Experiences
//
//  Created by Jonathan Velazquez on 27/08/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import UIKit
import expanding_collection

class ExperienceCollectionCell: BasePageCollectionCell {
    
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var backTitleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var frontTitle: UILabel!
    
    
    
    var experience:Experience!
    
    func setCell(e:Experience)  {
        frontTitle.text = e.name
        bgImage.image = e.image
        priceLabel.text = String("$ \(e.price)0")
        backTitleLabel.text = e.name
        durationLabel.text = e.time
    }
    
    func updateImage() {
        UIView.animateWithDuration(1, animations: {
            self.bgImage.image = self.experience.image
        })
    }
}
