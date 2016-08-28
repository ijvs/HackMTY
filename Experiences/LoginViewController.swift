//
//  LoginViewController.swift
//  Experiences
//
//  Created by Abner  Iván Castro Aguilar on 27/08/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class LoginViewController: UIViewController
{

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.loginButton.layer.cornerRadius = 7
        
        /*let login = FBSDKLoginButton()
        login.delegate = self
        login.readPermissions = ["public_profile", "email", "user_friends"]
        
        login.frame = CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height/2 - 22, width: 200, height: 44)
        login.layer.cornerRadius = 7
        login.layer.masksToBounds = true
        login.center = self.view.center
        self.view.addSubview(login)*/
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
                        
                        let mainView = self.storyboard?.instantiateViewControllerWithIdentifier("mainView")
                        self.presentViewController(mainView!, animated: true, completion: nil)
                    }
                })
            }
        }
    }

}

































































