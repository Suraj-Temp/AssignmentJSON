//
//  CommentViewController.swift
//  AssignmentJSON
//
//  Created by SAISURAJ on 4/27/22.
//  Copyright © 2022 SAISURAJ. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var commentLbl: UILabel!
    var viewModelComments = PostsCommentsModel()
    var modelPosts: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
         navigationController?.navigationBar.isHidden = true
         viewModelComments.vc2 = self
         viewModelComments.postsDetails = false
         print(modelIden,"modelId")
         self.viewModelComments.getAllUserData()
        
//        if viewModelComments.arrComments.count != 0{
//             for id in 0...viewModelComments.arrComments.count-1{
//                 if modelPosts == viewModelComments.arrComments[id].id{
//                    print(modelPosts as Any,"compare",viewModelComments.arrComments[id].id as Any)
//                     let modelComments = viewModelComments.arrComments[id]
//                    commentLbl.text = modelComments.body
//                }
//            }
//        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell", for: indexPath) as? CommentsTableViewCell
     if viewModelComments.arrComments.count != 0{
          for id in 0...viewModelComments.arrComments.count-1{
              if modelIden == viewModelComments.arrComments[id].id{
                 print(modelPosts as Any,"x",viewModelComments.arrComments[id].id as Any)
                let modelComments = viewModelComments.arrComments[id]
                cell?.modelComments  =  modelComments
             }
          }
       }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
     }
    
//    var modelComments:CommentsModel?{
//        didSet{
//            commentLbl.text = modelComments?.body
//        }
//    }
    @IBAction func back(_ sender: UIBarButtonItem) {
        modelIden = Int()
        Utils.navToStoryboard(currentController: self, storyboard: "Main", modelId: Int())
//        self.navigationController?.popViewController(animated: true)
    }
    
}
