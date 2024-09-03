//
//  Model.swift
//  RickAndMortyAPI
//
//  Created by Andre Gerez Foratto on 10/05/24.
//

import Foundation

struct Personagens: Decodable {
    let info: Info
    let results: [Results]
}

struct Info: Decodable, Hashable {
    let count: Int?
    let pages: Int?
    let next: String?
}

struct Results: Decodable, Identifiable {
    let id: Int
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin
    let location: Location
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

struct Origin: Decodable, Hashable {
    let name: String?
    let url: String?
}

struct Location: Decodable, Hashable {
    let name: String?
    let url: String?
}
