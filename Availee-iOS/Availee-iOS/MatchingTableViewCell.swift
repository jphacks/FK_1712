//
//  MatchingTableViewCell.swift
//  Availee-iOS
//
//  Created by Risa Ezoe on 2017/10/28.
//  Copyright © 2017年 fk_1712. All rights reserved.
//

import UIKit

class MatchingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.layer.cornerRadius = iconImageView.frame.size.width / 2
        iconImageView.clipsToBounds = true
        
    }
    
    override func layoutIfNeeded() {
//        iconImageView.layer.cornerRadius = iconImageView.frame.height/2
//        iconImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
