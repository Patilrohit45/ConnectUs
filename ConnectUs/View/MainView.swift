//
//  MainView.swift
//  ConnectUs
//
//  Created by Rohit Patil on 10/07/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    // Content views
                    switch selectedTab {
                    case 0:
                        FeedView()
                    case 1:
                        ConnectionView()
                    case 2:
                        PostView()
                    case 3:
                        NotificationsView()
                    case 4:
                        ProfileView()
                    default:
                        EmptyView()
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                
                // Floating tab bar
                FloatingTabBar(selectedTab: $selectedTab)
            }
        } else {
            LogInView()
        }
    }
}

struct FloatingTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<5) { index in
                Button(action: {
                    withAnimation {
                        selectedTab = index
                    }
                }) {
                    Image(systemName: tabImageName(index: index))
                        .foregroundColor(selectedTab == index ? .blue : .gray)
                        .frame(width: 60, height: 60)
                }
            }
        }
        .background(
            Capsule()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
        )
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
      
    }
    
    private func tabImageName(index: Int) -> String {
        switch index {
        case 0:
            return "house"
        case 1:
            return "person.2"
        case 2:
            return "plus.circle"
        case 3:
            return "bell"
        case 4:
            return "person.crop.circle"
        default:
            return ""
        }
    }
    
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
