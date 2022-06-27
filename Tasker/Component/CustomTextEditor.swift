//
//  CustomTextEditor.swift
//  Tasker
//
//  Created by Deka Primatio on 22/06/22.
//

import SwiftUI

// Berisikan UI Forms TODO Descriptions
struct CustomTextEditor: View {
    
    @Binding var text: String // Property Wrapper yang dapat Read / Write
    let placeholder: Text // Placeholder Text
    let imageName: String // Placeholder Custom Image System (Icon)
    var foregroundColor: Color? // Placeholder foregroundColor
    
    @Environment(\.colorScheme) var colorScheme
    
    init(text: Binding<String>, placeholder: Text, imageName: String, foregroundColor: Color?) {
        self._text = text
        self.placeholder = placeholder
        self.imageName = imageName
        if let safeForegroundColor = foregroundColor {
            self.foregroundColor = safeForegroundColor
        }
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View { // Body: UI Layout
        
        ZStack(alignment: .leading) {
            VStack {
                HStack {
                    if text.isEmpty {
                        placeholder
                            .foregroundColor(foregroundColor ?? Color(.init(white: 1, alpha: 0.8)))
                            .padding(.leading, 60)
                    }
                    Spacer()
                }
                .padding([.vertical], 10)
                Spacer()
            }
            
            HStack {
                VStack {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(foregroundColor ?? Color(.white))
                        .padding([.vertical], 10)
                        .padding(.leading, 15)
                    Spacer()
                }
                
                TextEditor(text: $text)
                    .autocapitalization(.none)
            }
            
        }
        .frame(height: 120)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .foregroundColor(colorScheme == .dark ? .white : .black)
    }
}

struct CustomTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            CustomTextEditor(text: .constant(""), placeholder: Text("Description"), imageName: "line.3.horizontal", foregroundColor: .gray)
        }
    }
}
