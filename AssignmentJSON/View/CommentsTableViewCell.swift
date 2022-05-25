//
//  CommentsTableViewCell.swift
//  AssignmentJSON
//
//  Created by SAISURAJ on 4/27/22.
//  Copyright © 2022 SAISURAJ. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var commentsLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var modelComments:CommentsModel?{
        didSet{
            commentsLbl.text = modelComments?.body
            nameLbl.text = modelComments?.name
            emailLbl.text = modelComments?.email
        }
    }

}
