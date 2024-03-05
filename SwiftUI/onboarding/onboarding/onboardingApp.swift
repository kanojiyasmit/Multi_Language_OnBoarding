//
//  onboardingApp.swift
//  onboarding
//
//  Created by Smit Kanojiya on 05/03/24.
//

import SwiftUI

@main
struct onboardingApp: App {
    var body: some Scene {
        WindowGroup {
            OnBoardingView(viewModel: OnboardingViewModel())
        }
    }
}
