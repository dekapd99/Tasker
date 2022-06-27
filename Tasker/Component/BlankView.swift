//
//  BlankView.swift
//  Tasker
//
//  Created by Deka Primatio on 22/06/22.
//

import SwiftUI

// Berisikan Tampilan UI Blank ketika TODO List Kosong
struct BlankView: View {
    var body: some View { // Body: UI Layout
        
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.black)
        .opacity(0.5)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            
        }
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}
