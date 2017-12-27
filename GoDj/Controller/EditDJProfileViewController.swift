//
//  EditDJViewController.swift
//  GoDj
//
//  Created by Eric Dowdell on 12/25/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit
import Eureka
import Firebase
import KeychainSwift
import SwiftPhoneNumberFormatter

class EditDJProfileViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createForm()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    lazy var DJS_REF = Database.database().reference().child("djs")
    let keychain = KeychainSwift()
    let uid = Auth.auth().currentUser?.uid

    
    func createForm() {
        
          form +++ Section("")
            
            +++ Section("Profile Information")
            <<< TextRow(){ row in
                row.title = "Name"
                DJS_REF.child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                    let dict = snapshot.value as! NSDictionary
                    let title = dict["name"] as? String
                    row.cell.textField.text = title
                })
                row.tag = "name"
            }
            <<< TextRow() { row in
                row.title = "Username"
                row.placeholder = "Username"
                DJS_REF.child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                    let dict = snapshot.value as! NSDictionary
                    let username = dict["username"] as? String
                    row.cell.textField.text = username
                })
                row.tag = "username"

            }
            <<< TextRow(){ row in
                row.title = "Bio"
                row.placeholder = "Enter Bio for profile"
                DJS_REF.child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                    let dict = snapshot.value as! NSDictionary
                    let bio = dict["bio"] as? String
                    row.cell.textField.text = bio
                })
                row.tag = "bio"
            }
            
            +++ Section("Private Information")
            <<< TextRow(){ row in
                row.title = "Email"
                row.placeholder = "Email"
                DJS_REF.child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                    let dict = snapshot.value as! NSDictionary
                    let email = dict["email"] as? String
                    row.cell.textField.text = email
                })
                row.tag = "email"
            }
            
            
            <<< TextRow() { row in
                row.title = "Phone Number"
                row.placeholder = "Phone Number"
                DJS_REF.child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                    let dict = snapshot.value as! NSDictionary
                    let phone = dict["phone"] as? String
                    row.cell.textField.text = phone
    
                })
                row.tag = "phone"
            }
            <<< TextRow(){ row in
                row.title = "Password"
                row.placeholder = "Click here to change password"
                DJS_REF.child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                    let dict = snapshot.value as! NSDictionary
                    let password = dict["password"] as? String
                    row.cell.textField.isSecureTextEntry = true
                    row.cell.textField.text = password
                })
                row.tag = "password"
        }
        
    }
    
    @IBAction func saveFormToFirebase(_ sender: Any) {
        let currentUser = Auth.auth().currentUser?.uid
        let usernameRow: TextRow? = form.rowBy(tag: "username")
        let username: String? = usernameRow?.cell.textField.text
        let passwordRow: TextRow? = form.rowBy(tag: "password")
        let password: String? = passwordRow?.cell.textField.text
        let emailRow: TextRow? = form.rowBy(tag: "email")
        let email: String? = emailRow?.cell.textField.text
        let bioRow: TextRow? = form.rowBy(tag: "bio")
        let bio: String? = bioRow?.cell.textField.text
        let phoneRow: TextRow? = form.rowBy(tag: "phone")
        let phone: String? = phoneRow?.cell.textField.text
        let nameRow: TextRow? = form.rowBy(tag: "name")
        let name: String? = nameRow?.cell.textField.text
        self.DJS_REF.child(currentUser!).updateChildValues(["username": username!,
                                                            "password": password!,
                                                            "email": email!,
                                                            "name":name!,
                                                            "bio":bio!,
                                                            "phone":phone!])
        let next = self.storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        self.present(next, animated: true, completion: nil)
        print("Successful add")
    }
    
}

