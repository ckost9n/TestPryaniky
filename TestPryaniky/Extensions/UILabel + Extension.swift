//
//  UILabel + Extension.swift
//  WorkOutTestApp
//
//  Created by Konstantin on 22.06.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String = "") {
        self.init()
        
        self.textAlignment = .center
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
