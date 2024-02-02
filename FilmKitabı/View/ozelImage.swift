//
//  ozelImage.swift
//  FilmKitabı
//
//  Created by Hakan Sezer on 1.02.2024.
//

import SwiftUI

struct ozelImage: View {
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownlanderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.gorselIndir(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.indirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else {
            return Image("placeholder2")
                .resizable()
        }
    }
}

#Preview {
    ozelImage(url: "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIz")
}
