//
//  SignUpViewViewModel.swift
//  ConnectUs
//
//  Created by Rohit Patil on 10/07/23.
//


import Foundation
import FirebaseFirestore
import FirebaseAuth

class SignUpViewModel:ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init(){}
    
    func register(){
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            print("User Created...")
            
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    
    private func insertUserRecord(id:String){
        let newUser = User(id: id, name: name, email: email)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool{
            guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
                  !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                      print("Validation failed")
                      return false
                  }
        
        guard email.contains("@") && email.contains(".") else {
            print("Email Validation failed")
            return false
        }
        
        guard password.count >= 6 else {
            print("Password Validation failed")
            return false
        }
        
        return true
    }
    
}

