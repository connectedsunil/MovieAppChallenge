//
//  LabelExtension.swift
//  MovieAppChallenge
//
//  Created by Kumar,Sunil on 25/01/19.
//  Copyright © 2019 Kumar,Sunil. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    var optimalHeight : CGFloat {
        get
        {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.font = self.font
            label.text = self.text
            label.sizeToFit()
            return label.frame.height
        }
        
    }
}
