//
//  ProfilePicture.swift
//  ConnectUs
//
//  Created by Rohit Patil on 13/07/23.
//

import SwiftUI

struct ProfilePicture: View {
    @State private var showCoverImagePicker = false
    @State private var showProfileImagePicker = false
    @State private var selectedCoverImage: UIImage?
    @State private var selectedProfileImage: UIImage?
    @State private var showSettings = false
    
    var body: some View {
        ZStack {
            Button(action: {
                showCoverImagePicker = true
            }) {
                if let coverImage = selectedCoverImage {
                    Image(uiImage: coverImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 500, height: 175)
                        .cornerRadius(10)
                } else {
                    Image("Texture1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 550, height: 150)
                }
            }
            .sheet(isPresented: $showCoverImagePicker) {
                ImagePicker(image: $selectedCoverImage, isPresented: $showCoverImagePicker)
            }
            Button(action: {
                        print("tapped")
                           showSettings = true
                       }) {
                           Image(systemName: "gearshape.fill")
                                        .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .frame(width: 20, height: 20)
                                       .foregroundColor(.white)
                                       .padding()
                                       .background(Color.gray.opacity(0.6))
                                       .clipShape(Circle())

                       }.offset(x:145)
                       .sheet(isPresented: $showSettings) {
                           SettingView()
                       }
            
            Button(action: {
                showProfileImagePicker = true
            }) {
                if let profileImage = selectedProfileImage {
                    ZStack {
                        Image(uiImage: profileImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: "camera")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                            )
                            .offset(x: 30, y: 30)
                    }
                } else {
                    ZStack {
                        Image("Default")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        
                        Circle()
                            .fill(Color.gray.opacity(0.8))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: "camera")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                            )
                            .offset(x: 30, y: 30)
                    }
                }
            }
            .offset(x: -120, y: 80)
            .sheet(isPresented: $showProfileImagePicker) {
                ImagePicker(image: $selectedProfileImage, isPresented: $showProfileImagePicker)
            }
            
            Spacer()
        }

    }
}


struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture()
    }
}
