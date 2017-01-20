//
//  SettingTableViewCell.swift
//  SpriteBox
//
//  Created by The Cowans on 19/01/2017.
//  Copyright © 2017 DCC. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    
    @IBOutlet weak var PropertyLabel: UILabel!

    @IBOutlet weak var ValueLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
