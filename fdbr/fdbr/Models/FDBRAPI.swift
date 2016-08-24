//
//  FDBRAPI.swift
//  fdbr
//
//  Created by Mohammad Nuruddin Effendi on 8/23/16.
//  Copyright © 2016 Female Daily. All rights reserved.
//

import Foundation
import Mantle

/**
 Used to represent whether a request was successful or encountered an error.
 
 - Success  : The request and all post processing operations were successful resulting in
 the native model serialization of the provided associated value.
 - Failure  : The request encountered a failure due to invalid data or call conditions.
 - Error    : The request encountered an error due to an error on the server,
 fail when serialize the model, or unknown error.
 */
public enum APIResult<Value> {
    case Success(Value)
    case Failure(String)
    case Error(NSError)
}


/// API endpoint constants.
public struct APIEndpoint {
    
    static let Login = "login/"
    static let Register = "register/"
}

typealias UserRegisterCompletionHandler = (result: APIResult<String>) -> Void
typealias UserLoginCompletionHandler = (result: APIResult<(String, User)>) -> Void

struct FDBRAPI {

    // MARK: Authentication
    /**
     Registering user to FDBR.
     
     - parameter username:              The user's username.
     - parameter password:              The user's password.
     - parameter email:                 The user's email.
     - parameter completionHandler:     The closure to be executed once the request has finished.
     */
    static func register(username username: String, password: String, email: String, completionHandler: UserRegisterCompletionHandler) {
        let parameters = ["username" : username,
                          "password" : password,
                          "email" : email]
        
        if let request = NetworkManager.request(.POST, APIEndpoint.Register, parameters: parameters, encoding: .JSON) {
            request.responseJSON(completionHandler: { (response) in
                let result: APIResult<String>!
                
                switch response.result {
                case .Success(let json):
                    guard let data = json["data"] as? [String : AnyObject] else {
                        result = .Failure("json data is not dictionary")
                        break
                    }
                    
                    guard let token = data["token"] as? String else {
                        result = .Failure("json token is not String")
                        break
                    }
                    
                    result = .Success(token)
                    
                case .Failure(let error):
                    result = .Error(NSError.createDefaultError(fromError: error))
                }
                
                completionHandler(result: result)
            })
        }
    }
    
    /**
     Logging in user into FDBR.
     
     - parameter username:              The user's username / email.
     - parameter password:              The user's password.
     - parameter completionHandler:     The closure to be executed once the request has finished.
     */
    static func login(username username: String, password: String, completionHandler: UserLoginCompletionHandler) {
        let parameters = ["username" : username,
                          "password" : password]
        
        if let request = NetworkManager.request(.POST, APIEndpoint.Login, parameters: parameters, encoding: .JSON) {
            request.responseJSON(completionHandler: { (response) in
                let result: APIResult<(String, User)>!
                
                switch response.result {
                case .Success(let json):
                    guard let data = json["data"] as? [String : AnyObject] else {
                        result = .Failure("json data is not dictionary")
                        break
                    }
                    guard let token = data["token"] as? String else {
                        result = .Failure("json token is not string")
                        break
                    }
                    guard let profile = data["rows"] as? [String : AnyObject] else {
                        result = .Failure("json rows is not dictionary")
                        break
                    }
                    
                    do {
                        let user = try MTLJSONAdapter.modelOfClass(User.self, fromJSONDictionary: profile) as! User
                        result = .Success((token, user))
                        
                    } catch (let error) {
                        result = .Error(error as NSError)
                    }
                    
                case .Failure(let error):
                    result = .Error(NSError.createDefaultError(fromError: error))
                }
                
                completionHandler(result: result)
            })
        }
    }
    
}
