//
//  AnimatedIllustrationView.swift
//  ConnectUs
//
//  Created by Rohit Patil on 20/07/23.
//
import SwiftUI
import Lottie

struct AnimatedIllustrationView: UIViewRepresentable {
    let animationView = AnimationView()
    let animationName: String

    func makeUIView(context: Context) -> UIView {
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animation = LottieAnimationView(name: animationName, bundle: Bundle.main)
        animationView.play()
        return animationView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Update the view if needed
    }
}

struct AnimatedIllustrationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedIllustrationView(animationName: "your_animation_file_name")
    }
}








