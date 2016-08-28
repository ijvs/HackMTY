//
//  MapCell.swift
//  Experiences
//
//  Created by Jonathan Velazquez on 28/08/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import UIKit
import MapKit

class MapCell: UITableViewCell, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        map.delegate = self
    }

    func setCell(time:String) {
        timeLabel.text = ""
    }

}
