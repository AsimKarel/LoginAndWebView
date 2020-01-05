//
//  ViewController.swift
//  LoginMcR
//
//  Created by Asim Karel on 05/01/20.
//  Copyright © 2020 Asim Karel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    var token:String!;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
    }
    
    func validateForm() -> Bool{
        if emailTextField.text == "" || passwordTextField.text == "" {
            self.validationLabel.text = "Please enter credentials"
            self.validationLabel.isHidden = false;
            return false
        }
        self.validationLabel.isHidden = true;
        return true;
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "WEB_SEGUE") {
            let vc = segue.destination as! WebViewViewController
            vc.token = token;
        }
    }
    
    func gotoWebPage(){
        self.performSegue(withIdentifier: "WEB_SEGUE", sender: self);
    }
    
    @IBAction func onClickLoginButton(_ sender: Any) {
        if(!validateForm()){
            return;
        }
        validationLabel.isHidden = true;
        let credentials:NSMutableDictionary = NSMutableDictionary();
        credentials["email"] = emailTextField.text!;
        credentials["password"] = passwordTextField.text!;
        NetworkService.sharedInstance().loginAPI(parameters: credentials, success_callback: { (success) in
            self.token = success.token;
            UserDefaults.standard.set(self.token, forKey: "TOKEN");
            self.gotoWebPage();
        }) { (error) in
            print(error.message)
            self.validationLabel.text = error.message
            self.validationLabel.isHidden = false;
        }
    }
    
}

