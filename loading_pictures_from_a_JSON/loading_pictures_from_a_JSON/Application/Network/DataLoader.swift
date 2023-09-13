//
//  DataLoaderNetworkService.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 10.09.2023.
//

import Foundation

class DataLoader: NSObject {
    override init() {}
    
    static let shared = DataLoader()
    
    func getData(url: String, completion: @escaping(Result<[String: Any], Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        
        NetworkService.shared.getData(url: url) { result in
            switch result {
            case .success(let json):
                if let data = json as? [String: Any] {
                    completion(.success(data))
                } else {
                    let error = NSError(domain: "Invalid JSON", code: 0, userInfo: nil)
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
