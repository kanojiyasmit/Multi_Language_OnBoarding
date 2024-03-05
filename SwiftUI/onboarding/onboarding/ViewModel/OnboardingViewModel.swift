//
//  OnboardingViewModel.swift
//  TaskWan
//
//  Created by Smit Kanojiya on 03/03/24.
//

import Combine
import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var onboardingPages: [OnboardingItem] = [
        OnboardingItem(imageName: "OnBoarding1",
                       title: "Easy Time Management",
                       description: "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first"),
        OnboardingItem(imageName: "OnBoarding2",
                       title: "Increase Work Effectiveness",
                       description: "Time management and the determination of more important tasks will give your job statistics better and always improve"),
        OnboardingItem(imageName: "OnBoarding3",
                       title: "Reminder Notification",
                       description: "The advantage of this application is that it also provides reminders for you so you don't forget to keep doing your assignments well and according to the time you have set"),
    ]
    @Published var currentPageIndex: Int = 0
    var isLastPage: Bool {
        return currentPageIndex == onboardingPages.count - 1
    }
    func goToNextPage() {
        if currentPageIndex < onboardingPages.count - 1 {
            withAnimation {
                currentPageIndex += 1
            }
        }
    }
    func skipOnboarding() {
        currentPageIndex = onboardingPages.count - 1
    }
}
