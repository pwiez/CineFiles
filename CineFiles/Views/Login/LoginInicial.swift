//
//  LoginView.swift
//  CineFiles
//
//  Created by Pedro Wiezel on 29/05/25.
//

import SwiftUI

struct LoginInicial: View {
    
    @State var isPresented : Bool = false
    var body: some View {
        VStack(alignment: .center) {
            
            Spacer()
            
            Image(.cineFilesEscuro)
                .resizable()
                .scaledToFit()
                .offset(y: isPresented ? -200 : 0)
                .frame(width: 300, height: 200)
            
            Spacer()
            
            VStack(spacing: 24) {
                Button(action: {
                    withAnimation {
                        isPresented = true
                    }
                }) {
                    Text("Fazer login")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .foregroundStyle(.black)
                }
                
                Button(action: { }) {
                    Text("Criar uma conta")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .foregroundStyle(.white)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.11, green: 0.29, blue: 1), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.56)
            )
        )
        .sheet(isPresented: $isPresented) {
            //Spacer().frame(height: 5)
            SignInModal()
                .presentationDetents([.fraction(0.65)])
        }
    }
}

#Preview {
    LoginInicial()
}
