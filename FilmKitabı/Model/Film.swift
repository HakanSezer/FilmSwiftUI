//
//  Film.swift
//  FilmKitabı
//
//  Created by Hakan Sezer on 16.01.2024.
//

import Foundation


struct Film: Codable {
    // Normalde böyle yazıyoruz. Fakat API çekemiyoruz çünkü isimler farklı için.
    var title: String
    var year: String
    var imdbId: String
    var type: String
    let poster: String
    
    //API adlarını eşitlemek için kullanıyoruz.
    //Bunula birlikte API üzerinden gelenleri buraya eşitleyecek.
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

// JSON yapısında dışarıda bir Array ile başladığı için içeridekileri alabilmek için bunu yapıyoruz.
struct GelenFilmler : Codable {
    let filmler: [Film]
    
    private enum CodingKeys: String, CodingKey {
        case filmler = "Seach"
    }
}
