import SwiftUI

struct LoginView: View {
    var onLoginSuccess: (() -> Void)? = nil
    
    @State private var email = ""
    @State private var password = ""
    @State private var showError = false
    @State private var navigateToHome = false
    
    private let dummyEmail = "1@a.com"
    private let dummyPassword = "1"
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack(spacing: 32) {
                    Spacer()
                    Image(.cineFilesEscuro)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                    Spacer()
                    VStack(spacing: 16) {
                        TextField("E-mail", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(8)
                        
                        SecureField("Senha", text: $password)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(8)
                        
                        if showError {
                            HStack {
                                Image(systemName: "exclamationmark.triangle")
                                Text("E-mail ou senha incorretos.")
                            }
                            .foregroundColor(.red)
                            .font(.footnote)
                        }
                        
                        Button("Entrar") {
                            if email == dummyEmail && password == dummyPassword {
                                onLoginSuccess?()
                            } else {
                                withAnimation { showError = true }
                            }
                        }
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .disabled(email.isEmpty || password.isEmpty)
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .padding()
                .background(
                    LinearGradient(
                        stops: [
                            .init(color: Color(red: 0.11, green: 0.29, blue: 1), location: 0),
                            .init(color: Color(red: 0.04, green: 0.06, blue: 0.13), location: 1),
                        ],
                        startPoint: .top,
                        endPoint: .init(x: 0.5, y: 0.56)
                    )
                )
            }
            if navigateToHome {
                TabBarHomeView()
                    .transition(.move(edge: .trailing))
                    .zIndex(1)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: navigateToHome)
    }
}
