//
//  ImageLoadingViewModel.swift
//  DownloadingImagesApp
//
//  Created by dofxmine on 24.03.2025.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    
    let urlString: String
    
    init(url: String) {
        urlString = "https://picsum.photos/600" // was: urlString = url
        downloadImage()
    }
    
    func downloadImage() {
        print("downloading image now!")
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
                .store(in: &cancellables)
            
    }
    
}
