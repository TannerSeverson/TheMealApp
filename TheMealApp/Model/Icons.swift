//
//  Icons.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//

import UIKit

/**
 `Icons` is an `enum` for each image inside of `Assets.xcassets`
 */
public enum Icons: String, AssetProtocol {
    
    public var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
    
    case appleCore
    case bacon
    case burner
    case cake
    case checkmark
    case chef
    case chefHat
    case cow
    case dot
    case drumstick
    case egg
    case fish
    case imageSlash
    case memo
    case pig
    case receipt
    case seedling
    
}
