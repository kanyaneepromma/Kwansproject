//
//  iButton.swift
//  Kwansproject
//
//  Created by Kanyanee P on 9/10/2561 BE.
//  Copyright © 2561 Kanyanee P. All rights reserved.
//

import UIKit

class iButton: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.0
        layer.borderColor =  UIColor.white.cgColor
        
    }
    

}
