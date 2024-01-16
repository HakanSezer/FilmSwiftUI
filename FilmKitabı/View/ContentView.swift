//
//  ContentView.swift
//  FilmKitabı
//
//  Created by Hakan Sezer on 16.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            DownloaderClient().filmleriIndir(seach: "titanic") { (sonuc) in
                switch sonuc {
                case .success(let filmDizisi):
                    print(filmDizisi)
                case .failure(let hata):
                    print(hata)
                }
            }
        } label: {
            Text("Test Yap.")
        }

    }
}

#Preview {
    ContentView()
}
