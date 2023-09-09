//
//  NetworkService.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 09.09.2023.
//

import Foundation
import SwiftUI

class NetworkService {
    private let session = URLSession.shared
    private let dataUrl = URL(string: "https://randomfox.ca/floof/")!
    
    func getData(_ completion: @escaping (Data?) -> ()) {
        let request = URLRequest(url: dataUrl)
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
            } else if let data = data {
                print("Data")
                let data = try? JSONDecoder().decode(Data.self, from: data)
                completion(data)
            } else {
                print("Unknown error")
                completion(nil)
            }
        }.resume()
        
    }
    
    func getImage(urlString: String, completion: @escaping (UIImage?) -> () ) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let request = URLRequest(url: url)
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
            } else if let data = data {
                print("Data")
                let image = UIImage(data: data)
                completion(image)
            } else {
                print("Unknown error")
                completion(nil)
            }
        }.resume()
    }
}
