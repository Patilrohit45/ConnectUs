//
//  OnboardingView.swift
//  ConnectUs
//
//  Created by Rohit Patil on 21/07/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isOnboardingComplete = false

    var body: some View {
        ZStack {
            Color("Pewter")
                .ignoresSafeArea()
            VStack {
                Spacer()
                LottieView(name: "Animation3", loopMode: .loop)
                    .frame(height:300)
                    .scaleEffect(0.5)
                    Spacer()
                Text("Welcome To the ConnectUS!")
                    //.font(.headline)
                    .font(.system(size: 30))
                Spacer()
        
                Button {
                    isOnboardingComplete = true
                } label: {
                    Text("Continue")
                        .frame(width: 150, height: 60)
                        .foregroundColor(Color.black)
                        .background(Color.yellow)
                        .clipShape(Capsule())
                }

                Spacer()
                Spacer()
                Spacer()
            }
            .fullScreenCover(isPresented: $isOnboardingComplete, content: {
                // Step 3: Show the LoginView after the onboarding is complete
                LogInView()
        })
        }
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
