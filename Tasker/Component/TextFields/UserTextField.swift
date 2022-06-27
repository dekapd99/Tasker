//
//  UserTextField.swift
//  Tasker
//
//  Created by Deka Primatio on 18/06/22.
//

import SwiftUI

// Berisikan UI Forms User Text Field untuk Input Data Pribadi User
struct UserTextField: View {
    
    @Binding var text: String // Property Wrapper yang dapat Read / Write
    let placeholder: String // Placeholder Text
    
    var body: some View { // Body: UI Layout
        
        // Panggil CustomTextField
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
