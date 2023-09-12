//
//  DataLoaderViewModel.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 11.09.2023.
//

import Foundation
import SwiftUI

class DataLoaderViewModel {
    var data: DataLoader? = nil
    
    func getData(completion: @escaping (Result<UIImage, Error>) -> Void) {
        DataLoaderNetworkService.getData { result in
            switch result {
            case .success(let response):
                guard let imageUrl = URL(string: response.data.image) else { return }
                LoadingImage.downloadImage(url: imageUrl) { image in
                    guard let image = image else {
                        return
                    }
                    self.data = response.data
                    completion(.success(image))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func casheImage() {
        guard let imageUrl = URL(string: data?.image ?? "") else { return }
        if let cachedImage = CasheImage.shared.get(url: imageUrl as NSURL) {
            print("Данное изображение загруженно ИЗ кеша", cachedImage)
        } else {
            LoadingImage.downloadImage(url: imageUrl) { image in
                if let image = image {
                    CasheImage.shared.save(url: imageUrl as NSURL, image: image)
                    print("Данное изображение загруженно В кеш", imageUrl)
                }
            }
        }
    }
}
