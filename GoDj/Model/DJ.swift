//
//  DJ.swift
//  GoDj
//
//  Created by Eric Dowdell on 12/3/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct DJ {
    fileprivate var _username: String!
    fileprivate var _email: String?
    fileprivate var _profilePic: String!
    fileprivate var _phoneNumber: String!
    fileprivate var _genres: String!
    fileprivate var _aboutMe: String!
    fileprivate var _uid: String!
    fileprivate var _location: String?
    fileprivate var _reviews: Int?
    fileprivate var _willTravel: Bool?
    fileprivate var _ref: DatabaseReference?
    fileprivate var _key: String?
    
    
    //Get Methods
    var key: String {
        return _key!
    }
    
    var uid: String {
        return _uid
    }
    
    var location: String {
        return _location!
    }
    
    var reviews: Int {
        return _reviews!
    }
    
    var willTravel: Bool {
        return _willTravel!
    }
    
    var aboutMe: String {
        return _aboutMe!
    }
    
    var username: String {
        return _username
    }
    
    var genres: String {
        return _genres
    }
    
    var phoneNumber: String {
        return _phoneNumber
    }
    
    var profilePic: String {
        return _profilePic
    }

}
