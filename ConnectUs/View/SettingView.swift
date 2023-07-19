//
//  SettingView.swift
//  ConnectUs
//
//  Created by Rohit Patil on 13/07/23.
//

import SwiftUI

struct SettingView: View {
    @StateObject var viewModel = SetttingViewModel()
    var body: some View {
        VStack {
            Spacer()
            Form {
                Section(header: Text("General")) {
                    Text("Settings 1")
                    Text("Settings 2")
                    Text("Settings 3")
                }
                
                Section(header: Text("Notifications")) {
                    Text("Settings 4")
                    Text("Settings 5")
                    Text("Settings 6")
                }
                
                Section(header: Text("Privacy")) {
                    Text("Settings 7")
                    Text("Settings 8")
                    Text("Settings 9")
                }
                
                Button {
                    viewModel.logOut()
                } label: {
                    Text("Sign Out")
                }
            }
            .background(Color.gray)
            .cornerRadius(10)
            .padding()
            
            Spacer()
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

