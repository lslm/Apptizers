//
//  RemoteImage.swift
//  Apptizers
//
//  Created by Lucas Santos on 30/09/23.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil

    func load(from URLString: String) {
        NetworkManager.shared.downloadImage(from: URLString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                withAnimation {
                    self.image = Image(uiImage: uiImage)
                }
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?

    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct ApptizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String

    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(from: urlString)
            }
    }
}
