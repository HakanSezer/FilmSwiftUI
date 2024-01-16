//
//  FilmViewModel.swift
//  FilmKitabı
//
//  Created by Hakan Sezer on 16.01.2024.
//

import Foundation
import SwiftUI

//ObservableObject başka yerlerde gözlemek için kullanıyoruz. ve bunu seçerek yapıyoruz.
class FilmListeViewModel: ObservableObject {
    
    @Published var filmler = [Film]()
    
    let downloaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi: String) {
        downloaderClient.filmleriIndir(seach: filmIsmi) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let filmDizisi):
                if let filmDizisi = filmDizisi {
                    self.filmler = filmDizisi
                }
            }
        }
    }
}
