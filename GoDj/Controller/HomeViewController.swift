//
//  HomeViewController.swift
//  GoDj
//
//  Created by Eric Dowdell on 12/1/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit

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
    @IBOutlet var signUpVPTF: UITextField!
    @IBOutlet var scUserSelection: UISegmentedControl!
    @IBOutlet var signUpBtn2: UIButton!
   
    //Create TextField Object to access functions
    var textField = TextFieldView();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //IBACtion Button Outlets
    @IBAction func signIn(_ sender: Any) {
        validation()
    }
    @IBAction func signUpButtonPressed(_ sender: Any) {
        showSignUpForm()
    }
    
    @IBAction func dropDownButtonPressed(_ sender: Any) {
        closeSignUpForm()
    }
    
    //Functions
    func showHideErrorMessageView() {
        UIView.animate(withDuration: 1, animations: {
            self.errorMessageView.transform = CGAffineTransform.init(translationX: 0, y:60)
        }) {(true) in
            UIView.animate(withDuration: 2, delay: 2, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.errorMessageView.transform = CGAffineTransform.init(translationX: 0, y: -60)
            })
        }
    }
    
    //Sign Up Form Displays When Pressed
    func showSignUpForm() {
        UIView.animate(withDuration: 1, animations: {
            self.signUpView.transform = CGAffineTransform.init(translationX: 0, y: -370)
        })
    }
    
    //Sign Up Form closes when pressed
    func closeSignUpForm() {
        UIView.animate(withDuration: 1, animations: {
            self.signUpView.transform = CGAffineTransform.init(translationX: 0, y: 667)
        })
    }
    
    func validation() {
        if loginUTF.text == "" {
            textField.setErrorTextField(textField: loginUTF, borderWidth: 2)
            self.errorLabel.text = "Please Enter a Username"
            showHideErrorMessageView()
        } else {
            loginUTF.layer.borderColor = UIColor.clear.cgColor
        }
    }

}
    

