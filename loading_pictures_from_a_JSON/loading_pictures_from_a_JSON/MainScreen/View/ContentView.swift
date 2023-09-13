//
//  ContentView.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 09.09.2023.
//

import SwiftUI

struct ContentView: View {
    private var viewModel = PictureViewModel()
    @State private var image: UIImage? = nil
    @State private var isPresentingDetail = false
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            if isLoading {
                LoadingView()
            } else {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .onTapGesture {
                            isPresentingDetail = true
                            viewModel.cashePicture()
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
    }
    
    private func changeImage() {
        isLoading = true
        
        viewModel.getPicture { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let image):
                    self.image = image
                case .failure(let error):
                    print("error", error)
                }
            }
        }
    }
}

//struct LoadingView: View {
//    var body: some View {
//        ZStack {
//            Color(.systemBackground)
//                .ignoresSafeArea()
//            
//            ProgressView()
//                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
//                .scaleEffect(3)
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
