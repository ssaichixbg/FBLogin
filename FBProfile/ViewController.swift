//
//  ViewController.swift
//  FBProfile
//
//  Created by Yang Zhang on 12/5/18.
//  Copyright © 2018 Yang Zhang. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginButton.readPermissions = ["public_profile"]
        loginButton.delegate = self
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let _ = FBSDKAccessToken.current()?.tokenString {
            performSegue(withIdentifier: "Profile_noanim", sender: self)
        }
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        guard !result.isCancelled && error == nil else { return }
        
        performSegue(withIdentifier: "Profile", sender: nil)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
}

