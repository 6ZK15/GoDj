//
//  Client.swift
//  GoDj
//
//  Created by Eric Dowdell on 12/3/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Client {
    fileprivate var _username: String!
    fileprivate var _email: String?
    fileprivate var _uid: String!
    fileprivate var _profilePic: String!
    fileprivate var _phoneNumber: String!
    fileprivate var _genres: String!
    fileprivate var _ref: DatabaseReference?
    fileprivate var _key: String?
    
    //Get Methods
    var key: String {
        return _key!
    }
    
    var uid: String {
        return _uid
    }
    
    var username: String {
        return _username
    }
    
    var phoneNumber: String {
        return _phoneNumber
    }
    
    var profilePic: String {
        return _profilePic
    }
    
}
