//
//  Network+Error.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

extension Network {
    enum Error: Swift.Error {
        case networkError
        case unexpected(error: Swift.Error)
    }
}

extension Network.Error: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .networkError:
                return NSLocalizedString(
                    "Error fetching data over the network.",
                    comment: ""
                )
            case .unexpected(let error):
                return NSLocalizedString(
                    "Received unexpected error. \(error.localizedDescription)",
                    comment: ""
                )
        }
    }
}
