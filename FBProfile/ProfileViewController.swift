//
//  ProfileViewController.swift
//  FBProfile
//
//  Created by Yang Zhang on 12/5/18.
//  Copyright © 2018 Yang Zhang. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class ProfileViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var messageTextTextField: UITextField!
    @IBOutlet weak var messageLabelTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImage: FBSDKProfilePictureView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileImage.profileID = FBSDKAccessToken.current()?.userID
        nameLabel.text = FBSDKProfile.current()?.name ?? "Loading..."
       
        FBSDKProfile.enableUpdates(onAccessTokenChange: true)
        NotificationCenter.default.addObserver(forName: NSNotification.Name.FBSDKProfileDidChange, object: nil, queue: OperationQueue.main) { (notfi) in
            guard let profile = FBSDKProfile.current() else { return }
            self.nameLabel.text = profile.name
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didTapSend(_ sender: Any) {
    
    }

    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        dismiss(animated: true, completion: nil)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
    }
}
