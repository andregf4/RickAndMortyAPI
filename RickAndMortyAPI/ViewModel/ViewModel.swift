//
//  ViewModel.swift
//  RickAndMortyAPI
//
//  Created by Andre Gerez Foratto on 10/05/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var personagens: [Results] = []
    
    func fetch() {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode(Personagens.self, from: data)
                DispatchQueue.main.async {
                    self?.personagens = parsed.results
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
