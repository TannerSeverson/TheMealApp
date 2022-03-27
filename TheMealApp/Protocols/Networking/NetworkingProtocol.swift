//
//  NetworkingProtocol.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/26/22.
//

import Foundation

public enum NetworkResponse<T> { // Add More Responses in Future
    case response(T)
}
public enum NetworkError: Error { // Add More Error Handling in Future
    case error(String)
    case invalidURL
    case noData
}

public enum NetworkingStatus { // Add More Networking Cases in Future
    case loading
    case loaded
    case failed
}


public protocol NetworkingProtocol {
    
}

public extension NetworkingProtocol {
    
    func fetchDataFrom(url: String?, dispatchQueue: DispatchQueue = .main, completionHandler: @escaping (Result<Data, NetworkError>) -> ()) {
        let url = URL(string: url ?? "")
        fetchDataFrom(url: url, dispatchQueue: dispatchQueue, completionHandler: completionHandler)
    }
    func fetchDataFrom(url: URL?, dispatchQueue: DispatchQueue = .main, completionHandler: @escaping (Result<Data, NetworkError>) -> ()) {
        
        guard let url = url else {
            dispatchQueue.async {
                completionHandler(.failure(.invalidURL))
            }
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                dispatchQueue.async {
                    completionHandler(.failure(.error(error!.localizedDescription)))
                }
                return
            }
            
            guard let data = data else {
                dispatchQueue.async {
                    completionHandler(.failure(.noData))
                }
                return
            }
            
            dispatchQueue.async {
                completionHandler(.success(data))
            }
        }
        task.resume()
    }
    
    
    func decodeDataFromJSON<T: Decodable>(
        url: String?,
        to dataType: T.Type,
        dispatchQueue: DispatchQueue = .main,
        completionHandler: @escaping (Result<NetworkResponse<T>, NetworkError>) -> ())
    {
        let url = URL(string: url ?? "")
        decodeDataFromJSON(url: url, to: dataType, dispatchQueue: dispatchQueue, completionHandler: completionHandler)
    }
    func decodeDataFromJSON<T: Decodable>(
        url: URL?,
        to dataType: T.Type,
        dispatchQueue: DispatchQueue = .main,
        completionHandler : @escaping (Result<NetworkResponse<T>, NetworkError>) -> ())
    {
        fetchDataFrom(url: url) { result in
            switch result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(T.self, from: data)
                        dispatchQueue.async {
                            completionHandler(.success(.response(decodedData)))
                        }
                    } catch {
                        dispatchQueue.async {
                            completionHandler(.failure(.error(error.localizedDescription)))
                        }
                    }
                case .failure(let error):
                    dispatchQueue.async {
                        completionHandler(.failure(error))
                    }
            }
        }
    }
    
}
