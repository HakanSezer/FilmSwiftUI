//
//  DownloaderClient.swift
//  FilmKitabı
//
//  Created by Hakan Sezer on 16.01.2024.
//

import Foundation

class DownloaderClient {
    //Search yapıyoruz.
    // İnterneten ilk veriyi çekmek için kullanıyoruz. Bu çekme işlemi ile birlikte eğer çekemezsek @escaping ile film içindne çekeceğimizi ve DownloaderError ile hata göndereceğimizi belirtik.
    func filmleriIndir(seach: String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void) {
        // Guard let ile eğer hatalıysa gösteriyoruz.
        guard let url = URL(string: "http://www.omdbapi.com/?i=\(seach)&apikey=b7282265") else {
            return completion(.failure(.yanlisURL))
        }
        
        //URL çağırmış olduk.
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // nil eşitse veri gelmedi demek.
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(filmCevabi.filmler))
            
            
            //Devam etmek ve başlatmak için kullanılıyor.
            // Bunu yapmazsak kod hiçbir zaman başlamıyor.
        }.resume()
    }
}

enum DownloaderError: Error {
    case yanlisURL
    case veriGelmedi
    case veriIslenemedi
}
