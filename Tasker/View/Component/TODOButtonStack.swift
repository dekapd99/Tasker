//
//  TODOButtonStack.swift
//  Tasker
//
//  Created by Deka Primatio on 22/06/22.
//

import SwiftUI

struct TODOButtonStack: View {
    
    @ObservedObject var viewModel: TODOViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TODOButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        TODOButtonStack(viewModel: TODOViewModel())
    }
}

struct TODOButton: View {
    let buttonType: SelectedButton
    @ObservedObject var viewModel: TODOViewModel
    
    var body: some View {
        Button {
            
        } label: {
            Text("\(buttonType.getValue())")
        }

    }
    
}
