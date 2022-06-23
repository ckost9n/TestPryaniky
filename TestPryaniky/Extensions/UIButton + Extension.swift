//
//  UIButton + Extension.swift
//  TestPryaniky
//
//  Created by Konstantin on 22.06.2022.
//

import UIKit

extension UIButton {
    
    convenience init(text: String) {
        self.init(type: .system)
        self.backgroundColor = .blue
        self.setTitle(text, for: .normal)
        self.tintColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
