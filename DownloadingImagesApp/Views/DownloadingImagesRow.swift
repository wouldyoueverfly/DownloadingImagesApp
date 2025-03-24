//
//  DownloadingImagesRow.swift
//  DownloadingImagesApp
//
//  Created by dofxmine on 23.03.2025.
//

import SwiftUI

struct DownloadingImagesRow: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack {
            DownloadingImageView(url: model.url)
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundStyle(.secondary)
                    .italic(true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    DownloadingImagesRow(model: PhotoModel(albumId: 123, id: 123, title: "title", url: "https://picsum.photos/600", thumbnailUrl: "thumbnailUrl"))
}
