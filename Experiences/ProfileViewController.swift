//
//  ProfileViewController.swift
//  Experiences
//
//  Created by Abner  Iván Castro Aguilar on 27/08/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var tableViewProfile: UITableView!
    
    let arrayProfile = ["Teléfono", "Historial", "Amigos", "Compartir"]
    let arrayImages = ["phone.png", "history.png", "friends.png", "share.png"]

    override func viewDidLoad() {
        super.viewDidLoad()

        //Table view setup
        self.tableViewProfile = UITableView(frame: self.view.bounds, style: .Plain)
        self.tableViewProfile.delegate = self
        self.tableViewProfile.dataSource = self
        
        //Table view header
        let tableViewHeader = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/2))
        self.tableViewProfile.tableHeaderView = tableViewHeader
        
        let profilePicture = UIImageView(frame: CGRect(x: tableViewHeader.frame.width/2 - 75, y: tableViewHeader.frame.size.height/2 - 75, width: 150, height: 150))
        profilePicture.image = UIImage(named: "profile.JPG")
        profilePicture.contentMode = .ScaleToFill
        profilePicture.layer.cornerRadius = 77
        profilePicture.layer.masksToBounds = true
        tableViewHeader.addSubview(profilePicture)
        
        let userName = UILabel(frame: CGRect(x: 50, y: tableViewHeader.frame.size.height/2 + profilePicture.frame.size.height/2 + 10, width: tableViewHeader.frame.size.width - 100, height: 40))
        userName.text = "User Name"
        userName.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        userName.textAlignment = .Center
        tableViewHeader.addSubview(userName)
        
        self.view.addSubview(self.tableViewProfile)
    }

    //MARK: TableView Delegates
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayProfile.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "reuse")
        cell.textLabel?.text = arrayProfile[indexPath.row]
        cell.imageView?.image = UIImage(named: arrayImages[indexPath.row])
        cell.accessoryType = .DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

}









































































