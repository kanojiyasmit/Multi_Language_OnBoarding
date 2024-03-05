//
//  OnBoardingView.swift
//  TaskWan
//
//  Created by Smit Kanojiya on 03/03/24.
//

import SwiftUI

struct OnBoardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    var body: some View {
        ZStack {
            HStack {
                CustomTabIndicator(pageCount: viewModel.onboardingPages.count, currentIndex: viewModel.currentPageIndex)
                Spacer()
                Text("skip")
                    .font(.textXsMedium)
                    .foregroundColor(.brandColor)
                    .onTapGesture {
                        viewModel.skipOnboarding()
                    }
            }
            .frame(maxWidth: .infinity, maxHeight : .infinity,alignment : .top)
            .padding(.horizontal,15)
            TabView(selection: $viewModel.currentPageIndex) {
                ForEach(viewModel.onboardingPages.indices, id: \.self) { index in
                    OnboardingPageView(page: viewModel.onboardingPages[index])
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Button(action: {
                viewModel.isLastPage ? print("Get Started Tapped") : viewModel.goToNextPage()
            }, label: {
                Text(viewModel.isLastPage ? "Get Started" : "Next")
                    .font(.textSmReguler)
                    .foregroundColor(Color(white: 1.0))
                    .frame(maxWidth: .infinity, maxHeight: 50)
            })
            .background(Color.brandColor)
            .cornerRadius(10.0)
            .shadow(color: Color.brandColor.opacity(0.1), radius: 6.0, x: 1.0, y: 2.0)
            .frame(maxHeight: .infinity,alignment: .bottom)
            .padding(.horizontal,15)
        }
    }
}

// MARK: - OnboardingPageView
struct OnboardingPageView: View {
    let page: OnboardingItem
    
    var body: some View {
        ZStack {
            VStack(spacing: 25) {
                Image(page.imageName)
                Text(page.title)
                    .font(.textBaseMedium)
                    .foregroundColor(.headerColor)
                    .frame(height: 25)
                Text(page.description)
                    .font(.textSmReguler)
                    .foregroundColor(.textColor)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,35)
            }
        }
    }
}

// MARK: - CustomTabIndicator
struct CustomTabIndicator: View {
    let pageCount: Int // Total number of onboarding pages
    let currentIndex: Int // Current selected page
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(Array(0..<pageCount), id: \.self) { index in
                Capsule()
                    .fill(Color.brandColor.opacity(index == currentIndex ? 1.0 : 0.1))
                    .frame(width: 10, height: 10)
                
            }
        }
    }
}
#Preview {
    OnBoardingView(viewModel: OnboardingViewModel())
}
