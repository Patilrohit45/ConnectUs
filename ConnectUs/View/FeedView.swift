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
            
            Text("Feed View")
                .font(.title)
                .bold()
                .foregroundColor(Color.black)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
