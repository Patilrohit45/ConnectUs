//
//  ProfileView.swift
//  ConnectUs
//
//  Created by Rohit Patil on 10/07/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        ZStack {
            Color("Mint")
                .ignoresSafeArea(.all)
            
            Text("Profile View")
                .font(.title)
                .bold()
                .foregroundColor(Color.black)
            
            Button {
                viewModel.logOut()
            } label: {
                Text("Sign Out")
                    .font(.title)
                    .frame(width:50,height: 50)
                    .foregroundColor(Color("HotPink"))
                    .clipShape(Capsule())
            }

        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
