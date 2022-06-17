//
//  BackgroundGradientView.swift
//  Tasker
//
//  Created by Deka Primatio on 16/06/22.
//

import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .ignoresSafeArea()
    
    }
}

struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView()
    }
}
