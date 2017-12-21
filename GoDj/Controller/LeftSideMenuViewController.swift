//
//  LeftSlideMenuViewController.swift
//  BMSlideMenu
//
//  Created by Qinnovation on 12/13/17.
//  Copyright © 2017 Barath Mohan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SDWebImage

class LeftSlideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var leftMenuTableView:UITableView!
    
    let menuItemsArray = ["Home","Logout", "Settings"]
//    let menuImageArray = [ UIImage(named:"profileIcon")!,
//                           UIImage(named:"LogoutIcon")!
//
//                        ]
    let databaseReference = Database.database().reference()
    let uid = Auth.auth().currentUser?.uid
    lazy var DJS_REF = Database.database().reference().child("djs")
    lazy var DJS_PIC_URL = Database.database().reference().child("djs").child(uid!).child("profilepic")

    
    override func viewDidLoad() {
    setProfilePic()
    super.viewDidLoad()
    self.leftMenuTableView.tableFooterView = UIView()
    self.leftMenuTableView.delegate = self
    self.leftMenuTableView.dataSource = self
    profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
    profileImageView.clipsToBounds = true
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leftMenuItemCell", for: indexPath) as! LeftSlideMenuTableViewCell
        cell.menuTitle.text = menuItemsArray[indexPath.row]
//        cell.menuImage.image = menuImageArray[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.darkGray
        let cell: LeftSlideMenuTableViewCell =  tableView.cellForRow(at: indexPath) as! LeftSlideMenuTableViewCell
        //let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if cell.menuTitle.text! == "Home" {
            print("Settings Tapped")
            
            
        } else if cell.menuTitle.text! == "Logout" {
            print("Logout Tapped")
            if Auth.auth().currentUser != nil {
                do {
                    try Auth.auth().signOut()
                    let next = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                    self.present(next, animated: true, completion: nil)
                    print("User successfully logged out")
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
            
        } else if cell.menuTitle.text! == "Settings" {
            print("Settings Tapped")
            
            let revealviewcontroller:SWRevealViewController = self.revealViewController()
            let newViewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
            newFrontController.navigationBar.isHidden = true
            
        }
    }
    
    @IBAction func uploadProfilePic(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImageView.image = image
            saveProfileToFirebaseStorage()
        }else{
            print("Error. Could not load image")
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    func test() {
        let imageCache = NSCache<AnyObject, AnyObject>()
        if let imageFromCache = imageCache.object(forKey: "menupic" as AnyObject){
            self.profileImageView = imageFromCache as! UIImageView
        }
    }
    
    
        func setProfilePic() {
            if let uid = Auth.auth().currentUser?.uid{
                DJS_REF.child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                    let dict = snapshot.value as! NSDictionary
                    let profileImageURL = dict["profilepic"] as? String
                    self.profileImageView.sd_setImage(with: URL(string:profileImageURL!), placeholderImage: UIImage(named: "uploadPicBtn.png"))

                    //self.profileImageView.af_setImage(withURL: downloadURL as URL)
                })
    
            }
        }
    
    
    func saveProfileToFirebaseStorage() {
        let imageName = NSUUID().uuidString
        let storageRef = Storage.storage().reference()
        let storedImage = storageRef.child("profile_images").child(imageName)
        if let uploadData = UIImagePNGRepresentation(self.profileImageView.image!)
        {
            storedImage.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    print(error!)
                    return
                }
                storedImage.downloadURL(completion: { (url, error) in
                    if error != nil {
                        print(error!)
                        return
                    }
                    if let urlText = url?.absoluteString {
                        let currentUser = Auth.auth().currentUser?.uid
                        print(currentUser!)
                        print(urlText)
                        let newUpdate = self.databaseReference.child("djs").child(currentUser!)
                        print(newUpdate)
                        self.databaseReference.child("djs").child(currentUser!).updateChildValues(["profilepic": urlText])
                    }
                })// end storageImage.downloadURL
                
            })// end storageImage.put
        } // end if let uploadData
    }
    
}
