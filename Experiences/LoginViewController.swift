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
        login.center = self.view.center
        self.view.addSubview(login)
    }

}
