//
//  SignUpView.swift
//  ConnectUs
//
//  Created by Rohit Patil on 09/07/23.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    @State private var isLoggingIn = false
    
    var body: some View {
        NavigationView{
            ZStack(alignment:.top){
                Color("Cream")
                    .ignoresSafeArea(.all)
                
                VStack(spacing:20){
                    Image("connectus")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                        .padding(.top, 10)
                        .scaleEffect(isLoggingIn ? 0.8 : 1.0)
                        .animation(.easeInOut)
                    
                    Group {
                    Text("Join ")
                        .bold()
                        .font(.title) +
                        Text("ConnectUs ")
                            .bold()
                            .font(.title)
                            .foregroundColor(isLoggingIn ? .black : Color("Mint"))
                        +
                        Text("and embark on a journey!")
                            .font(.title)
                            .bold()
                    
                    }
                    .opacity(isLoggingIn ? 0.0 : 1.0)
                    .animation(.easeInOut)
                    
                    TextField("Name", text: $viewModel.name)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 4)
                        .opacity(isLoggingIn ? 0.0 : 1.0)
                        .animation(.easeInOut)
                    
                    TextField("Email", text: $viewModel.email)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 4)
                        .opacity(isLoggingIn ? 0.0 : 1.0)
                        .animation(.easeInOut)
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 4)
                        .opacity(isLoggingIn ? 0.0 : 1.0)
                        .animation(.easeInOut)
                    Spacer()
                    Button(action: {
                        withAnimation {
                            // Perform login action
                            //isLoggingIn.toggle()
                            viewModel.register()
                        }
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("HotPink"))
                            .cornerRadius(8)
                    }
                    .opacity(isLoggingIn ? 0.0 : 1.0)
                    .animation(.easeInOut)
                    
    
                    Spacer()
                        .padding(.bottom,220)
                }
                .padding(.horizontal,25)
                
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

