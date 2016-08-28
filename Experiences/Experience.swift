//
//  Experience.swift
//  Experiences
//
//  Created by Jonathan Velazquez on 27/08/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import Foundation

class Experience {
    
    var id = Int()
    var name = String()
    var description = String()
    var price = Double()
    var place = String()
    var time = String()
    
    
    var imageURL = String() {
        didSet{
            if !imageURL.isEmpty {
                
            }
        }
    }
    var image = UIImage()
    
    
    required init(id:Int, name: String, description:String, price:Double, place:String, imageURL:String,time:String) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.place = place
        self.imageURL = imageURL
    }
    
}