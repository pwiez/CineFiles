import Foundation

class DataModel: ObservableObject {
    
    @Published var movies: [MovieModel] = .movies()
    
    func toggleSaved(at index: Int) {
            guard movies.indices.contains(index) else { return }
            movies[index].isSaved.toggle()
        }
        
        func toggleWatched(at index: Int) {
            guard movies.indices.contains(index) else { return }
            movies[index].isWatched.toggle()
        }
        
}
