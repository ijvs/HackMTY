//
//  LoginViewController.swift
//  Experiences
//
//  Created by Abner  Iván Castro Aguilar on 27/08/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController
{

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.loginButton.layer.cornerRadius = 7
        
    }
    

    @IBAction func loginWithFacebook(sender: UIButton)
    {
        FBSDKLoginManager().logInWithReadPermissions(["public_profile", "email", "user_friends"], fromViewController: self) { (result, error) in
            
            if error == nil{
                FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, email, name, picture.type(large)"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                    if error == nil{
                        let resultDict = result as! NSDictionary
                        print(resultDict)
                        let email = resultDict.objectForKey("email") as! String
                        let id = resultDict.objectForKey("id") as! String
                        let name = resultDict.objectForKey("name") as! String
                        
                        let pictureDict = resultDict.objectForKey("picture") as! NSDictionary
                        let dataPicture = pictureDict.objectForKey("data") as! NSDictionary
                        
                        let urlPicture = dataPicture.objectForKey("url") as! String
                        
                        let defaults = NSUserDefaults.standardUserDefaults()
                        defaults.setObject(email, forKey: "user_email")
                        defaults.setObject(id, forKey: "user_id")
                        defaults.setObject(name, forKey: "user_name")
                        defaults.setObject(urlPicture, forKey: "user_urlPicture")
                        defaults.synchronize()
                    }
                })
            }
        }
    }

}

































































