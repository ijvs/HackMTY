//
//  ExperiencesController.swift
//  Experiences
//
//  Created by Jonathan Velazquez on 27/08/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import UIKit
import expanding_collection

class ExperiencesController: ExpandingViewController {
    
    private var cellsIsOpen = [Bool]()
    var items: [Experience]!
    
    override func viewDidLoad() {
        
        items = [Experience(id: 0, name: "Hola", description: "hola", price: 200.00, place: "Algo")]
    }
    
    
}
