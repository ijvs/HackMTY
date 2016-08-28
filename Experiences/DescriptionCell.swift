//
//  DescriptionCell.swift
//  Experiences
//
//  Created by Jonathan Velazquez on 28/08/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(description:String) {
        descriptionLabel.text = description
    }

}
