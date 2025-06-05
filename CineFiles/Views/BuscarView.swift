import SwiftUI

struct BuscarView: View {
    @EnvironmentObject var moviesData: DataModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var searchText: String = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var filteredMovies: [MovieModel] {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return moviesData.movies
        }
        let lowercased = searchText.lowercased()
        return moviesData.movies.filter {
            $0.title.lowercased().contains(lowercased) ||
            $0.synopsis.lowercased().contains(lowercased)
        }
    }
    
    @State private var selectedMovieIndex: Int? = nil
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Custom Nav Bar
                ZStack {
                    Text("Buscar")
                        .bold()
                        .foregroundColor(.white)
                    HStack {
                        Spacer()
                        Image("simbolo-claro")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32.47258, height: 23.99995)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 16)
                
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                    TextField("Pesquisar títulos ou descrições", text: $searchText)
                        .foregroundColor(.black)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(.vertical,12)
                .padding(.horizontal, 16)
                .background(Color(.white).opacity(0.7))
                .cornerRadius(20)
                .padding(.horizontal, 32)
                .padding(.top, 20)
                .padding(.bottom, 32)
                
                // Grid of movies
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 24) {
                        ForEach(filteredMovies.indices, id: \.self) { index in
                            let movie = filteredMovies[index]
                            VStack(alignment: .leading, spacing: 8) {
                                Button {
                                    if let realIndex = moviesData.movies.firstIndex(where: { $0.id == movie.id }) {
                                        selectedMovieIndex = realIndex
                                    }
                                } label: {
                                    Image(movie.posterImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 220)
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
                            .frame(width: 160)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 32)
                }
                Spacer()
            }
            .background(Color(red: 0.04, green: 0.06, blue: 0.13).ignoresSafeArea())
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(isPresented: Binding(
                get: { selectedMovieIndex != nil },
                set: { if !$0 { selectedMovieIndex = nil } }
            )) {
                if let index = selectedMovieIndex {
                    DetalheFilmeView(movie: $moviesData.movies[index])
                }
            }
        }
    }
}

#Preview {
    BuscarView()
        .environmentObject(DataModel())
}
