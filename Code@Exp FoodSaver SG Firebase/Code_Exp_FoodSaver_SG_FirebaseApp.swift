//
//  Code_Exp_FoodSaver_SG_FirebaseApp.swift
//  Code@Exp FoodSaver SG Firebase
//
//  Created by Ma Zhiyu on 17/6/23.
//

import SwiftUI
import FirebaseCore

@main
struct Code_Exp_FoodSaver_SG_FirebaseApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
