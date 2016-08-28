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
    var items: [Experience]! {
        didSet{
            collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "Experiences"
        let profileButton = UIBarButtonItem(image: UIImage(named: "myProfile.png"), style: .Bordered, target: self, action: #selector(myProfile))
        self.navigationItem.rightBarButtonItem = profileButton
        
        items = [
            Experience(id: 0, name: "Parque Fundidora", description: "Lorem", price: 1200.00, place: "Monterrey", image: "genericCover",time: "Medio día"),
        Experience(id: 0, name: "MacroPlaza", description: "Lorem", price: 1200.00, place: "Monterrey", image: "genericCover2",time: "Medio día"),
        Experience(id: 0, name: "Paseo Santa Lucia", description: "Lorem", price: 1200.00, place: "Monterrey", image:  "genericCover3",time: "Medio día"),
        Experience(id: 0, name: "La Huasteca", description: "Lorem", price: 1200.00, place: "Monterrey", image:  "genericCover4",time: "Medio día"),
        Experience(id: 0, name: "Estadio", description: "Lorem", price: 1200.00, place: "Monterrey", image:  "genericCover5",time: "Medio día")]
        
        itemSize = CGSize(width: 350, height: 400)
        super.viewDidLoad()
        let nib = UINib(nibName: "ExperienceCollectionCell", bundle: nil)
        collectionView?.registerNib(nib, forCellWithReuseIdentifier: "ExperienceCell")
    }
    
    func myProfile()
    {
        let profileView = self.storyboard?.instantiateViewControllerWithIdentifier("profileView") as! ProfileViewController!
        profileView?.modalPresentationStyle = .OverFullScreen
        self.presentViewController(profileView, animated: true, completion: nil)
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