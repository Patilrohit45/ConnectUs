//
//  File.swift
//  ConnectUs
//
//  Created by Rohit Patil on 20/07/23.
//

import Foundation
import SwiftUI
import Lottie

struct LottieView:UIViewRepresentable{
    let name : String
    let loopMode : LottieLoopMode

    func makeUIView(context: Context) -> LottieAnimationView {
        let  animationView = LottieAnimationView(name: name)
        animationView.loopMode = loopMode
        animationView.play()

        return animationView
        
    }
    
    func updateUIView(_ uiView: LottieAnimationView, context: Context) {
        
    }
    

    
}
