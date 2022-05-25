//
//  UrlSession.swift
//  AssignmentJSON
//
//  Created by STL/LT/030 on 06/05/22.
//  Copyright © 2022 SAISURAJ. All rights reserved.
//

import UIKit

class UrlSession: NSObject {

    static let shared = UrlSession()
    
    private override init(){}
    
    typealias dataCompletion = ([String :AnyObject]?,Data,Error?) -> ()
    
    func APIRequestProfiles(urlStrData:String,httpMethods:String,headersProfile:[String:String],completion: @escaping dataCompletion) {
        let request = NSMutableURLRequest(url: NSURL(string: urlStrData)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        print(urlStrData,"str")
        request.httpMethod = httpMethods
        request.allHTTPHeaderFields = headersProfile
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completion(nil,data!,error)
            } else {
                do {
                    let json  = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves)
                    completion(json as? [String : AnyObject],data!,nil)
                }
                catch  {
                    print(error.localizedDescription)
                    completion(nil,data!,error)
                }
            }
        })
        dataTask.resume()
    }
    
}
