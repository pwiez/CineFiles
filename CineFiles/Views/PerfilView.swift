//
//  PerfilView.swift
//  CineFiles
//
//  Created by Pedro Wiezel on 30/05/25.
//

import SwiftUI

struct PerfilView: View {
    
    //@State private var movies: [MovieModel] = .movies()
    @EnvironmentObject var moviesData: DataModel
    
    @State private var selectedMovieIndex: Int? = nil
    @State private var showAllMovies = false
    @State private var showSavedMovies = false
    @State private var showWatchedMovies = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading, spacing: 0) {
                    ZStack {
                        Text("Perfil")
                            .bold()
                            .foregroundColor(.white)
                        HStack {
                            Button(action: {  }) {
                                HStack(spacing: 4) {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.white)
                                    Text("Voltar")
                                        .bold()
                                        .foregroundColor(.white)
                                }
                            }
                            Spacer()
                            Image("simbolo-claro")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32.47258, height: 23.99995)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    
                    HStack {
                        Spacer()
                        VStack(spacing: 16) {
                            
                            Image("profile_pfp")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                            
                            VStack(spacing: 8) {
                                Text("scorsese_theman")
                                
                                HStack {
                                    Image(systemName: "mappin")
                                    Text("Brussels")
                                }
                            }.foregroundStyle(.white)
                        }
                        Spacer()
                    }.padding(25)
         
                    // Saved section
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Label("Salvos", systemImage: "bookmark")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                            Spacer()
                            Button(action: { showSavedMovies = true }) {
                                HStack(spacing: 4) {
                                    Text("Ver todos")
                                    Image(systemName: "chevron.right")
                                }
                                .foregroundColor(.white)
                                .font(.subheadline.bold())
                            }
                        }
                        .padding(.horizontal, 16)
                        
                        let savedMovies = moviesData.movies.enumerated().filter { $0.element.isSaved }
                        
                        if savedMovies.isEmpty {
                            Text("Nenhum filme salvo ainda.")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 24)
                        } else {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(savedMovies, id: \.element.id) { (index, movie) in
                                        VStack(alignment: .leading, spacing: 6) {
                                            Button {
                                                selectedMovieIndex = index
                                            } label: {
                                                Image(movie.posterImage)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 120, height: 180)
                                                    .clipped()
                                                    .cornerRadius(12)
                                            }
                                            Text(movie.title)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .lineLimit(1)
                                            Text(movie.releaseYear)
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                        }
                                        .frame(width: 120)
                                    }
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                    .padding(.top, 32)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Label("Assistidos", systemImage: "eye")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                            Spacer()
                            Button(action: { showWatchedMovies = true }) {
                                HStack(spacing: 4) {
                                    Text("Ver todos")
                                    Image(systemName: "chevron.right")
                                }
                                .foregroundColor(.white)
                                .font(.subheadline.bold())
                            }
                        }
                        .padding(.horizontal, 16)

                        let watchedMovies = moviesData.movies.enumerated().filter { $0.element.isWatched }

                        if watchedMovies.isEmpty {
                            Text("Nenhum filme assistido ainda.")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 24)
                        } else {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(watchedMovies, id: \.element.id) { (index, movie) in
                                        VStack(alignment: .leading, spacing: 6) {
                                            Button {
                                                selectedMovieIndex = index
                                            } label: {
                                                Image(movie.posterImage)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 120, height: 180)
                                                    .clipped()
                                                    .cornerRadius(12)
                                            }
                                            Text(movie.title)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .lineLimit(1)
                                            Text(movie.releaseYear)
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                        }
                                        .frame(width: 120)
                                    }
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                    .padding(.top, 32)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
            }
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.11, green: 0.29, blue: 1), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13), location: 0.80),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 0.56)
                )
            )
            .navigationDestination(isPresented: Binding(
                get: { selectedMovieIndex != nil },
                set: { if !$0 { selectedMovieIndex = nil } }
            )) {
                if let index = selectedMovieIndex {
                    DetalheFilmeView(movie: $moviesData.movies[index])
                }
            }
            .navigationDestination(isPresented: $showWatchedMovies) {
                FilmesGridView(
                    title: "Assistidos",
                    movies: $moviesData.movies,
                    filter: { $0.isWatched }
                )
            }
            .navigationDestination(isPresented: $showSavedMovies) {
                FilmesGridView(
                    title: "Salvos",
                    movies: $moviesData.movies,
                    filter: { $0.isSaved }
                )
            }
        }
    }
}

#Preview(){
    PerfilView()
        .environmentObject(DataModel())
}
