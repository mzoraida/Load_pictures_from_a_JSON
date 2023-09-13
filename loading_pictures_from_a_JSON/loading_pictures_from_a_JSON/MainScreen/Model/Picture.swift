//
//  Data.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 09.09.2023.
//

import Foundation

struct Picture: Decodable {
    let imageLink: String
    
    init?(dict: [String:Any]) {
        guard let image = dict["image"] as? String else { return nil }
        self.imageLink = image
    }
}
