//
//  GetDataResponce.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 10.09.2023.
//

import Foundation

class GetDataResponse {
    let data: DataLoader
    
    init(json: [String: Any]) throws {
        guard let data = DataLoader(dict: json) else {
            let error = NSError(domain: "YourDomain", code: 42, userInfo: nil)
            throw error
        }
        self.data = data
    }
}
