//
//  LoadingImage.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 10.09.2023.
//

import Foundation
import SwiftUI

class LoadingImage {
    
    static func downloadImage(url: String, completion: @escaping (_ image: UIImage?) -> Void) {
        guard let imageUrl = URL(string: url) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            if let error = error {
                print("Error downloading image: \(error)")
                completion(nil)
                return
            }
            
            if let imageData = data, let image = UIImage(data: imageData) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        
        task.resume()
    }
}
