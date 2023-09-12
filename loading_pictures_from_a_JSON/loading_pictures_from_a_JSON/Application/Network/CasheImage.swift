//
//  CasheImage.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 12.09.2023.
//

import Foundation
import SwiftUI

class CasheImage {
    static var shared = CasheImage()
    
    private var imageCashe = NSCache<NSURL, UIImage>()
    
    func save(url: NSURL, image: UIImage) {
        imageCashe.setObject(image, forKey: url)
    }
    
    func get(url: NSURL) -> NSURL? {
        if imageCashe.object(forKey: url) != nil {
            return url
        }
        return nil
    }
    
}
