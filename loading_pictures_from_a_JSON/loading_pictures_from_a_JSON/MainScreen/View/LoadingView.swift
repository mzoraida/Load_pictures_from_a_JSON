//
//  LoadingView.swift
//  loading_pictures_from_a_JSON
//
//  Created by Masha on 13.09.2023.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(3)
        }
    }
}
