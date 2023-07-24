//
//  HTTPDataDownloader.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

protocol HTTPDataDownloader {
    func httpData(from: URL) async throws -> Data
}

extension URLSession: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        guard let (data, response) = try await self.data(from: url, delegate: nil) as? (Data, HTTPURLResponse),
              Network.validStatus.contains(response.statusCode) else {
            throw Network.Error.networkError
        }
        return data
    }
}
