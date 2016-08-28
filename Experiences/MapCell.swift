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
        //map.setCenterCoordinate(CLLocationCoordinate2D(latitude:25.649025,longitude: -100.2898353 ), animated: true)
        
    }

    func setCell(e:Experience) {
        timeLabel.text = e.time
        var camera = MKMapCamera(lookingAtCenterCoordinate: CLLocationCoordinate2D(latitude: e.place.lat,longitude: e.place.long ), fromDistance: 600, pitch: 0, heading: 0)
        map.setCamera(camera, animated: false)
    }

}
