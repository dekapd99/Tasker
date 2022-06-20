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
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationView {
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
                        viewModel.login(withEmail: email, password: password)
                        
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
                                    .font(.system(size: 15))
                                Text("Sign Up")
                                    .font(.system(size: 15, weight: .semibold))
                            } // Batas HStack
                            .foregroundColor(.white)
                        }
                    )
                    .padding()
                    
                } // Batas VStack 0
                .padding(.top, -44)
            }// Batas ZStack
        } // Batas NavigationView
    } // Batas Body
} // Batas Struct

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
