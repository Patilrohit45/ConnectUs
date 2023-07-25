//
//  SearchBar.swift
//  ConnectUs
//
//  Created by Rohit Patil on 19/07/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var placeholder: String

    var body: some View {
        HStack {
            TextField(placeholder, text: $searchText)
                .padding(8)
                .background(Color.white)
                .cornerRadius(8)
            
            Button(action: {
                // Add action to handle the sidebar item (messages) here
                // For example, show messages view or perform any other action
            }) {
                Image(systemName: "message")
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal)
    }
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), placeholder: "Search")
    }
}
