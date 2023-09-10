//
//  NetworkService.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 09.09.2023.
//

import Foundation
import SwiftUI

class NetworkService {
    private init() {}
    static let shared = NetworkService()
    
    public func getData(url: URL, completion: @escaping (Result<Any, Error>) -> ()) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "NetworkServiceErrorDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "Empty response data"])
                completion(.failure(error))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                completion(.success(json))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
