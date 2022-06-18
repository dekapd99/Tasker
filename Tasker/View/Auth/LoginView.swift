//
//  LoginView.swift
//  Tasker
//
//  Created by Deka Primatio on 16/06/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        ZStack {
            BackgroundGradientView()
            
            VStack {
                LogoView()
                    .padding(.bottom, 25)
                
                VStack(spacing: 20) {
                    EmailTextField(text: $email)
                    PasswordSecureField(text: $password, placeholder: "Password")
                } // Batas VStack 1
                .padding(.horizontal, 20)
                
                HStack {
                    Spacer()
                    
                    Button {
                        // TODO: Forgot Password Action
                    } label: {
                        Text("Forgot Password ?")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                            .padding([.top, .trailing], 20)
                    }
                } // Batas HStack

                Button {
                    // TODO: Sign In Action
                    
                } label: {
                    AuthenticateButtonView(text: "Sign In")
                        .padding(.top)
                }
                
                NavigationLink(
                    destination: SignupView()
                        .navigationBarHidden(true),
                    label: {
                        HStack {
                            Text("Don't have an account ?")
                            Text("Sign Up")
                                .font(.system(size: 15, weight: .bold))
                        } // Batas HStack
                        .foregroundColor(.white)
                    }
                )
                .padding()
                
            } // Batas VStack 0
            .padding(.top, -44)
        } // Batas ZStack
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
