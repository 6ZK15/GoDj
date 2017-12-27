//
//  ViewController.swift
//  BMSlideMenu
//
//  Created by Qinnovation on 12/13/17.
//  Copyright © 2017 Barath Mohan. All rights reserved.
//

import UIKit
import Firebase


class DJProfileViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var alertButton: UIBarButtonItem!
    @IBOutlet var bioTextVIew: UITextView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    lazy var DJS_REF = Database.database().reference().child("djs")
    
    override func viewDidLoad() {
        setProfilePic()
        setProfileInfo()
        super.viewDidLoad()
        self.sideMenu()
        bioTextVIew.isEditable = false
        
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
    func setProfilePic() {
        if let uid = Auth.auth().currentUser?.uid{
            DJS_REF.child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                let dict = snapshot.value as! NSDictionary
                let profileImageURL = dict["profilepic"] as? String
                self.profileImageView.sd_setImage(with: URL(string:profileImageURL!), placeholderImage: UIImage(named: "uploadPicBtn.png"))
                self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width/2
                self.profileImageView.clipsToBounds = true
            })
            
        }
    }
    func setProfileInfo() {
        let uid = Auth.auth().currentUser?.uid
        DJS_REF.child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
            let dict = snapshot.value as! NSDictionary
            let bio = dict["bio"] as? String
            let username = dict["username"] as? String
            let name = dict["name"] as? String
            self.nameLabel.text = name
            self.usernameLabel.text = username
            self.bioTextVIew.text = bio
            self.bioTextVIew.allowsEditingTextAttributes = false
       
        })
       
  
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

