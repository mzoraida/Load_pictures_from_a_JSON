//
//  Data.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 09.09.2023.
//

import Foundation

struct DataLoader: Decodable {
    let image: String
    let link: String
    
    init?(dict: [String:Any]) {
        guard let image = dict["image"] as? String,
              let link = dict["link"] as? String else { return nil }
        
        self.image = image
        self.link = link
    }
}
