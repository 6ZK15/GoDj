//
//  HomeViewController.swift
//  GoDj
//
//  Created by Eric Dowdell on 12/1/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {
    
    //IBOutlets for Sign Up page
    @IBOutlet var loginUTF: UITextField!
    @IBOutlet var loginPTF: UITextField!
    @IBOutlet var signInBtn: UIButton!
    @IBOutlet var rmSwitch: UISwitch!
    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet var fPswBtn: UIButton!
    @IBOutlet var fUsrnmBtn: UIButton!
    
    //IBOutlets for Error MessageView
    @IBOutlet var errorMessageView: UIView!
    @IBOutlet var errorLabel: UILabel!
    
    //IBOutlets for Sign UP
    @IBOutlet var signUpView: UIView!
    @IBOutlet var dropDownBtn: UIButton!
    @IBOutlet var signUPUTF: UITextField!
    @IBOutlet var signUpETF: UITextField!
    @IBOutlet weak var signUpPTF: UITextField!
    @IBOutlet var signUpVPTF: UITextField!
    @IBOutlet var scUserSelection: UISegmentedControl!
    @IBOutlet var signUpBtn2: UIButton!
   
    //Create TextField Object to access functions
    var textField = TextFieldView();
    
    //Firebase Database Reference
    var databaseReference = DatabaseReference.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //IBACtion Button Outlets
    @IBAction func signIn(_ sender: Any) {
        signInValidation()
    }
    @IBAction func signUpButtonPressed(_ sender: Any) {
        resetLoginTextFields()
        showSignUpForm()
    }
    
    @IBAction func dropDownButtonPressed(_ sender: Any) {
        closeSignUpForm()
        resetSignUpTextFields()
    }
    @IBAction func signUpButton2Pressed(_ sender: Any) {
        signUpValidation()
    }
    
    
    //Functions
    func setTextFields() {
        textField.setTextFieldDesign(textField: loginUTF, placeHolderString: "USERNAME")
        textField.setTextFieldDesign(textField: loginPTF, placeHolderString: "PASSWORD")
        textField.setTextFieldDesign(textField: signUPUTF, placeHolderString: "USERNAME")
        textField.setTextFieldDesign(textField: signUpETF, placeHolderString: "EMAIL")
        textField.setTextFieldDesign(textField: signUpPTF, placeHolderString: "PASSWORD")
        textField.setTextFieldDesign(textField: signUpVPTF, placeHolderString: "VERIFY PASSWORD")
    }
    
    func resetSignUpTextFields() {
        textField.resetTextField(textField: signUPUTF)
        textField.resetTextField(textField: signUpVPTF)
        textField.resetTextField(textField: signUpETF)
        textField.resetTextField(textField: signUpPTF)
    }
    func resetLoginTextFields() {
        textField.resetTextField(textField: loginPTF)
        textField.resetTextField(textField: loginUTF)
    }
    
    //Show Error Message Label
    func showHideErrorMessageView() {
        UIView.animate(withDuration: 1, animations: {
            self.errorMessageView.transform = CGAffineTransform.init(translationX: 0, y:60)
        }) {(true) in
            UIView.animate(withDuration: 2, delay: 2, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.errorMessageView.transform = CGAffineTransform.init(translationX: 0, y: -60)
            })
        }
    }
    
    //Show Sign Up Form
    func showSignUpForm() {
        UIView.animate(withDuration: 1, animations: {
            self.signUpView.transform = CGAffineTransform.init(translationX: 0, y: -370)
        })
    }
    
    //Close Sign Up Form
    func closeSignUpForm() {
        UIView.animate(withDuration: 1, animations: {
            self.signUpView.transform = CGAffineTransform.init(translationX: 0, y: 667)
        })
    }
    
    //Validate SignUp
    func signUpValidation() {
        databaseReference = Database.database().reference()
        Auth.auth().createUser(withEmail: signUpETF.text!, password: signUpPTF.text!, completion: {user,error
            in
            if let error = error {
                self.errorLabel.text = error.localizedDescription
                self.showHideErrorMessageView()
                print(error)
            } else if(self.signUpETF.text == "") {
                self.textField.setErrorTextField(textField: self.signUpETF, borderWidth: 2)
                self.errorLabel.text = "Please enter email address"
                self.showHideErrorMessageView()
                return
            } else if(self.signUPUTF.text == "") {
                self.textField.setErrorTextField(textField: self.signUPUTF, borderWidth: 2)
                self.errorLabel.text = "Please enter username"
                self.showHideErrorMessageView()
                return
            } else if(self.signUpPTF.text == "") {
                self.textField.setErrorTextField(textField: self.signUPUTF, borderWidth: 2)
                self.errorLabel.text = "Please enter password"
                self.showHideErrorMessageView()
                return
            } else if(self.signUpVPTF.text == "") {
                self.textField.setErrorTextField(textField: self.signUPUTF, borderWidth: 2)
                self.errorLabel.text = "Please verify password"
                self.showHideErrorMessageView()
                return
            }   else if (self.signUpPTF.text! != self.signUpVPTF.text!) {
                self.textField.setErrorTextField(textField: self.signUpPTF, borderWidth: 2)
                self.textField.setErrorTextField(textField: self.signUpVPTF, borderWidth: 2)
                self.errorLabel.text = "Passwords do not match"
                self.showHideErrorMessageView()
                self.signUpVPTF.text = ""
                self.signUpPTF.text = ""
                return
           } else {
                if self.scUserSelection.selectedSegmentIndex == 0 {
                     let djDict = ["email":self.signUpETF.text, "username":self.signUpETF.text, "password":self.signUpPTF.text]
                    self.databaseReference.child("djs").child(user!.uid).setValue(djDict)
                } else {
                    let userDict = ["email":self.signUpETF.text, "username":self.signUpETF.text, "password":self.signUpPTF.text]
                    self.databaseReference.child("clients").child(user!.uid).setValue(userDict)
                    
                }
                self.signUpPTF.layer.borderColor = UIColor.clear.cgColor
                self.signUpVPTF.layer.borderColor = UIColor.clear.cgColor
                self.errorLabel.text = "User Successfully Signed Up"
                user?.sendEmailVerification(completion: nil)
                self.showHideErrorMessageView()
            }
        })
        
    }
    
    //Validate SignIn function
    func signInValidation() {
        if let email = loginUTF.text, let pwd = loginPTF.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: {
                (user, error) in
                if error == nil {
                    
                    print("User Authenticated successfully")
                    self.loginUTF.layer.borderWidth = 0
                    self.loginPTF.layer.borderWidth = 0
                    
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
                    UserDefaults.standard.set(Auth.auth().currentUser?.uid, forKey: "currentUserUID")
                    print("%@", user?.email  as Any)
                    print("%@", Auth.auth().currentUser?.uid as Any)
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: {
                        (user, error) in
                        if error != nil {
                            print("Unable to authenticate using Email with Firebase")
                            if self.loginUTF.text == "", self.loginPTF.text == "" {
                                self.errorLabel.text = "Please fill out the required fields."
                                self.textField.setErrorTextField(textField: self.loginUTF, borderWidth: 2)
                                self.textField.setErrorTextField(textField: self.loginPTF, borderWidth: 2)
                                self.showHideErrorMessageView()
                            } else if self.loginUTF.text == "" {
                                self.errorLabel.text = "Please enter username."
                                self.textField.setErrorTextField(textField: self.loginUTF, borderWidth: 2)
                                self.loginPTF.layer.borderWidth = 0
                                self.showHideErrorMessageView()
                            } else if self.loginPTF.text == "" {
                                self.errorLabel.text = "Please enter password."
                                self.loginUTF.layer.borderWidth = 0
                                self.textField.setErrorTextField(textField: self.loginPTF, borderWidth: 2)
                                self.showHideErrorMessageView()
                            } else {
                                self.errorLabel.text = "Incorrect username and password. Please try again."
                                self.textField.setErrorTextField(textField: self.loginUTF, borderWidth: 2)
                                self.textField.setErrorTextField(textField: self.loginPTF, borderWidth: 2)
                                self.showHideErrorMessageView()
                            }
                        }
                    })
                }
            })
        }
    }
}//End Class
    

