//
//  FirebaseAuthentification.swift
//  GoDj
//
//  Created by Nehemiah Horace on 12/10/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import KeychainSwift

class FirebaseAuthentification: NSObject {
    
    var databaseReference = DatabaseReference.init()
    
    /******************************************************************************************/
    /***********************************    Validations    ************************************/
    /******************************************************************************************/
    
    //Validate SignUp
    func signUpValidation(signUpText: UITextField) {
//        print(keychain.getBool("isDJ")!)
        databaseReference = Database.database().reference()
//        Auth.auth().createUser(withEmail: signUpETF.text!, password: signUpPTF.text!, completion: {user,error
//            in
//            if let error = error {
//                self.errorLabel.text = error.localizedDescription
//                self.showHideErrorMessageView()
//                print(error)
//            } else if(self.signUpETF.text == "") {
//                self.textField.setErrorTextField(textField: self.signUpETF, borderWidth: 2)
//                self.errorLabel.text = "Please enter email address"
//                self.showHideErrorMessageView()
//                return
//            } else if(self.signUPUTF.text == "") {
//                self.textField.setErrorTextField(textField: self.signUPUTF, borderWidth: 2)
//                self.errorLabel.text = "Please enter username"
//                self.showHideErrorMessageView()
//                return
//            } else if(self.signUpPTF.text == "") {
//                self.textField.setErrorTextField(textField: self.signUPUTF, borderWidth: 2)
//                self.errorLabel.text = "Please enter password"
//                self.showHideErrorMessageView()
//                return
//            } else if(self.signUpVPTF.text == "") {
//                self.textField.setErrorTextField(textField: self.signUPUTF, borderWidth: 2)
//                self.errorLabel.text = "Please verify password"
//                self.showHideErrorMessageView()
//                return
//            }   else if (self.signUpPTF.text! != self.signUpVPTF.text!) {
//                self.textField.setErrorTextField(textField: self.signUpPTF, borderWidth: 2)
//                self.textField.setErrorTextField(textField: self.signUpVPTF, borderWidth: 2)
//                self.errorLabel.text = "Passwords do not match"
//                self.showHideErrorMessageView()
//                self.signUpVPTF.text = ""
//                self.signUpPTF.text = ""
//                return
//            } else {
//                if self.scUserSelection.selectedSegmentIndex == 0 {
//                    //DJ Sign Up Dictionary
//                    print(self.scUserSelection.selectedSegmentIndex)
//                    let djDict = ["email":self.signUpETF.text!,
//                                  "username":self.signUpETF.text!,
//                                  "password":self.signUpPTF.text!,
//                                  "isDJ":self.scUserSelection.selectedSegmentIndex] as [String: Any]
//                    self.databaseReference.child("djs").child(user!.uid).setValue(djDict)
//                    self.isDJ = true
//                    UserDefaults.standard.set(true, forKey: "isDJ")
//                } else  {
//                    print(self.scUserSelection.selectedSegmentIndex)
//                    let userDict = ["email":self.signUpETF.text!,
//                                    "username":self.signUpETF.text!,
//                                    "password":self.signUpPTF.text!,
//                                    "isDJ":self.scUserSelection.selectedSegmentIndex] as [String: Any]
//                    self.databaseReference.child("clients").child(user!.uid).setValue(userDict)
//                    self.isDJ = false
//                }
//                self.signUpPTF.layer.borderColor = UIColor.clear.cgColor
//                self.signUpVPTF.layer.borderColor = UIColor.clear.cgColor
//                self.errorLabel.text = "User Successfully Signed Up"
//                user?.sendEmailVerification(completion: nil)
//                self.showHideErrorMessageView()
//                self.closeSignUpForm()
//            }
//        })
    }
    
    func checkUser() {
//        print("check user")
//        let currentUser = Auth.auth().currentUser?.uid
//        print(currentUser!)
//        let databaseRef = Database.database().reference().child("djs").child(currentUser!).child("isDJ")
//        databaseRef.observeSingleEvent(of: .value, with: {(snap) in
//            print(snap.value!)
//            //if snap.value == "0" {
//            //  print("Yes")
//            // }
//        })
    }
    
    //Validate SignIn function
    func signInValidation() {
//        if let email = loginUTF.text, let pwd = loginPTF.text {
//            Auth.auth().signIn(withEmail: email, password: pwd, completion: {
//                (user, error) in
//                if error == nil {
//                    self.errorLabel.text = "Logged In Successfully"
//                    self.showHideErrorMessageView()
//                    print("User Authenticated successfully")
//                    self.loginUTF.layer.borderWidth = 0
//                    self.loginPTF.layer.borderWidth = 0
//                    UserDefaults.standard.set(Auth.auth().currentUser?.uid, forKey: "currentUserUID")
//                    print("%@", user?.email  as Any)
//                } else {
//                    Auth.auth().createUser(withEmail: email, password: pwd, completion: {
//                        (user, error) in
//                        if error != nil {
//                            print("Unable to authenticate using Email with Firebase")
//                            if self.loginUTF.text == "", self.loginPTF.text == "" {
//                                self.errorLabel.text = "Please fill out the required fields."
//                                self.textField.setErrorTextField(textField: self.loginUTF, borderWidth: 2)
//                                self.textField.setErrorTextField(textField: self.loginPTF, borderWidth: 2)
//                                self.showHideErrorMessageView()
//                            } else if self.loginUTF.text == "" {
//                                self.errorLabel.text = "Please enter username."
//                                self.textField.setErrorTextField(textField: self.loginUTF, borderWidth: 2)
//                                self.loginPTF.layer.borderWidth = 0
//                                self.showHideErrorMessageView()
//                            } else if self.loginPTF.text == "" {
//                                self.errorLabel.text = "Please enter password."
//                                self.loginUTF.layer.borderWidth = 0
//                                self.textField.setErrorTextField(textField: self.loginPTF, borderWidth: 2)
//                                self.showHideErrorMessageView()
//                            } else {
//                                self.errorLabel.text = "Incorrect username and password. Please try again."
//                                self.textField.setErrorTextField(textField: self.loginUTF, borderWidth: 2)
//                                self.textField.setErrorTextField(textField: self.loginPTF, borderWidth: 2)
//                                self.showHideErrorMessageView()
//                            }
//                        }
//                    })
//                }
//            })
//        }
    }

}
