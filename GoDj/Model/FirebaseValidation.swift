//
//  FirebaseValidation.swift
//  GoDj
//
//  Created by Nehemiah Horace on 12/10/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import KeychainSwift

class FirebaseValidation: NSObject {
    
    var databaseReference = DatabaseReference.init()
    
    /******************************************************************************************/
    /***********************************    Validations    ************************************/
    /******************************************************************************************/
    
    //Validate SignUp
    func signUpValidation(email: UITextField, username: UITextField,  password: UITextField, vPassword: UITextField, segment: UISegmentedControl) {
        let hvc = HomeViewController()

        //        print(keychain.getBool("isDJ")!)
        databaseReference = Database.database().reference()
        Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: {user,error
            in
            if let error = error {
                hvc.errorLabel.text = error.localizedDescription
                hvc.showHideErrorMessageView()
                print(error)
            } else if(email.text == "") {
                //                textField.setErrorTextField(textField: email, borderWidth: 2)
                hvc.errorLabel.text = "Please enter email address"
                //                showHideErrorMessageView()
                return
            } //else if(username.text == "") {
            //                textField.setErrorTextField(textField: username, borderWidth: 2)
            //                errorLabel.text = "Please enter username"
            //                showHideErrorMessageView()
            //                return
            //            } else if(password.text == "") {
            //                textField.setErrorTextField(textField: password, borderWidth: 2)
            //                errorLabel.text = "Please enter password"
            //                showHideErrorMessageView()
            //                return
            //            } else if(vPassword.text == "") {
            //                textField.setErrorTextField(textField: username, borderWidth: 2)
            //                errorLabel.text = "Please verify password"
            //                showHideErrorMessageView()
            //                return
            //            }   else if (password.text! != vPassword.text!) {
            //                textField.setErrorTextField(textField: password, borderWidth: 2)
            //                textField.setErrorTextField(textField: vPassword, borderWidth: 2)
            //                errorLabel.text = "Passwords do not match"
            //                showHideErrorMessageView()
            //                vPassword.text = ""
            //                password.text = ""
            //                return
            //            } else {
            //                if segment.selectedSegmentIndex == 0 {
            //                    //DJ Sign Up Dictionary
            //                    print(segment.selectedSegmentIndex)
            //                    let djDict = ["email":email.text!,
            //                                  "username":email.text!,
            //                                  "password":password.text!,
            //                                  "isDJ":segment.selectedSegmentIndex] as [String: Any]
            //                    databaseReference.child("djs").child(user!.uid).setValue(djDict)
            //                    isDJ = true
            //                    UserDefaults.standard.set(true, forKey: "isDJ")
            //                } else  {
            //                    print(segment.selectedSegmentIndex)
            //                    let userDict = ["email":email.text!,
            //                                    "username":email.text!,
            //                                    "password":password.text!,
            //                                    "isDJ":segment.selectedSegmentIndex] as [String: Any]
            //                    databaseReference.child("clients").child(user!.uid).setValue(userDict)
            //                    isDJ = false
            //                }
            //                password.layer.borderColor = UIColor.clear.cgColor
            //                vPassword.layer.borderColor = UIColor.clear.cgColor
            //                errorLabel.text = "User Successfully Signed Up"
            //                user?.sendEmailVerification(completion: nil)
            //                showHideErrorMessageView()
            //                closeSignUpForm()
            //            }
        })
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
        //                    errorLabel.text = "Logged In Successfully"
        //                    showHideErrorMessageView()
        //                    print("User Authenticated successfully")
        //                    loginUTF.layer.borderWidth = 0
        //                    loginPTF.layer.borderWidth = 0
        //                    UserDefaults.standard.set(Auth.auth().currentUser?.uid, forKey: "currentUserUID")
        //                    print("%@", user?.email  as Any)
        //                } else {
        //                    Auth.auth().createUser(withEmail: email, password: pwd, completion: {
        //                        (user, error) in
        //                        if error != nil {
        //                            print("Unable to authenticate using Email with Firebase")
        //                            if loginUTF.text == "", loginPTF.text == "" {
        //                                errorLabel.text = "Please fill out the required fields."
        //                                textField.setErrorTextField(textField: loginUTF, borderWidth: 2)
        //                                textField.setErrorTextField(textField: loginPTF, borderWidth: 2)
        //                                showHideErrorMessageView()
        //                            } else if loginUTF.text == "" {
        //                                errorLabel.text = "Please enter username."
        //                                textField.setErrorTextField(textField: loginUTF, borderWidth: 2)
        //                                loginPTF.layer.borderWidth = 0
        //                                showHideErrorMessageView()
        //                            } else if loginPTF.text == "" {
        //                                errorLabel.text = "Please enter password."
        //                                loginUTF.layer.borderWidth = 0
        //                                textField.setErrorTextField(textField: loginPTF, borderWidth: 2)
        //                                showHideErrorMessageView()
        //                            } else {
        //                                errorLabel.text = "Incorrect username and password. Please try again."
        //                                textField.setErrorTextField(textField: loginUTF, borderWidth: 2)
        //                                textField.setErrorTextField(textField: loginPTF, borderWidth: 2)
        //                                showHideErrorMessageView()
        //                            }
        //                        }
        //                    })
        //                }
        //            })
        //        }
    }
    
}
