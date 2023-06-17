//
//  SignUpView.swift
//  Code@Exp FoodSaver SG Firebase
//
//  Created by Ma Zhiyu on 17/6/23.
//

import SwiftUI

struct SignUpView: View {
        
    @Binding var currentShowingView: String
    @State private var email: String = ""
    @State private var password: String = ""
        
    private func isValidPassword(_ password: String) -> Bool {
            
            //min 6 characters
            // 1 uppercase character
            // 1 special character
            
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        return passwordRegex.evaluate(with: password)
    }
        
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Welcome to FoodSaverSG!")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Spacer()
                
                HStack{
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                        
                    Spacer()
                        
                        
                    if(email.count != 0) {
                        Image(systemName: email.isValidEmail() ? "checkmark" :"xmark")
                            .fontWeight(.bold)
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }
                    
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.black)
                )
                .padding()
                
                HStack{
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
                        
                    Spacer()
                        
                    if(password.count != 0) {
                        Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(isValidPassword(password) ? .green : .red)
                    }
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.black)
                )
                .padding()
                    
                if (password.count != 0 && isValidPassword(password) == false) {
                    Text("Please ensure that Password has the following: \n 6 charaters, 1 Uppercase, 1 Special Character.")
                        .multilineTextAlignment(.trailing)
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(10)
                }
                    
                Button(action: {
                    withAnimation {
                        self.currentShowingView = "login"
                    }
                })
                {
                Text("Already have an account? Log in!")
                    .foregroundColor(.black.opacity(0.7))
                    .multilineTextAlignment(.trailing)
                }

                Spacer()
                Spacer()
        
                Button {
                    
                } label: {
                    Text("Create Account")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                        )
                        .padding(.horizontal)
                }
            }
        }
    }
}

