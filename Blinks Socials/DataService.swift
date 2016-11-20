//
//  DataService.swift
//  Blinks Socials
//
//  Created by MishariSH on 11/20/16.
//  Copyright © 2016 MishariSH. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference()

class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func createFirebaseDBPost(postData: Dictionary<String, String>) {
        REF_POSTS.childByAutoId().updateChildValues(postData, withCompletionBlock: { (error, ref) in
            if error == nil {
                self.REF_USERS.child("posts").updateChildValues([ref.key : true])
            }
        })
    }
    
}
