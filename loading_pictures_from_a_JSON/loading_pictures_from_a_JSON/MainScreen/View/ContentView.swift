//
//  ContentView.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 09.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var image: UIImage? = nil
    @State private var isPresentingDetail = false
    
    var body: some View {
        VStack {
            if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .onTapGesture {
                            isPresentingDetail = true
                        }
                        .sheet(isPresented: $isPresentingDetail) {
                            DetailView(image: image)
                        }
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
    
    func changeImage() {
        DataLoaderNetworkService.getData { result in
            switch result {
            case .success(let response):
                LoadingImage.downloadImage(url: response.data.image) { image in
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
