//
//  PostView.swift
//  ConnectUs
//
//  Created by Rohit Patil on 10/07/23.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        ZStack {
            Color("Pewter")
                .ignoresSafeArea(.all)
            
            Text("Post View")
                .font(.title)
                .bold()
                .foregroundColor(Color.black)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
