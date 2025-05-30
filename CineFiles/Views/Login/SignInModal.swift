//
//  SignInModal.swift
//  SwiftUI-Challenge-Aula05
//
//  Created by Gustavo Munhoz Correa on 22/05/25.
//

import SwiftUI

struct SignInModal: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showIncorrectPassword = false
    
    private var canConfirmSignIn: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Welcome to CineFilés!")
                .font(.title)
                .fontWeight(.bold)
            
            Form {
                Section {
                    TextField(
                        "",
                        text: $email,
                        prompt: Text("Enter your email")
                            .foregroundStyle(.customTertiaryLabel)
                    )
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.miscellaneous, lineWidth: 1)
                        }
                        .textContentType(.emailAddress)
                    
                } header: {
                    Text("E-mail")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                    .frame(height: 24)
                
                Section {
                    VStack {
                        SecureField(
                            "",
                            text: $password,
                            prompt: Text("Enter your password")
                                .foregroundStyle(.customTertiaryLabel)
                        )
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(
                                    showIncorrectPassword ? .red : .miscellaneous,
                                    lineWidth: 1
                                )
                        }
                        .textContentType(.password)
                        
                        if showIncorrectPassword {
                            HStack {
                                Image(systemName: "exclamationmark.triangle")
                                Text("Senha incorreta. Por favor, tente novamente.")
                            }
                            .font(.footnote)
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                } header: {
                    HStack {
                        Text("Password")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                }
            }
            .formStyle(.columns)
            
            Button(action: {
                withAnimation {
                    showIncorrectPassword = true
                }
            }) {
                Text("Sign in")
                    .frame(maxWidth: .infinity, idealHeight: 50, maxHeight: 50)
                    .foregroundStyle(
                        canConfirmSignIn ? .white : .customTertiaryLabel
                    )
                    .background(
                        canConfirmSignIn ? .buttonPurple : .tertiaryFill
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .disabled(!canConfirmSignIn)
            
            Button(action: {
                // Não faz nada
            }) {
                HStack {
                    Image(systemName: "apple.logo")
                    Text("Sign in with Apple")
                        
                }
                .frame(maxWidth: .infinity, idealHeight: 50, maxHeight: 50)
                .foregroundStyle(.white)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            Text(
                try! AttributedString(markdown: "Don't have an account? [Sign up!](https://www.youtube.com/watch?v=dQw4w9WgXcQ)")
            )
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
    }
}

#Preview {
    SignInModal()
}
