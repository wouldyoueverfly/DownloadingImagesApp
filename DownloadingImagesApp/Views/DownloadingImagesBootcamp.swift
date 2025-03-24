//
//  DownloadingImagesBootcamp.swift
//  DownloadingImagesApp
//
//  Created by dofxmine on 23.03.2025.
//

import SwiftUI

struct DownloadingImagesBootcamp: View {
    
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images")
            .listStyle(PlainListStyle())
        }
        
    }
}

#Preview {
    DownloadingImagesBootcamp()
}
