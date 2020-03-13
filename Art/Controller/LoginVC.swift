//
//  LoginVC.swift
//  Art
//
//  Created by Shafiqul  Islam on 3/12/20.
//  Copyright © 2020 Shafiqul  Islam. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {
    
    //**Outlets**//
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //**Actions**//
    @IBAction func forgotPassClicked(_ sender: Any) {
    }
    @IBAction func loginClicked(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpty,
            let password = passwordTxt.text, password.isNotEmpty else { return }
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                debugPrint(error)
                self.activityIndicator.stopAnimating()
                return
            }
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
            print("Login Was Successful")
        }
    }
    @IBAction func guestClicked(_ sender: Any) {
    }
}
