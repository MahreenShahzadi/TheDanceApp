//
//  VideoSectionTblVCCell.swift
//  TheDanceApp
//
//  Created by Coding Pursuits on 16/07/2019.
//  Copyright © 2019 Coding Pursuits. All rights reserved.
//

import UIKit

class VideoSectionTblVCCell: UITableViewCell {

    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var secNameLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
