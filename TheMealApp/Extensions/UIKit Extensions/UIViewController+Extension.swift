//
//  ExtensionUIViewController.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//

import UIKit

public extension UIViewController {
    
    func setTitle(with title: String?) {
        navigationItem.title = title ?? nil
    }
   
}
