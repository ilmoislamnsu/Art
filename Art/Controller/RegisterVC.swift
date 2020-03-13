//
//  RegisterVC.swift
//  Art
//
//  Created by Shafiqul  Islam on 3/12/20.
//  Copyright © 2020 Shafiqul  Islam. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var passwordCheckImage: UIImageView!
    @IBOutlet weak var confirmCheckImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPasswordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        // Do any additional setup after loading the view.
    }
    
    //Functions
    
    @objc func textFieldDidChange(_ textField: UITextField){
        //Make it so when the password match the checkmark change
        guard let passTxt = passwordTxt.text else {return}
        
        if textField == confirmPasswordTxt {
            passwordCheckImage.isHidden = false
            confirmCheckImage.isHidden = false
        } else {
            if passTxt.isEmpty {
                passwordCheckImage.isHidden = true
                confirmCheckImage.isHidden = true
                confirmPasswordTxt.text = ""
            }
        }
        
        if passwordTxt.text == confirmPasswordTxt.text {
            passwordCheckImage.image = UIImage(named: AppImages.GreeenCheck)
            confirmCheckImage.image = UIImage(named: AppImages.GreeenCheck)
        } else {
            passwordCheckImage.image = UIImage(named: AppImages.RedCheck)
            confirmCheckImage.image = UIImage(named: AppImages.RedCheck)
        }
        
    }
    
    //Actions
    @IBAction func registerClicked(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpty,
            let username = usernameTxt.text, username.isNotEmpty,
            let password = passwordTxt.text, password.isNotEmpty else{ return }
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                debugPrint(error)
                return
            }
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
            print("Sucessfully Registered new user ")
        }
        
    }
}

