//
//  ContentView.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 09.09.2023.
//

import SwiftUI

struct ContentView: View {
    private let network = NetworkService()
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Text("No Image")
                    .font(.title)
            }

            Button(action: {
                changeImage()
            }) {
                Text("Next Image")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
    
    func loadImageURLs(_ urlString: String) {
        network.getImage(urlString: urlString) { image in
            if let image = image {
                DispatchQueue.main.async {
                    self.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self.image = nil
                }
            }
        }
    }
    
    func changeImage() {
        network.getData { data in
            if let data = data {
                DispatchQueue.main.async {
                    self.handleData(data)
                }
            }
        }
    }
    
    private func handleData(_ data: Data) {
        loadImageURLs(data.image)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

