//
//  WebViewViewController.swift
//  LoginMcR
//
//  Created by Asim Karel on 05/01/20.
//  Copyright © 2020 Asim Karel. All rights reserved.
//

import UIKit
import WebKit
class WebViewViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var WebView: WKWebView!
    var url:String!;
    var token:String!;
    @IBOutlet weak var urlLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        WebView.uiDelegate = self;
        url = "https://mckinleyrice.com?token=\(token!)";
        urlLabel.text = url;
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        WebView.load(NSURLRequest(url: URL(string: url)!) as URLRequest);
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
