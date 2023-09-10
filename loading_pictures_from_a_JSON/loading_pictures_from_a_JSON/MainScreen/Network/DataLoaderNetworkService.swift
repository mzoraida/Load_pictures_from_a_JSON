//
//  DataLoaderNetworkService.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 10.09.2023.
//

import Foundation

class DataLoaderNetworkService: NSObject {
    
    override init() {}
    
    static func getData(completion: @escaping(Result<GetDataResponse, Error>) -> ()) {
        let jsonUrlString = "https://randomfox.ca/floof/"
        guard let url = URL(string: jsonUrlString) else { return }
        
        NetworkService.shared.getData(url: url) { (result) in
            switch result {
            case .success(let json):
                do {
                    if let jsonDict = json as? [String: Any] {
                        let response = try GetDataResponse(json: jsonDict)
                        completion(.success(response))
                    } else {
                        let error = NSError(domain: "Invalid JSON", code: 0, userInfo: nil)
                        completion(.failure(error))
                    }
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
