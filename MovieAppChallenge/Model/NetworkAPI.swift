//
//  NetworkAPI.swift
//  MovieAppChallenge
//
//  Created by Kumar,Sunil on 24/01/19.
//  Copyright © 2019 Kumar,Sunil. All rights reserved.
//

import Foundation
import Alamofire

class NetworkAPI: NSObject {
    class func requestGETURL(_ strURL: String, success:@escaping ([String : Any]) -> Void, failure:@escaping (Error) -> Void) {
        Alamofire.request(strURL).responseJSON { (responseObject) -> Void in
            
            //print(responseObject)
            
            if responseObject.result.isSuccess {
                success(responseObject.result.value! as! [String : Any])
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
}
