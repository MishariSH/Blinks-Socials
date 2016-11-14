//
//  ViewController.swift
//  Blinks Socials
//
//  Created by MishariSH on 11/11/16.
//  Copyright © 2016 MishariSH. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self, handler: { (result, error) in
        
            if error != nil {
                
                print("MISH: Unable to authenticate with Facebook - \(error)")
                
            } else if result?.isCancelled == true {
                
                print("MISH: User cancelled facebook authentication")
                
            } else {
                
                print("MISH: Successfully authenticated with Facebook")
                
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
                self.firebaseAuth(credential)
                
            }
        
        })
        
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let pass = passField.text {
            
            FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
                
                if error == nil {
                    
                    print("MISH: Email user authenticated with Firebase")
                    
                } else {
                    
                    FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, error) in
                        if error != nil {
                            
                            print("MISH: Unable to authenticate with Firebase using email - \(error)")
                            self.addAlert(title: "Error", message: (error?.localizedDescription)!)
                            
                        } else {
                            
                            print("MISH: Successfully authenticated with Firebase")
                            
                        }
                    })
                    
                }
            })
            
        }
        
    }
    
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                
                print("MISH: Unable to authenticate with Firebase - \(error)")
                self.addAlert(title: "Error", message: (error?.localizedDescription)!)
                
            } else {
                
                print("MISH: Successfully authenticated with Firebase")
                
            }
        })
        
    }
    
    func addAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

