//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Anirup Patnaik on 26/10/19.
//  Copyright © 2019 Virtuelabs. All rights reserved.
//

import UIKit
import  Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messsageInput: error?.localizedDescription ??
                    "Error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else {
            makeAlert(titleInput: "Error", messsageInput: "Username/Password Missing")
        }
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error", messsageInput: error?.localizedDescription ??
                    "Error")
                    
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else {
            makeAlert(titleInput: "Error", messsageInput: "Username/Password Missing")
        }
        
    }
    
    func makeAlert(titleInput:String, messsageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messsageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

