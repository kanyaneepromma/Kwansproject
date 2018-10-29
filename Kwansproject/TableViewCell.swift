//
//  TableViewCell.swift
//  Kwansproject
//
//  Created by Kanyanee P on 9/10/2561 BE.
//  Copyright © 2561 Kanyanee P. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var txt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
