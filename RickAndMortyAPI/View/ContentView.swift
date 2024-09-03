//
//  ContentView.swift
//  RickAndMortyAPI
//
//  Created by Andre Gerez Foratto on 10/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    
    @State private var searchText: String = ""
    
    var searchResults: [Results] {
        if searchText.isEmpty {
            return vm.personagens
        } else {
            return vm.personagens.filter { $0.name!.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.yellow, .green, .verdeAgua], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Image("rickandmorty")
                        .resizable()
                        .frame(height: 100)
                        .padding()
                    TextField("Search here...", text: $searchText)
                        .padding()
                        .frame(width: 350)
                        .background(Color.beje).opacity(0.6)
                        .border(Color.black)
                        .padding()
                    VStack {
                        ScrollView {
                            ForEach(searchResults) { p in
                                ZStack {
                                    Capsule().foregroundStyle(Color.beje)
                                    HStack {
                                        AsyncImage(url: URL(string: p.image!)) { i in
                                            i
                                                .resizable()
                                                .frame(width: 70, height: 70)
                                                .clipShape(Circle())
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        
                                        Text(p.name!)
                                        
                                        Spacer()
                                        NavigationLink(destination: Pers(recebe: p)) {
                                            Image(systemName: "arrow.right.circle")
                                                .padding(.trailing, 20)
                                                .foregroundStyle(Color.black)
                                                .font(.system(size: 25))
                                        }
                                    }
                                }.overlay(Capsule().stroke(LinearGradient(colors: [.black, .gray], startPoint: .leading, endPoint: .trailing), lineWidth: 1.5))
                                    .padding([.top, .bottom], 1)
                                    .padding([.leading, .trailing], 20)
                            }
                            .foregroundStyle(Color.black)
                        }
                    }
                }
                .onAppear() {
                    vm.fetch()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
