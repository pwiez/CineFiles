//
//  ContentView.swift
//  Cinefiles
//
//  Created by Débora Costa on 30/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 393, height: 852)
              .background(
                LinearGradient(
                  stops: [
                    Gradient.Stop(color: Color(red: 0.11, green: 0.29, blue: 1).opacity(0), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.02, green: 0.08, blue: 0.34), location: 1.00),
                  ],
                  startPoint: UnitPoint(x: 0.5, y: 0),
                  endPoint: UnitPoint(x: 0.5, y: 1)
                )
              )
            
            Image("Onboarding_background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .center, spacing: 92) {
                //Logo
                Image("cineFiles_claro")
                       .frame(width: 246.75, height: 161.25)
                //
                VStack(alignment: .leading, spacing: 62) {
                    
                    //Frase 1
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color(red: 0.11, green: 0.29, blue: 1))
                                .frame(width: 56, height: 56)
                            Image(systemName: "movieclapper.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 28))
                        }
                        Text("Explore os filmes escolhidos pela mentoria. Qual filme será que a Naomi escolheu?")
                            .foregroundStyle(.white)
                            .font(.body)
                            .bold()
                    }
                    //Frase 2
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color(red: 0.11, green: 0.29, blue: 1))
                                .frame(width: 56, height: 56)
                            Image(systemName: "binoculars.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 28))
                        }
                        Text("Não achou o filme? Use a nossa barra de pesquisa!")
                            .foregroundStyle(.white)
                            .font(.body)
                            .bold()
                    }
                    //Frase 3
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color(red: 0.11, green: 0.29, blue: 1))
                                .frame(width: 56, height: 56)
                            Image(systemName: "person.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 28))
                        }
                        Text("Torne-se uma pessoa mais culta, salve, chame os amigos e assista os filmes selecionados!")
                            .foregroundStyle(.white)
                            .font(.body)
                            .bold()
                            
                    }
                     .padding(.vertical, 6)
                    
                } .padding(.horizontal, 30)
                
                //Botão
                Button {
                    
                } label: {
                    Text("Continuar")
                        .foregroundStyle(.white)
                    
                }.labelStyle(.titleOnly)
                    .padding(.vertical, 14)
                    .frame(width: 248, alignment: .center)
                    .background(Color(red: 0.11, green: 0.29, blue: 1))
                    .cornerRadius(12)
            }
            .padding(.horizontal, 16)
        }
        
        .frame(width: 450, height: 852)
        .background(Color(red: 0.04, green: 0.06, blue: 0.13))
    }
}

#Preview {
    ContentView()
}
