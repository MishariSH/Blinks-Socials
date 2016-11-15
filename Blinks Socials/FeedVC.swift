//
//  FeedVC.swift
//  Blinks Socials
//
//  Created by MishariSH on 11/14/16.
//  Copyright © 2016 MishariSH. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    
    @IBAction func signOutTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("MISH: ID removed from keychain \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        //performSegue(withIdentifier: "goToSignIn", sender: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
