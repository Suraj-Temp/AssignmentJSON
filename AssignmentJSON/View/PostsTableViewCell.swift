//
//  PostsTableViewCell.swift
//  AssignmentJSON
//
//  Created by SAISURAJ on 4/26/22.
//  Copyright © 2022 SAISURAJ. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var titleData: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     var modelPosts:PostsModel?{
          didSet{
            titleData.text = modelPosts?.title
          }
      }

}
