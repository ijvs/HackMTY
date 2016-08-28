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
        items = [Experience(id: 0, name: "Vive Monterrey", description: "Lorem", price: 1200.00, place: "Monterrey", imageURL: "http://www.cronosport.com.mx/site/wp-content/uploads/2011/11/parque-fundidora-en-monterrey.jpg",time: "Medio día")]
        
        
        itemSize = CGSize(width: 350, height: 400)
        super.viewDidLoad()
        let nib = UINib(nibName: "ExperienceCollectionCell", bundle: nil)
        collectionView?.registerNib(nib, forCellWithReuseIdentifier: "ExperienceCell")
    }
    
    
}

//MARK: DataSource
extension ExperiencesController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ExperienceCell", forIndexPath: indexPath) as! ExperienceCollectionCell
        cell.setCell(items[indexPath.row])
        return cell
    }
}

extension ExperiencesController {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ExperienceCollectionCell
        cell.cellIsOpen(!cell.isOpened)
    }
    
    
}