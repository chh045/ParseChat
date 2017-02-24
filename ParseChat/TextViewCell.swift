//
//  TextViewCell.swift
//  ParseChat
//
//  Created by Huang Edison on 2/23/17.
//  Copyright © 2017 Edison. All rights reserved.
//

import UIKit
import Parse

class TextViewCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    var message: PFObject? {
        didSet{
            if let m = self.message?["text"] as? String {
                messageLabel.text = m
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
