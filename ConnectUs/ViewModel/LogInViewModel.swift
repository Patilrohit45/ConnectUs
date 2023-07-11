//
//  LogInViewViewModel.swift
//  ConnectUs
//
//  Created by Rohit Patil on 10/07/23.
//

import Foundation
import FirebaseAuth
import CoreMedia

class LogInViewModel:ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
        guard validate() else {
            return
        }
        //Login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                  
                  errorMessage = "Please fill in all fields"
                  return false
              }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            
            return false
        }
        return true
    }
    
    
}
