//
//  DataLoaderViewModel.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 11.09.2023.
//

import Foundation
import SwiftUI

class DataLoaderViewModel: ObservableObject {
    var dataLoaderNetworkService = DataLoaderNetworkService()
    var data: DataLoader? = nil
    
    func getData(completion: @escaping (Result<UIImage, Error>) -> Void) {
        DataLoaderNetworkService.getData { result in
            switch result {
            case .success(let response):
                let imageUrl = response.data.image
                LoadingImage.downloadImage(url: imageUrl) { image in
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
}
