//
//  FriendsViewController.swift
//  Experiences
//
//  Created by Abner  Iván Castro Aguilar on 28/08/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    let arrayFriends = ["Jonathan Velazquez", "Aldo Avalos", "Guillermo Chávez", "Antonio Santiago Dueñas", "Rodolfo Castillo"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.title = "Mis Amigos :)"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let friendsRequest = FBSDKGraphRequest(graphPath: "me/friends", parameters: ["fields": "friends"])
        friendsRequest.startWithCompletionHandler { (connection, result, error) in
            print(result)
        }
    }
    
    //MARK: TableView Delegates
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFriends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "reuse")
        cell.textLabel?.text = arrayFriends[indexPath.row]
        cell.accessoryType = .DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        actionSheet.addAction(UIAlertAction(title: "Invitar a Mty", style: .Default, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Ver en Facebook", style: .Default, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .Cancel, handler: nil))
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }

}


































































