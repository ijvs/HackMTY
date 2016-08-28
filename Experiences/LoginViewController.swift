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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var labelLoading: UILabel!
    
    var timer: NSTimer!
    var count = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.loginButton.layer.cornerRadius = 7
        
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidden = true
        self.labelLoading.hidden = true
        
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
                        
                        self.labelLoading.hidden = false
                        self.activityIndicator.hidden = false
                        //self.timer = NSTimer(timeInterval: 1.0, target: self, selector: #selector(self.requestLogin), userInfo: [], repeats: true)
                        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.requestLogin), userInfo: [], repeats: true)
                        self.timer.fire()
                        
                        //let mainView = self.storyboard?.instantiateViewControllerWithIdentifier("mainView")
                        //self.presentViewController(mainView!, animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    func requestLogin()
    {
        count = count + 1
        switch count{
        case 1:
            labelLoading.text = "Loading user data..."
            break
        case 2:
            labelLoading.text = "Locating you..."
            break
        case 3:
            labelLoading.text = "Loading experiences nearby..."
            break
        case 4:
            labelLoading.text = "Done!"
            break
        default:
            break
        }
        
        if count == 5{
            count = 0
            self.timer.invalidate()
            let mainView = self.storyboard?.instantiateViewControllerWithIdentifier("mainView")
            self.presentViewController(mainView!, animated: true, completion: nil)
        }
    }

}

































































