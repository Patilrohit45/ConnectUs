//
//  NotificationsView.swift
//  ConnectUs
//
//  Created by Rohit Patil on 10/07/23.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ZStack {
            Color("gray")
                .ignoresSafeArea(.all)
            
            Text("Notifications View")
                .font(.title)
                .bold()
                .foregroundColor(Color.black)
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
