//
//  AuthView.swift
//  Code@Exp FoodSaver SG Firebase
//
//  Created by Ma Zhiyu on 17/6/23.
//

import SwiftUI

struct AuthView: View {
    
    @State private var currentViewShowing: String = "signup"
    
    var body: some View {
        
        if(currentViewShowing == "signup") {
            SignUpView(currentShowingView: $currentViewShowing)
        } else if (currentViewShowing == "login") {
            LogInView(currentShowingView: $currentViewShowing)
        }
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
