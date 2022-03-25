//
//  SectionIdentifierProtocol.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//

import UIKit

/**
 `SegueIdentifierProtocol` allows using an `enum` with a value type `String` to handle segueing inside of a `ViewController`.
 Each `case` should be the name of the `identifier` for the Storyboard Segue.
 */
public protocol SegueIdentifierProtocol {
    associatedtype SegueIdentifier: RawRepresentable
}

public extension SegueIdentifierProtocol where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    /**
     Performs a segue using the `rawValue` from the chosen `SegueIdentifier case`.
     
     - Parameter segueIdentifier: The `case` from the `SegueIdentifier` conforming `enum`.
     */
    func performSegue(_ segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
    }
    
    /**
     Returns the `case` from the `SegueIdentifier` conforming `enum`.
     
     - Returns: A `case` from the `SegueIdentifier` conforming `enum`.
     - Parameter segue: The `segue` that  triggered `prepare(for segue: sender: Any?)`
     
     Useful to use as a `switch` statement for easily managing segues inside of `prepare(for segue: sender: Any?)`
     */
    func segueIdentifierForSegue(_ segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let segueIdentifier = segue.identifier else { fatalError("Failed: `segue.identifier`") }
        return segueIdentifierForName(name: segueIdentifier)
    }
    
    /**
     Returns the `case` from the `SegueIdentifier` conforming `enum`.
     
     - Returns: A `case` from the `SegueIdentifier` conforming `enum`.
     - Parameter name: The `segue.identifier` string from the performed segue.
     
     Converts the `segue.identifier` into a `case` of the `SegueIdentifier` conforming `enum`.
     */
    fileprivate func segueIdentifierForName(name: String) -> SegueIdentifier {
        guard let identifier = SegueIdentifier(rawValue: name) else { fatalError("Invalid segue: `\(name)`.") }
        return identifier
    }
}

