//
//  AsynchronousImageLoadingProtcol.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/26/22.
//

import UIKit

/**
 `AsynchronousImageLoadingState` is an `enum` used to handle each condition during the progress of asynchronous image loading.
 */
public enum AsynchronousImageLoadingState { // Add More Error Handling in Future
    case notLoading
    case loading
    case loaded(UIImage, URL?)
    case error(String)
}

public protocol AsynchronousImageLoadingProtocol: NetworkingProtocol {
    
}

public extension AsynchronousImageLoadingProtocol {
    
    func asyncImageLoad(from url: String?, dispatchQueue: DispatchQueue = .main, completionHandler: @escaping (Result<AsynchronousImageLoadingState, NetworkError>) -> ()) {
        let url = URL(string: url ?? "")
        asyncImageLoad(from: url, dispatchQueue: dispatchQueue, completionHandler: completionHandler)
    }
    func asyncImageLoad(from url: URL?, dispatchQueue: DispatchQueue = .main, completionHandler: @escaping (Result<AsynchronousImageLoadingState, NetworkError>) -> ()) {
        
        fetchDataFrom(url: url) { result in
            switch result {
                case .success(let data):
                    guard let image = UIImage(data: data)
                    else {
                        dispatchQueue.async {
                            completionHandler(.success(.error("Bad Data")))
                        }
                        return
                    }
                    dispatchQueue.async {
                        completionHandler(.success(.loaded(image, url)))
                    }
                case .failure(let error):
                    dispatchQueue.async {
                        completionHandler(.failure(error))
                    }
            }
        }
    }
    
    
    
    
    
}
