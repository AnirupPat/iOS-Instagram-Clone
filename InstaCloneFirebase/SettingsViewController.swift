//
//  SettingsViewController.swift
//  InstaCloneFirebase
//
//  Created by Anirup Patnaik on 27/10/19.
//  Copyright © 2019 Virtuelabs. All rights reserved.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
        } catch {
            print("Error !")
        }
    }
    

}
