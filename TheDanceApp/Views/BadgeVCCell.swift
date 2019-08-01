//
//  BudgeVCCell.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 16/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit

class BadgeVCCell: UITableViewCell {

    @IBOutlet weak var badgeLbl: UILabel!
    @IBOutlet weak var badgeImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
