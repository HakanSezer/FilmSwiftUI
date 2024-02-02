//
//  ContentView.swift
//  FilmKitabı
//
//  Created by Hakan Sezer on 16.01.2024.
//

import SwiftUI

struct FilmListeView: View {
    //özlemlenen obje haline getirdik.
    @ObservedObject var filmListeViewModel: FilmListeViewModel
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
        self.filmListeViewModel.filmAramasiYap(filmIsmi: "titanic")
    }
    
    var body: some View {
        List(filmListeViewModel.filmler, id: \.imdbId) { film in
            HStack {
                Image("placeholder")
            }
            
        }
    }
}

#Preview {
    FilmListeView()
}
