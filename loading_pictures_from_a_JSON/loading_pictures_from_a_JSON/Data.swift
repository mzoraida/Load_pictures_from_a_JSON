//
//  Data.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 09.09.2023.
//

import Foundation

struct Data {
    let image: String
    let link: String
}

extension Data: Decodable {
    enum CodingKeys: String, CodingKey {
        case image = "image"
        case link = "link"
    }
}
