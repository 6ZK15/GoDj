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
import KeychainSwift

class HomeViewController: UIViewController {
    
    //IBOutlets for Login View
    @IBOutlet weak var loginView: UIView!
    @IBOutlet var loginUTF: UITextField!
    @IBOutlet var loginPTF: UITextField!
    @IBOutlet var signInBtn: UIButton!
    @IBOutlet var rmSwitch: UISwitch!
    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet var fPswBtn: UIButton!
    @IBOutlet var fUsrnmBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var slideBarImg: UIImageView!
    
    //IBOutlets for Error MessageView
    @IBOutlet var errorMessageView: UIView!
    @IBOutlet var errorLabel: UILabel!
    
    //IBOutlets for Sign Up View
    @IBOutlet var signUpView: UIView!
    @IBOutlet var dropDownBtn: UIButton!
    @IBOutlet var signUPUTF: UITextField!
    @IBOutlet var signUpETF: UITextField!
    @IBOutlet weak var signUpPTF: UITextField!
    @IBOutlet var signUpVPTF: UITextField!
    @IBOutlet weak var signUpSQTF: UITextField!
    @IBOutlet weak var signUpSATF: UITextField!
    @IBOutlet var scUserSelection: UISegmentedControl!
    @IBOutlet var signUpBtn2: UIButton!
    
    //IBOutlets for Forgot Password View
    @IBOutlet weak var fPasswordView: UIView!
    @IBOutlet weak var fpEmailTF: UITextField!
    
    //IBoutlets for Forgot Username View
    @IBOutlet weak var fUsernameView: UIView!
    @IBOutlet weak var fuEmailTF: UITextField!
    @IBOutlet weak var fuSecurityQTF: UITextField!
    @IBOutlet weak var fuSecurityATF: UITextField!
   
    //Create TextField Object to access functions
    var textField = TextFieldView();
    
    //Create ketchain object to handle sensitive data
    let keychain = KeychainSwift()
    
