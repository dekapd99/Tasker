//
//  CustomTextField.swift
//  Tasker
//
//  Created by Deka Primatio on 16/06/22.
//

import SwiftUI

// Berisikan Custom Text Field untuk Input Segala Jenis Forms
struct CustomTextField: View {
    
    @Binding var text: String // Property Wrapper yang dapat Read / Write
    let placeholder: Text // Placeholder Text
    let imageName: String // Placeholder Custom Image System (Icon)
    var foregroundColor: Color? // Placeholder foregroundColor
    
    var body: some View { // Body: UI Layout

        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(foregroundColor ?? Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(foregroundColor ?? .white)
                
                TextField("", text: $text)
                    .autocapitalization(.none)
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            CustomTextField(text: .constant(""), placeholder: Text("Email"), imageName: "envelope")
        }
    }
}
