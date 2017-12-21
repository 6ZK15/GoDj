//
//  ViewController.swift
//  BMSlideMenu
//
//  Created by Qinnovation on 12/13/17.
//  Copyright © 2017 Barath Mohan. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class DJProfileViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var alertButton: UIBarButtonItem!
    @IBOutlet weak var reviewsButton: UIButton!
    @IBOutlet weak var mixesButton: UIButton!
    @IBOutlet weak var profilePic: UIImageView!
    
    lazy var DJS_REF = Database.database().reference().child("djs")

    
    override func viewDidLoad() {
        setProfilePic()
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        let menuBtn = UIButton.init(type: UIButtonType.custom)
        menuBtn.setImage(UIImage(named: "menuBtn.png"), for: UIControlState.normal)
        menuBtn.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        let leftBarButton = UIBarButtonItem(customView: menuBtn)
        navigationItem.setLeftBarButton(leftBarButton, animated: true)
        
        if revealViewController() != nil {
            menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: UIControlEvents.touchUpInside)
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
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
                    self.profilePic.sd_setImage(with: URL(string:profileImageURL!), placeholderImage: UIImage(named: "uploadPicBtn.png"))
                    self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width/2
                    self.profilePic.clipsToBounds = true
                    
                })
                
            }
        }
    
        
    }


