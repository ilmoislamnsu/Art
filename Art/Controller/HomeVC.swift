//
//  ViewController.swift
//  Art
//
//  Created by Shafiqul  Islam on 3/11/20.
//  Copyright © 2020 Shafiqul  Islam. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeVC: UIViewController {

    @IBOutlet weak var loginOutBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    
}
    
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = Auth.auth().currentUser {
            //we are logged in
            loginOutBtn.title = "Logout"
        } else {
            loginOutBtn.title = "Login"
        }
    }


    fileprivate func PresentLoignController() {
        let storyboard = UIStoryboard(name: StoryBoard.LoginStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: StoryBoardID.LoginVC)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func loginOutClicked(_ sender: Any) {
        if let _ = Auth.auth().currentUser{
            //We are logged in
            do {
                try Auth.auth().signOut()
                PresentLoignController()
            } catch {
                debugPrint(error.localizedDescription)
            }
        } else {
            PresentLoignController()
            
        }
        
    }
    
}

