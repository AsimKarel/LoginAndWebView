//
//  Error.swift
//  LoginMcR
//
//  Created by Asim Karel on 05/01/20.
//  Copyright © 2020 Asim Karel. All rights reserved.
//

import Foundation
class LoginError{
    var message:String;
    init(dict:NSDictionary) {
        message = dict["error"] as! String;
    }
}
class LoginSuccess{
    var token:String;
    init(dict:NSDictionary) {
        token = dict["token"] as! String;
    }
}
