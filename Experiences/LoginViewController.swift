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
        self.loginButton.hidden = true
        
        let login = FBSDKLoginButton()
        login.readPermissions = ["public_profile", "email", "user_friends"]
        
        login.frame = CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height/2 - 22, width: 200, height: 44)
        login.layer.cornerRadius = 7
        login.layer.masksToBounds = true
        login.center = self.view.center
        self.view.addSubview(login)
    }

}

































































