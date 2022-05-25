//
//  PostsCommentsMode.swift
//  AssignmentJSON
//
//  Created by SAISURAJ on 4/26/22.
//  Copyright © 2022 SAISURAJ. All rights reserved.
//

import Foundation

struct APIModel{
    static let baseUrl = "https://jsonplaceholder.typicode.com"
}
struct HTTPMethods{
    static let httpMethodGET = "GET"
    static let httpMethodPOST = "POST"
}
class PostsCommentsModel{
    
   var URLReqObj:URLRequest!
   var dataTaskObj:URLSessionDataTask!
   var arrPosts = [PostsModel]()
   var arrComments = [CommentsModel]()
   var endPoint = String()
   weak var vc:MainViewController?
   weak var vc2:CommentViewController?
   var postsDetails = Bool()
    
   // "https://jsonplaceholder.typicode.com/posts"
   func getAllUserData(){
       let headers    = [String:String]()
       DispatchQueue.main.async {
         self.vc?.addSplashLoaderView()
       }
       if postsDetails == false{
           endPoint = "/comments"
       }
       else{
           endPoint = "/posts"
       }
       UrlSession.shared.APIRequestProfiles(urlStrData: APIModel.baseUrl + endPoint, httpMethods: HTTPMethods.httpMethodGET, headersProfile: headers) { resp,data,err in
           if err == nil{
                 do{
                   if self.postsDetails == false{
                   let userResponse = try JSONDecoder().decode([CommentsModel].self, from: data)
                  // print(userResponse)
                   for comments in userResponse{
                     self.arrComments.append(comments)
                     //print(self.arrComments,"comments")
                     }
                       DispatchQueue.main.async { [self] in
                       self.vc?.removeLoader()
                       self.vc2?.tblView.reloadData()
                     }
                   }
                   else{
                       let postsResponse = try JSONDecoder().decode([PostsModel].self, from: data)
                         
                       // print(userResponse)
                        for posts in postsResponse{
                            self.arrPosts.append(posts)
                         }
                      postsModelData.append(contentsOf: self.arrPosts)
                      DispatchQueue.main.async {
                         self.vc?.removeLoader()
                         self.vc?.tblView.reloadData()
                       }
                    }
                 }
                 catch{
                   print(error.localizedDescription)
                  }
            }
           else{
               print(err?.localizedDescription,"error")
           }
           
       }

    }
    
    
}
