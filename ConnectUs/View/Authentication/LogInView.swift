//
//  LogInView.swift
//  ConnectUs
//
//  Created by Rohit Patil on 09/07/23.
//

import SwiftUI

struct LogInView: View {
    @State private var isLoggingIn = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Ivory")
                    .ignoresSafeArea(.all)
                
                VStack(spacing: 20) {
                    Image("connectus")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 120, height: 120)
                        .padding(.top, 10)
                        .scaleEffect(isLoggingIn ? 0.8 : 1.0)
                        .animation(.easeInOut)
                    
            
                    Group {
                            Text("Unlock your professional potential with ")
                                .bold()
                                .font(.title)
                            +
                            Text("ConnectUs!")
                                .font(.title)
                                .bold()
                                .foregroundColor(isLoggingIn ? .black : Color("TiffanyBlue"))
                        }
                        .opacity(isLoggingIn ? 0.0 : 1.0)
                        .animation(.easeInOut)
                    
                    
                    TextField("Username", text: .constant(""))
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 4)
                        .opacity(isLoggingIn ? 0.0 : 1.0)
                        .animation(.easeInOut)
                    
                    SecureField("Password", text: .constant(""))
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 4)
                        .opacity(isLoggingIn ? 0.0 : 1.0)
                        .animation(.easeInOut)
                    
                    Button(action: {
                        withAnimation {
                            // Perform login action
                            isLoggingIn.toggle()
                        }
                    }) {
                        Text("Log In")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("HotPink"))
                            .cornerRadius(8)
                    }
                    .opacity(isLoggingIn ? 0.0 : 1.0)
                    .animation(.easeInOut)
                    
                    Spacer()

                    NavigationLink(destination: SignUpView()) {
                        Text("Don't have an account? Sign Up")
                            .foregroundColor(.black)
                            .underline()
                    }
                    .opacity(isLoggingIn ? 0.0 : 1.0)
                    .animation(.easeInOut)
                    
                    Spacer()
                        .padding(.bottom,150)
                }
                .padding(.horizontal, 25)
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
