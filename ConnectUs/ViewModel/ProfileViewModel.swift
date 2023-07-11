//
//  ProfileViewModel.swift
//  ConnectUs
//
//  Created by Rohit Patil on 11/07/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ProfileViewModel:ObservableObject{
    init () {}
    
    func logOut(){
        do {
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }

}
