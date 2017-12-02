//
//  HomeViewController.swift
//  GoDj
//
//  Created by Eric Dowdell on 12/1/17.
//  Copyright © 2017 Omega. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet var errorMessageView: UIView!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var submitButton: UIButton!
    
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
    
    func showHideErrorMessageView() {
        UIView.animate(withDuration: 1, animations: {
            self.errorMessageView.transform = CGAffineTransform.init(translationX: 0, y: 108)
        }) {(true) in
            UIView.animate(withDuration: 2, delay: 2, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.errorMessageView.transform = CGAffineTransform.init(translationX: 0, y: -108)
            })
        }
    }
    
    @IBAction func signIn(_ sender: Any) {
        validation()
    }
    @IBAction func signUpButtonPressed(_ sender: Any) {
        validation()

    }
    
    func validation() {
        if usernameTextField.text == "" {
            textField.setErrorTextField(textField: usernameTextField, borderWidth: 2)
            self.errorLabel.text = "Please Enter a Username"
            showHideErrorMessageView()
        } else {
            usernameTextField.layer.borderColor = UIColor.clear.cgColor
        }
    }

}
    

