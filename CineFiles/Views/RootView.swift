//
//  AppStep.swift
//  CineFiles
//
//  Created by Pedro Wiezel on 31/05/25.
//

import SwiftUI

enum AppStep {
    case onboarding
    case login
    case home
}

struct RootView: View {
    @State private var step: AppStep = .onboarding

    var body: some View {
        switch step {
        case .onboarding:
            OnboardingView {
                step = .login
            }
        case .login:
            LoginView {
                step = .home
            }
        case .home:
            TabBarHomeView()
        }
    }
}

#Preview {
    RootView()
}
