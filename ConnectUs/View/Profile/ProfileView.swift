//
//  ProfileView.swift
//  ConnectUs
//
//  Created by Rohit Patil on 10/07/23.
//

import SwiftUI
import UIKit

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State private var isEditable = false
    @State private var text = "This is a non-editable section"
    @State private var name = ""
    @State private var job = ""
    @State private var companyName = ""
    @State private var location = ""
    @State private var connectionCount = "500+ Connections"
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 40) {
                        ProfilePicture()
                            .ignoresSafeArea(.all)
                      
                        VStack{
                            actionButtons
                            
                            userInfoDetails
            
                        }.padding()
                   
                   
                        ExperienceView().padding(.top,-80)
                            .padding(.leading,80)
                    
        
                        
                        Spacer()
                        
                        Spacer()
                }
            }.ignoresSafeArea(.all, edges: .top)
     
            
        }
    }
  







    struct EditView: View {
        @Binding var isEditMode: Bool
        @Binding var name: String
        @Binding var job: String
        @Binding var companyName: String
        @Binding var location: String

        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("Edit Intro")) {
                        TextField("Name", text: $name)
                        TextField("Job", text: $job)
                        TextField("Company Name", text: $companyName)
                        TextField("Location", text: $location)
                    }
                }
                .navigationBarTitle("Edit Profile", displayMode: .inline)
                .navigationBarItems(
                    leading: Button("Cancel") {
                        isEditMode = false
                    },
                    trailing: Button("Save") {
                        isEditMode = false
                    }
                )
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
     
    }
}

extension ProfileView {
    var actionButtons: some View {
        HStack {
            Spacer()
            Button {
                isEditable = true
            } label: {
                Image(systemName: "pencil")
                    .font(.title)
                    .padding(6)
                    .foregroundColor(.gray)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            }
            .frame(width: 50, height: 50)
            .padding(.trailing, 100)
            .offset(y: -45)
            .sheet(isPresented: $isEditable) {
                EditView(isEditMode: $isEditable, name: $name, job: $job, companyName: $companyName, location: $location)
            }
        }
    }

    var userInfoDetails: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(name.isEmpty ? "Rohit Patil" : name)
                        .font(.title2).bold()
                        .foregroundColor(Color.white)
    
                }
                Text(job.isEmpty ? "Associate Software Engineer | iOS" : job)
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                
                Text(companyName.isEmpty ? "Webonise":companyName)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                
                HStack(spacing: 24) {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Pune, INDIA")
                    }
                    HStack {
                        Image(systemName: "link")
                        Text("500+ connections")
                    }
                    .foregroundColor(.blue)
                }
                .font(.caption)
                .foregroundColor(.gray)
            }
            
            Spacer(minLength: 0) // Add Spacer with minLength to align to the leading side without getting cut off
    
        }
        .padding(.horizontal, 85) // Add horizontal padding for spacing
        .offset(y: -45)
    }
}
