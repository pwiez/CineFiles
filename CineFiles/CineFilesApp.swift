//
//  CineFilesApp.swift
//  CineFiles
//
//  Created by Pedro Wiezel on 28/05/25.
//

import SwiftUI

@main
struct CineFilesApp: App {
    init() {
            let appearance = UITabBarAppearance()
            //appearance.configureWithTransparentBackground()
            appearance.backgroundColor = .black
            appearance.shadowImage = nil
            appearance.shadowColor = .clear

            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
