//
//  UserTextField.swift
//  Tasker
//
//  Created by Deka Primatio on 18/06/22.
//

import SwiftUI

struct UserTextField: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        CustomTextField(text: $text, placeholder: Text(placeholder), imageName: "person")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct UserTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            UserTextField(text: .constant(""), placeholder: "User")
        }
    }
}
