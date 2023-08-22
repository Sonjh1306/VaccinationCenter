//
//  BaseLabel.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/08/21.
//

import UIKit

class BaseLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(weight: UIFont.Weight,
                     fontSize: CGFloat,
                     textColor: UIColor,
                     nemberOfLine: Int,
                     textAlignment: NSTextAlignment,
                     text: String) {
        self.init()
        
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.text = text
    }
}
