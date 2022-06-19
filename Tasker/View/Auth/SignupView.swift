//
//  SignupView.swift
//  Tasker
//
//  Created by Deka Primatio on 16/06/22.
//

import SwiftUI

struct SignupView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @Environment(\.presentationMode) var mode // Environment Variable
    
    var body: some View {
        
        ZStack {
            
            BackgroundGradientView()
            
            VStack{
                LogoView()
                
                VStack(spacing: 20) {
                    
                    UserTextField(text: $firstName, placeholder: "First Name")
                    UserTextField(text: $lastName, placeholder: "Last Name")
                    EmailTextField(text: $email)
                    PasswordSecureField(text: $password, placeholder: "Password")
                    PasswordSecureField(text: $confirmPassword, placeholder: "Confirm Password")
                    
                } // Batas VStack 1
                .padding(.horizontal, 20)
                
                Button {
                    // TODO: Sign Up Action
                } label: {
                    AuthenticateButtonView(text: "Sign Up")
                        .padding()
                }
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 15))
                        Text("Sign In")
                            .font(.system(size: 15, weight: .semibold))
                    }
                    .foregroundColor(.white)
                }
                .padding(.bottom, 16)
            } // Batas VStack 0
            .padding(.top, 20)
        } // Batas ZStack
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
