//
//  CustomCell.swift
//  Hotel_IOSApp
//
//  Created by Ayşe on 14.09.2017.
//  Copyright © 2017 Ayşe. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var InfoImage: UIImageView!
    
    @IBOutlet weak var InfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
