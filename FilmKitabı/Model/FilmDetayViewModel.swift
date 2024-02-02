//
//  FilmDetayViewModel.swift
//  FilmKitabı
//
//  Created by Hakan Sezer on 2.02.2024.
//

import Foundation
import SwiftUI

class FilmDetayViewModel: ObservableObject {
    @Published var filmDetayi: FilmDetayViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbId: String) {
        downloaderClient.filmDetayiniIndir(imbdId: imdbId) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let filmDetay):
                self.filmDetayi = FilmDetaylariViewModel(detay: FilmDetay)
            }
        }
    }
    
    
}

struct FilmDetaylariViewModel {
    let detay: FilmDetay
    
    var title: String {
        detay.title
    }
    var poster: String {
        detay.poster
    }
    var year: String {
        detay.year
    }
    var imdbId: String {
        detay.imdbId
    }
    var director: String {
        detay.writer
    }
    var awards: String {
        detay.awards
    }
}
