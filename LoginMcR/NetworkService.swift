//
//  NetworkService.swift
//  LoginMcR
//
//  Created by Asim Karel on 05/01/20.
//  Copyright © 2020 Asim Karel. All rights reserved.
//

import Foundation
import Alamofire
class NetworkService:NSObject{
    private static var _instance:NetworkService!;
    var headers: HTTPHeaders
    
    private override init() {
        headers = [
            "access-control-allow-headers": "Origin, X-Requested-With, Content-Type, Accept",
            "access-control-allow-methods": "GET, POST, PUT",
            "access-control-allow-origin": "*",
            "server": "cloudflare-nginx"
        ]
    }
    
    public static func sharedInstance() -> NetworkService{
        if(_instance == nil){
            _instance = NetworkService();
        }
        return self._instance;
    }
    
    public func loginAPI(parameters:NSDictionary,success_callback success: ((LoginSuccess) -> Void)?, failure_callback failure: ((LoginError) -> Void)?){
        Alamofire.request("https://reqres.in/api/login", method:.post, parameters:(parameters as! Parameters) , encoding: JSONEncoding.default).responseJSON { response in
            if response.response?.statusCode == 200{
                //Success
                success!(LoginSuccess(dict: response.result.value as! NSDictionary))
            } else{
                failure!(LoginError(dict: response.result.value as! NSDictionary))
            }
        }
    }
}
