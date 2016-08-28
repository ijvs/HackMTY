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
    let arrayImages = ["phone.png", "history.png", "friends.png", "shareLove.png"]

    override func viewDidLoad() {
        super.viewDidLoad()

        //Blurs
        let blurEffect = UIBlurEffect(style: .Light)
        let visualView = UIVisualEffectView(effect: blurEffect)
        visualView.frame = self.view.bounds
        self.view.insertSubview(visualView, atIndex: 0)
        self.view.backgroundColor = UIColor.clearColor()
        
        //Table view setup
        self.tableViewProfile = UITableView(frame: self.view.bounds, style: .Plain)
        self.tableViewProfile.delegate = self
        self.tableViewProfile.dataSource = self
        self.tableViewProfile.backgroundColor = UIColor.clearColor()
        
        //Defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        
        //Table view header
        let tableViewHeader = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/2))
        tableViewHeader.backgroundColor = UIColor.clearColor()
        self.tableViewProfile.tableHeaderView = tableViewHeader
        
        let profilePicture = UIImageView(frame: CGRect(x: tableViewHeader.frame.width/2 - 75, y: tableViewHeader.frame.size.height/2 - 75, width: 150, height: 150))
        let urlPicture = NSURL(string: defaults.objectForKey("user_urlPicture") as! String)
        let dataPicture = NSData(contentsOfURL: urlPicture!)
        profilePicture.image = UIImage(data: dataPicture!)
        //profilePicture.contentMode = .ScaleToFill
        profilePicture.layer.cornerRadius = 77
        profilePicture.layer.masksToBounds = true
        tableViewHeader.addSubview(profilePicture)
        
        let userName = UILabel(frame: CGRect(x: 50, y: tableViewHeader.frame.size.height/2 + profilePicture.frame.size.height/2 + 10, width: tableViewHeader.frame.size.width - 100, height: 40))
        userName.text = defaults.objectForKey("user_name") as! String!
        userName.font = UIFont(name: "HelveticaNeue", size: 16)
        userName.textColor = UIColor.whiteColor()
        userName.textAlignment = .Center
        tableViewHeader.addSubview(userName)
        
        let doneView = UIButton(type: .System)
        doneView.frame = CGRect(x: tableViewHeader.frame.size.width - 60, y: 40, width: 50, height: 30)
        doneView.setTitle("Done", forState: .Normal)
        doneView.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        doneView.addTarget(self, action: #selector(doneViews), forControlEvents: .TouchUpInside)
        tableViewHeader.addSubview(doneView)
        
        self.view.addSubview(self.tableViewProfile)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func doneViews()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
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
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.imageView?.image = UIImage(named: arrayImages[indexPath.row])
        cell.accessoryType = .DisclosureIndicator
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

}









































































