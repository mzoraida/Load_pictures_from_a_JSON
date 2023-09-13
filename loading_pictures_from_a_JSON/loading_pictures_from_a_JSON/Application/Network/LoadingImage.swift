//
//  LoadingImage.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 10.09.2023.
//

import Foundation
import SwiftUI

class LoadingImage {
    
    static func loadingImage(url: URL, completion: @escaping (_ image: UIImage?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
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
