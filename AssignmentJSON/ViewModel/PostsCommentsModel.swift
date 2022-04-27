//
//  PostsCommentsMode.swift
//  AssignmentJSON
//
//  Created by SAISURAJ on 4/26/22.
//  Copyright © 2022 SAISURAJ. All rights reserved.
//

import Foundation


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
       DispatchQueue.main.async {
         self.vc?.addSplashLoaderView()
       }
       if postsDetails == false{
           endPoint = "/comments"
       }
       else{
           endPoint = "/posts"
       }
       URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com\(endPoint)")!) { (data, response, error) in
           if error == nil{
               if let data = data{
                 do{
                   if self.postsDetails == false{
                   let userResponse = try JSONDecoder().decode([CommentsModel].self, from: data)
                  // print(userResponse)
                   for comments in userResponse{
                     self.arrComments.append(comments)
                     //print(self.arrComments,"comments")
                     }
                  DispatchQueue.main.async {
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
           }
           else{
               print(error?.localizedDescription)
           }
       }.resume()
    }
    
    
}
