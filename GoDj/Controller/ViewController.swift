//
//  ViewController.swift
//  BMSlideMenu
//
//  Created by Qinnovation on 12/13/17.
//  Copyright © 2017 Barath Mohan. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var alertButton: UIBarButtonItem!
    
    lazy var DJS_REF = Database.database().reference().child("djs")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenu()
    }
    
    func snapshot() {
        if let uid = Auth.auth().currentUser?.uid{
            DJS_REF.child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                let dict = snapshot.value as! NSDictionary
                let profileImageURL = dict["profilepic"] as? String
                UserDefaults.standard.set(profileImageURL, forKey: "menuPic")
            })
            
        }
        
    }
    
    func sideMenu() {
        if revealViewController() != nil {
            menuButton.target = revealViewController()
     
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            
            alertButton.target = revealViewController()
            alertButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
}

