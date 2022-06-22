//
//  DashboardView.swift
//  Tasker
//
//  Created by Deka Primatio on 19/06/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    @State var searchText: String = ""
    @ObservedObject var viewModel = TODOViewModel()
    
    var body: some View {

        ZStack {
            
            VStack {
                HStack {
                    Spacer()
                    Text("Tasker")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    Spacer()
                }
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            AuthViewModel.shared.signout()
                        } label: {
                            Text("Logout")
                                .foregroundColor(Color(.systemGray))
                        }
                        .padding(.trailing)
                    }
                } // Batas Hstack Overlay
                
                SearchBarView(searchText: $searchText)
                    .padding()
                
                TODOButtonStack(viewModel: viewModel)
                
            } // Batas HSTack
            
        } // Batas Zstack
        
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
