//
//  HomeView.swift
//  CineFiles
//
//  Created by Pedro Wiezel on 30/05/25.
//

import SwiftUI

struct TabBarHomeView: View {
    var body: some View {
        
        ZStack {
            TabView {
                NavigationStack {
                    HomeView()
                }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                
                NavigationStack {
                    BuscarView()
                }
                .tabItem {
                    Label("Buscar", systemImage: "magnifyingglass")
                }
                
                NavigationStack {
                    PerfilView()
                }
                .tabItem {
                    Label("Perfil", systemImage: "person.fill")
                }
            }
            .accentColor(.white)
        }
    }
}

#Preview {
    TabBarHomeView()
}
