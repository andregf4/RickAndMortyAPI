//
//  Pers.swift
//  RickAndMortyAPI
//
//  Created by Andre Gerez Foratto on 10/05/24.
//

import SwiftUI

struct Pers: View {
    
    @State var recebe: Results
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .opacity(0.5)
            
            VStack {
                AsyncImage(url: URL(string: recebe.image!)) { i in
                    i
                        .overlay(Circle().stroke(LinearGradient(colors: [.gray, .yellow, .gray], startPoint: .top, endPoint: .bottom), lineWidth: 12))
                        .clipShape(Circle())
                        .padding()
                } placeholder: {
                    ProgressView()
                }
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 200)
                        .foregroundStyle(LinearGradient(colors: [.beje, .verdeAgua], startPoint: .top, endPoint: .bottom))
                        .cornerRadius(20)
                    VStack {
                        Text(recebe.name!)
                            .font(.system(size: 28))
                            .fontWeight(.heavy)
                            .padding(.bottom, 10)
                        Text("**Status:** \(recebe.status!)")
                        Text("**Specie:** \(recebe.species!)")
                        Text("**Gender:** \(recebe.gender!)")
                        Text("**Location:** \(recebe.location.name!)")
                        Text("**Origin:** \(recebe.origin.name!)")
                    }
                }
            }
        }
    }
}

#Preview {
    Pers(recebe: Results(id: 1, name: "Rick Sanchez", status: "", species: "", type: "", gender: "", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [], url: "", created: ""))
}
