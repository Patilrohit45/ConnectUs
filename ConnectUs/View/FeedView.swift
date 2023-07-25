//
//  FeedView.swift
//  ConnectUs
//
//  Created by Rohit Patil on 10/07/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack {
            Color("HotPink")
                .ignoresSafeArea(.all)
            
            VStack{
                Text("Feed View")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.black)
                
      
                LottieView(name: "Animation", loopMode: .loop)
                    .scaleEffect(0.2) // Apply additional frame modifiers if necessary
                    .frame(height:300)
                Spacer()
            }
                
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
