import SwiftUI

struct FilmesGridView: View {
    let title: String
    @Binding var movies: [MovieModel]
    var filter: (MovieModel) -> Bool

    @Environment(\.dismiss) var dismiss

    @State private var selectedMovieIndex: Int? = nil

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Text(title)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .padding(.vertical, 24)
                Spacer()
            }
            ScrollView {
                LazyVGrid(columns: columns, spacing: 24) {
                    ForEach(movies.indices.filter { filter(movies[$0]) }, id: \.self) { index in
                        let movie = movies[index]
                        VStack(alignment: .leading, spacing: 8) {
                            Button {
                                selectedMovieIndex = index
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.04, green: 0.06, blue: 0.13).ignoresSafeArea())
        .navigationDestination(isPresented: Binding(
            get: { selectedMovieIndex != nil },
            set: { if !$0 { selectedMovieIndex = nil } }
        )) {
            if let index = selectedMovieIndex {
                DetalheFilmeView(movie: $movies[index])
            }
        }
    }
}
