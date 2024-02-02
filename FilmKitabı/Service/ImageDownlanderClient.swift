//
//  ImageDownlanderClient.swift
//  FilmKitabı
//
//  Created by Hakan Sezer on 1.02.2024.
//

import Foundation

class ImageDownlanderClient: ObservableObject {
    @Published var indirilenGorsel: Data?
    
    func gorselIndir(url: String) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.indirilenGorsel = data
            }
            
             
        }.resume()
    }
}
