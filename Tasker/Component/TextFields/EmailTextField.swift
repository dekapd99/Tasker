//
//  EmailTextField.swift
//  Tasker
//
//  Created by Deka Primatio on 16/06/22.
//

import SwiftUI

// Berisikan UI Forms Email Text Field
struct EmailTextField: View {
    
    @Binding var text: String // Property Wrapper yang dapat Read / Write
    
    var body: some View { // Body: UI Layout
        
        // Panggil CustomTextField
        CustomTextField(text: $text, placeholder: Text("Email"), imageName: "envelope")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
        
    }
}

struct EmailTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            EmailTextField(text: .constant("Email"))
        }
    }
}
