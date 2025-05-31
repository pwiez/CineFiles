import SwiftUI

struct HomeView: View {
    
    @State private var movies = DataModel().movies
    @State private var selectedMovieIndex: Int? = nil
    @State private var showAllMovies = false
    @State private var showSavedMovies = false
    @State private var showWatchedMovies = false
    
    let teaserImages = [
        "cinefileshometeaser1",
        "cinefileshometeaser2",
        "cinefileshometeaser3",
        "cinefileshometeaser4"
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading, spacing: 0) {
                    ZStack(alignment: .bottom) {
                        TabView {
                            ForEach(teaserImages, id: \.self) { imageName in
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                                    .overlay(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.8)]),
                                            startPoint: .center,
                                            endPoint: .bottom
                                        )
                                        .frame(maxHeight: .infinity, alignment: .bottom)
                                        .ignoresSafeArea()
                                    )
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .automatic))
                        .frame(height: 400)
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.black.opacity(0.4))
                            .frame(width: 80, height: 32)
                            .padding(.bottom, 8)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Label("Filmes", systemImage: "film")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                            Spacer()
                            Button(action: { showAllMovies = true }) {
                                HStack(spacing: 4) {
                                    Text("Ver todos")
                                    Image(systemName: "chevron.right")
                                }
                                .foregroundColor(.white)
                                .font(.subheadline.bold())
                            }
                        }
                        .padding(.horizontal, 16)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(movies.indices, id: \.self) { index in
                                    let movie = movies[index]
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
                    .padding(.top, 24)
                    
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
                        
                        let savedMovies = movies.enumerated().filter { $0.element.isSaved }
                        
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

                        let watchedMovies = movies.enumerated().filter { $0.element.isWatched }

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
                .background(Color(red: 0.04, green: 0.06, blue: 0.13))
            }
            .background(Color(red: 0.04, green: 0.06, blue: 0.13).ignoresSafeArea())
            .navigationDestination(isPresented: Binding(
                get: { selectedMovieIndex != nil },
                set: { if !$0 { selectedMovieIndex = nil } }
            )) {
                if let index = selectedMovieIndex {
                    DetalheFilmeView(movie: $movies[index])
                }
            }
            .navigationDestination(isPresented: $showAllMovies) {
                FilmesGridView(
                    title: "Filmes",
                    movies: $movies,
                    filter: { _ in true }
                )
            }
            .navigationDestination(isPresented: $showWatchedMovies) {
                FilmesGridView(
                    title: "Assistidos",
                    movies: $movies,
                    filter: { $0.isWatched }
                )
            }
            .navigationDestination(isPresented: $showSavedMovies) {
                FilmesGridView(
                    title: "Salvos",
                    movies: $movies,
                    filter: { $0.isSaved }
                )
            }
        }
    }
}

#Preview(){
    HomeView()
}
