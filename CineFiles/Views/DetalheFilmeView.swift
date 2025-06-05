import SwiftUI

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct DetalheFilmeView: View {
    @Binding var movie: MovieModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.11, green: 0.29, blue: 1), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13), location: 0.62),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.56)
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    ZStack {
                        Text("Descrição")
                            .bold()
                            .foregroundColor(.white)
                        HStack {
                            Button(action: { dismiss() }) {
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
                    
                    ZStack {
                        Image("detailviewbackgrounddetail")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(x: 1.3, y: 1.3)
                            .frame(maxWidth: .infinity, minHeight: 284, maxHeight: 284)
                            .clipped()
                        Image(movie.posterImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 191.9, height: 284)
                            .clipped()
                            .cornerRadius(18)
                            .shadow(color: Color(red: 0.04, green: 0.06, blue: 0.13), radius: 50, x: 0, y: 50)
                        
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        HStack(alignment: .center) {
                            Text(movie.title)
                                .font(.title.bold())
                                .foregroundColor(.white)
                                .lineLimit(2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack(spacing: 16) {
                                Button(action: {
                                    movie.isWatched.toggle()
                                }) {
                                    Image(systemName: movie.isWatched ? "eye.fill" : "eye.slash")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(movie.isWatched ? Color.green : Color.gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                                Button(action: {
                                    movie.isSaved.toggle()
                                }) {
                                    Image(systemName: movie.isSaved ? "bookmark.fill" : "bookmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(movie.isSaved ? Color.blue : Color.gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                            }
                        }
                        .padding(.bottom, 4)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Sinopse")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(movie.synopsis)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Direção")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(movie.director)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Roteiristas")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(movie.screenWriters)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Ano")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(movie.releaseYear)
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 16)
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.horizontal, 16)
                    
                    //botões cobrindo a tela toda horizontalmente, embaixo de todo o resto
                    
                    
                    //                    Button(action: {
                    //                        movie.isWatched.toggle()
                    //                    }) {
                    //                        HStack {
                    //                            Image(systemName: movie.isWatched ? "eye.fill" : "eye")
                    //                            Text(movie.isWatched ? "Assistido" : "Marcar como assistido")
                    //                                .bold()
                    //                        }
                    //                        .frame(maxWidth: .infinity)
                    //                        .padding()
                    //                        .background(Color.green)
                    //                        .foregroundColor(.white)
                    //                        .cornerRadius(12)
                    //                    }
                    //                    .padding(.horizontal, 24)
                    //
                    //                    Button(action: {
                    //                        movie.isSaved.toggle()
                    //                    }) {
                    //                        HStack {
                    //                            Image(systemName: movie.isSaved ? "bookmark.fill" : "bookmark")
                    //                            Text(movie.isSaved ? "Salvo" : "Salvar")
                    //                                .bold()
                    //                        }
                    //                        .frame(maxWidth: .infinity)
                    //                        .padding()
                    //                        .background(Color.accentColor)
                    //                        .foregroundColor(.white)
                    //                        .cornerRadius(12)
                    //                    }
                    //                    .padding(.horizontal, 24)
                    //                }
                    //.padding(.top)
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}