    //Firebase Database Reference
    var databaseReference = DatabaseReference.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFields()
        setSwitchState()
        getUserInfo()
    }
    
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /******************************************************************************************/
    /************************************     Methods     *************************************/
    /******************************************************************************************/
    
    // setTextFields: UITextfield methods Inherited from TextFieldView
    func setTextFields() {
        //Login & Sign Up
        textField.setTextFieldDesign(textField: loginUTF, placeHolderString: "USERNAME")
        textField.setTextFieldDesign(textField: loginPTF, placeHolderString: "PASSWORD")
        textField.setTextFieldDesign(textField: signUPUTF, placeHolderString: "USERNAME")
        textField.setTextFieldDesign(textField: signUpETF, placeHolderString: "EMAIL")
        textField.setTextFieldDesign(textField: signUpPTF, placeHolderString: "PASSWORD")
        textField.setTextFieldDesign(textField: signUpVPTF, placeHolderString: "VERIFY PASSWORD")
        textField.setTextFieldDesign(textField: signUpSQTF, placeHolderString: "SECURITY QUESTION")
        textField.setTextFieldDesign(textField: signUpSATF, placeHolderString: "SECURITY ANSWER")
        
        //Forgot Password & Username
        textField.setTextFieldDesign(textField: fpEmailTF, placeHolderString: "EMAIL")
        textField.setTextFieldDesign(textField: fuEmailTF, placeHolderString: "EMAIL")
        textField.setTextFieldDesign(textField: fuSecurityQTF, placeHolderString: "SECURITY QUESTION")
        textField.setTextFieldDesign(textField: fuSecurityATF, placeHolderString: "SECURITY ANSWER")
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
            self.errorMessageView.transform = CGAffineTransform.init(translationX:
                0, y: self.errorMessageView.frame.height)
        }) {(true) in
            UIView.animate(withDuration: 2, delay: 2, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.errorMessageView.transform = CGAffineTransform.init(translationX:
                    0, y: 0 - self.errorMessageView.frame.height)
            })
        }
    }
    
    /* Methods for Sign Up form */
    
    //Show Sign Up Form
    func showSignUpForm() {
        UIView.animate(withDuration: 1, animations: {
            self.signUpView.transform = CGAffineTransform.init(translationX:
                0, y: 0 - self.signUpView.frame.size.height)
        })
    }
    
    //Close Sign Up Form
    func closeSignUpForm() {
        UIView.animate(withDuration: 1, animations: {
            self.signUpView.transform = CGAffineTransform.init(translationX:
                0, y: self.signUpView.frame.size.height)
        })
    }
    
    
    
    /* Methods for Remember me Switch */
    
    //Func for setting user Info to keys. This will be called when the switch action is pressed.
    func setUserInfo(){
        if rmSwitch.isOn == true {
            keychain.set(true, forKey: "switchState")
            keychain.set(loginUTF.text!, forKey: "SavedUserName")
            keychain.set(loginPTF.text!, forKey: "SavedPassword")
            rmSwitch.setOn(true, animated: true)
        }
        else if rmSwitch.isOn == false {
            keychain.set(false, forKey: "switchState")
            keychain.set("", forKey: "SavedUserName")
            keychain.set("", forKey: "SavedPassword")
        }
    }
    
    //func for setting the state of the switch
    func setSwitchState() {
        if keychain.getBool("switchState") == false {
            rmSwitch.setOn(false, animated: true)
        } else if keychain.getBool("switchState") == true {
            rmSwitch.setOn(true, animated: true)
        }
    }
    
    //Func for getting the information in the textfields based on
    func getUserInfo() {
        loginUTF.text = keychain.get("SavedUserName")
        loginPTF.text = keychain.get("SavedPassword")
    }
    
    /******************************************************************************************/
    /***********************************     IBActions     ************************************/
    /******************************************************************************************/
    
    //IBACtion Button Outlets
    @IBAction func signIn(_ sender: Any) {
        signInValidation()
        setUserInfo()
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
    
    @IBAction func rememberMeSwitchTriggered(_ sender: UISwitch) {
        setUserInfo()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if slideBarImg.frame.origin.x < view.frame.size.width/2 {
            UIView.animate(withDuration: 1, animations: {
                self.slideBarImg.transform = CGAffineTransform.init(translationX:
                    self.slideBarImg.frame.size.width - self.slideBarImg.frame.origin.x, y: 0)
                self.fPasswordView.transform = CGAffineTransform.init(translationX:
                    0, y: 0)
                self.loginView.transform = CGAffineTransform.init(translationX:
                    0, y: 0)
            })
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.slideBarImg.transform = CGAffineTransform.init(translationX:
                    0, y: 0)
                self.fUsernameView.transform = CGAffineTransform.init(translationX:
                    0, y: 0)
                self.loginView.transform = CGAffineTransform.init(translationX:
                    0, y: 0)
            })
        }
        
        self.fPswBtn.isEnabled = true
        self.loginBtn.isEnabled = false
        self.fUsrnmBtn.isEnabled = true
    }
    
    @IBAction func fPasswordButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.slideBarImg.transform = CGAffineTransform.init(translationX:
                self.slideBarImg.frame.size.width - self.slideBarImg.frame.origin.x, y: 0)
            self.loginView.transform = CGAffineTransform.init(translationX:
                0 - self.view.frame.size.width, y: 0)
            self.fPasswordView.transform = CGAffineTransform.init(translationX:
                0 - self.view.frame.size.width, y: 0)
        })
        
        self.fPswBtn.isEnabled = false
        self.loginBtn.isEnabled = true
        self.fUsrnmBtn.isEnabled = false
    }
    
    @IBAction func fUsenameButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.slideBarImg.transform = CGAffineTransform.init(translationX:
                self.slideBarImg.frame.origin.x - self.slideBarImg.frame.size.width, y: 0)
            self.loginView.transform = CGAffineTransform.init(translationX:
                self.view.frame.size.width, y: 0)
            self.fUsernameView.transform = CGAffineTransform.init(translationX:
                self.view.frame.size.width, y: 0)
        })
        
        self.fPswBtn.isEnabled = false
        self.loginBtn.isEnabled = true
        self.fUsrnmBtn.isEnabled = false
    }
    
    /******************************************************************************************/
    /***********************************    Validations    ************************************/
    /******************************************************************************************/
    
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
                self.closeSignUpForm()
                
            }
        })
        
    }
    
    //Validate SignIn function
    func signInValidation() {
        if let email = loginUTF.text, let pwd = loginPTF.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: {
                (user, error) in
                if error == nil {
                    self.errorLabel.text = "Logged In Successfully"
                    self.showHideErrorMessageView()
                    print("User Authenticated successfully")
                    self.loginUTF.layer.borderWidth = 0
                    self.loginPTF.layer.borderWidth = 0
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
}