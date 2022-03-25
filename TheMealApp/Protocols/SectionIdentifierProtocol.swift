//
//  DetailTableViewController.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//

import UIKit

/**
 `SectionIdentifierProtocol` allows using an `enum` to name sections inside of a `UITableViewController`.
 This is particlaur useful for detail views where you are returning many different types of `UITableViewCell` in a particular order.
 */
public protocol SectionIdentifierProtocol {
    associatedtype SectionIdentifier: RawRepresentable, CaseIterable
}

public extension SectionIdentifierProtocol where SectionIdentifier.RawValue == Int {
    
    /**
     Useful as a return inside `numberOfSections(in tableView: UITableView) -> Int`
     - Returns: An `Int` for the total number of cases in the `SectionIdentifier` conforming `enum`.
     */
    func numberOfSections() -> Int {
        return SectionIdentifier.allCases.count
    }
    
    /**
     Returns the `case` from the `SectionIdentifier` conforming `enum`.
     
     - Returns: A `case` from the `SectionIdentifier` conforming `enum`.
     - Parameter sectionNumber: The `section` number  of the `tableView`
     
     Useful to use as a `switch` statement for easily managing the `section` in the `tableView` you are working with.
     */
    func sectionIdentifierFor(_ sectionNumber: Int) -> SectionIdentifier {
        guard let sectionIdentifier = SectionIdentifier(rawValue: sectionNumber) else { fatalError("Invalid Section: `\(sectionNumber)`.") }
        return sectionIdentifier
    }
    
}
