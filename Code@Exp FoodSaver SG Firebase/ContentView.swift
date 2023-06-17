//
//  ContentView.swift
//  Code@Exp FoodSaver SG Firebase
//
//  Created by Ma Zhiyu on 17/6/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        
        if userID == "" {
            AuthView()
        } else {
            Text("Logged In \n Your user id is \(userID).")
            
            Button(action: {
                let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                    withAnimation {
                        userID = ""
                    }
                } catch let signOutError as NSError {
                  print("Error signing out: %@", signOutError)
                }
            }) {
                Text("Sign Out")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
