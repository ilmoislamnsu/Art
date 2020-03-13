//
//  ViewController.swift
//  Art
//
//  Created by Shafiqul  Islam on 3/11/20.
//  Copyright © 2020 Shafiqul  Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    
}
    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard(name: StoryBoard.LoginStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: StoryBoardID.LoginVC)
        present(controller, animated: true, completion: nil)
    }


}

