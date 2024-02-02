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
    
    @State var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
        self.filmListeViewModel.filmAramasiYap(filmIsmi: "titanic")
    }
    
    var body: some View {
        NavigationView {
            TextField("Aranacak Film", text: $aranacakFilm) {
                //onCommit
                // bu trimming ve whites ile her alanda arama yapacak, yani boşlukları da görmüş olacak Apiden çekerken.
                self.filmListeViewModel.filmAramasiYap(filmIsmi:
                                                        aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
            }
            
            List(filmListeViewModel.filmler, id: \.imdbId) { film in
                HStack {
                    Image("placeholder")
                }
                
            }
        }
    }
}

#Preview {
    FilmListeView()
}
