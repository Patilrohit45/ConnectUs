//
//  ConnectionView.swift
//  ConnectUs
//
//  Created by Rohit Patil on 10/07/23.
//

import SwiftUI

struct ConnectionView: View {
    var body: some View {
        ZStack {
            Color("Seashell")
                .ignoresSafeArea(.all)
            
            Text("Connection View")
                .font(.title)
                .bold()
                .foregroundColor(Color.black)
        }
    }
}

struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView()
    }
}
