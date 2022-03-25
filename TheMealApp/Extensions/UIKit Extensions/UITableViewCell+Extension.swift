//
//  ExtensionUITableViewCell.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//

import UIKit

public extension UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    func setAccessoryType(with showDisclosure: Bool) {
        accessoryType = showDisclosure ? .disclosureIndicator : .none
    }
    
}
