//
//  DataLoaderViewModel.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 11.09.2023.
//

import Foundation
import SwiftUI

class PictureViewModel {
    private var picture: Picture? = nil
    private let url = "https://randomfox.ca/floof/"
    
    func getPicture(completion: @escaping (Result<UIImage, Error>) -> Void) {
        DataLoader.getData(url: url) { result in
            switch result {
            case .success(let json):
                guard let picture = Picture(dict: json) else { return }
                self.picture = picture
                guard let imageUrl = URL(string: self.picture!.imageLink) else { return }
                LoadingImage.loadingImage(url: imageUrl) { image in
                    guard let image = image else {
                        return
                    }
                    completion(.success(image))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func cashePicture() {
        guard let imageUrl = URL(string: self.picture!.imageLink) else { return }
        
        if let cachedImage = CasheImage.shared.get(url: imageUrl as NSURL) {
            print("Данное изображение загруженно ИЗ кеша", cachedImage)
        } else {
            LoadingImage.loadingImage(url: imageUrl) { image in
                if let image = image {
                    CasheImage.shared.save(url: imageUrl as NSURL, image: image)
                    print("Данное изображение загруженно В кеш", imageUrl)
                }
            }
        }
    }
}
