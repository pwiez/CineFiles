import SwiftUI

struct OnboardingView: View {
    var onContinue: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.11, green: 0.29, blue: 1).opacity(0), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.02, green: 0.08, blue: 0.34), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .ignoresSafeArea()
            
            Image("Onboarding_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 60) {
                Image("cineFiles_claro")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    .padding(.bottom, 40)

                VStack(alignment: .leading, spacing: 30) {
                    FeatureRow(
                        icon: "movieclapper.fill",
                        text: "Explore os filmes escolhidos pela mentoria. Qual filme será que a Naomi escolheu?"
                    )
                    FeatureRow(
                        icon: "binoculars.fill",
                        text: "Não achou o filme? Use a nossa barra de pesquisa!"
                    )
                    FeatureRow(
                        icon: "person.fill",
                        text: "Torne-se uma pessoa mais culta, salve, chame os amigos e assista os filmes selecionados!"
                    )
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 40)
                
                Button(action: {
                    onContinue?()
                }) {
                    Text("Continuar")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.vertical, 14)
                        .frame(width: 248)
                        .background(Color(red: 0.11, green: 0.29, blue: 1))
                        .cornerRadius(12)
                }
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 16)
        }
        .background(Color(red: 0.04, green: 0.06, blue: 0.13))
    }
}

struct FeatureRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color(red: 0.11, green: 0.29, blue: 1))
                    .frame(width: 56, height: 56)
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .font(.system(size: 28))
            }
            
            Text(text)
                .foregroundStyle(.white)
                .font(.body)
                .bold()
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
