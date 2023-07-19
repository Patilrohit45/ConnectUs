//
//  SettingViewModel.swift
//  ConnectUs
//
//  Created by Rohit Patil on 13/07/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class SetttingViewModel:ObservableObject{
    init () {}
    
    func logOut(){
        do {
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }

}
