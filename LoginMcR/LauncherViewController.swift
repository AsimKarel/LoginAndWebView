//
//  LauncherViewController.swift
//  LoginMcR
//
//  Created by Asim Karel on 05/01/20.
//  Copyright © 2020 Asim Karel. All rights reserved.
//

import UIKit

class LauncherViewController: UIViewController {
    var token:String!;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(UserDefaults.standard.string(forKey: "TOKEN") != nil){
            token = UserDefaults.standard.string(forKey: "TOKEN")!;
            self.performSegue(withIdentifier: "LOGGEDIN_SEGUE", sender: self);
        }
        else{
            self.performSegue(withIdentifier: "LOGIN", sender: self);
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "LOGGEDIN_SEGUE") {
            let vc = segue.destination as! WebViewViewController
            vc.token = token;
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
