//
//  DetailView.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 10.09.2023.
//

import Foundation
import SwiftUI

struct DetailView: View {
    var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
