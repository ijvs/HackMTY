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
    
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "Experiences"
        let profileButton = UIBarButtonItem(image: UIImage(named: "myProfile.png"), style: .Bordered, target: self, action: #selector(myProfile))
        self.navigationItem.rightBarButtonItem = profileButton
        
        imageView = UIImageView(frame: self.view.bounds)
        self.view.insertSubview(imageView, atIndex: 0)
        let blur = UIBlurEffect(style: .ExtraLight)
        let imageBlur = UIVisualEffectView(effect: blur)
        imageBlur.frame = self.view.bounds
        imageView.addSubview(imageBlur)
        
        items = [
            Experience(id: 0, name: "Parque Fundidora", description: "El Parque Fundidora es un parque público localizado en la ciudad de Monterrey, Nuevo León, y se encuentra en los terrenos que ocupó la compañía Fundidora de Fierro y Acero de Monterrey de 1900 a 1986.\nEl parque se localiza en la antigua colonia Obrera al oriente del centro de Monterrey, limita al sur con la Av. Constitución, al norte con la Av. Madero, al oriente con la Av. Antonio I. Villarreal y al poniente con Av. \n\nEl tour incluye:\n∙Recorrido guiado\n∙Alimentos y bebidas\n∙Trasporte Hotel-Lugar-Hotel", price: 400.00, place: Place(lat: 25.6787085, long: -100.2864898), image: "genericCover",time: "Medio día"),
            Experience(id: 0, name: "MacroPlaza", description: "La Macroplaza o Gran Plaza es una plaza de la ciudad de Monterrey en México. Se denomina así a la parte central de Monterrey que ocupa 40 hectáreas y la convierten en la 5ª plaza más grande del mundo.\nEn ella se encuentran comercios, centros de recreo y de paso, y áreas verdes junto con los antiguos monumentos y edificios coloniales que contrastan con las nuevas construcciones.\n\nEl tour incluye:\n∙Recorrido guiado\n∙Alimentos y bebidas\n∙Trasporte Hotel-Lugar-Hotel", price: 200.00, place: Place(lat: 25.669234, long: -100.312108), image: "genericCover2",time: "Medio día"),
        Experience(id: 0, name: "Paseo Santa Lucia", description: "Paseo Santa Lucía, primoroso canal inaugurado el 15 de septiembre de 2007, considerado como una de las 13 maravillas de México, creadas por el hombre. Durante el trayecto de 2.5 kilómetros, los visitantes podrán deleitarse de un magnífico paisaje con 24 fuentes iluminadas, puentes, andadores, murales de grandes artistas regiomontanos, una gran extensión de áreas verdes, terrazas y explanadas, los cuales crean perfectos paisajes y escenarios donde se pueden realizar diferentes eventos deportivos y de esparcimiento. \n\nEl tour incluye:\n∙Una hora de recorrido en lancha.", price: 80.00, place: Place(lat: 25.6749115, long: -100.2894835), image:  "genericCover3",time: "Medio día"),
        Experience(id: 0, name: "Multiaventura \"la Huasteca\"", description: "Desde 1998 GEO Aventura ofrece Servicios de Calidad Mundial en Turismo de Aventura con las mejores Instalaciones y Tours en la Sierra Madre Oriental de Nuevo León.\nVive experiencias únicas con increíbles tours en GEO Aventura Resort, los alucinantes recorridos de Cañonismo Acuático o en nuestra espectacular Via Ferrata-Ruta Vértigo.\n\nEl tour incluye:\n∙Tour de Multiaventura. \n∙Snack y Comida.\n∙Equipo profesional completo.", price: 600, place: Place(lat: 25.6494192, long: -100.4529249), image:  "genericCover4",time: "Todo el día"),
        Experience(id: 0, name: "Estadio", description: "Lorem", price: 60.00, place: Place(lat: 25.6494192, long: -100.4529249), image:  "genericCover5",time: "Medio día")]
        
        
        
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
    
    override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        self.imageView.image = items[indexPath.row].image
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
        
        if cell.isOpened {
            let nv = self.storyboard?.instantiateViewControllerWithIdentifier("ExperineceTableViewController") as! ExperineceTableViewController
            nv.e = items[indexPath.row]
            pushToViewController(nv)
            //cell.cellIsOpen(false)
        }else {
            cell.cellIsOpen(!cell.isOpened)
        }
        
    }
    
 
    
    
}