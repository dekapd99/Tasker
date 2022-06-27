//
//  TODOTextField.swift
//  Tasker
//
//  Created by Deka Primatio on 22/06/22.
//

import SwiftUI

// Berisikan UI Forms TODO User Field untuk Input Data Title TODO
struct TODOTextField: View {
    
    @Binding var text: String // Property Wrapper yang dapat Read / Write
    let placeholder: String // Placeholder Text
    
    var body: some View { // Body: UI Layout
        
        // Panggil CustomTextField
        CustomTextField(text: $text, placeholder: Text(placeholder), imageName: "checkmark.square", foregroundColor: .gray)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

struct TODOTextField_Previews: PreviewProvider {
    static var previews: some View {
        TODOTextField(text: .constant(""), placeholder: "Title")
    }
}
