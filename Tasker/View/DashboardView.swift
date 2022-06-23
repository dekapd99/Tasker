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
                    .padding(.horizontal)
                    .padding(.bottom)
                
                if viewModel.todosFiltered.isEmpty {
                    AddTODOLogo()
                        .padding(.top)
                }
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(viewModel.todosFiltered, id: \.id) { todo in
                            if searchText == "" {
                                TODOView(todo: TODO(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, TODOType: todo.TODOType, completed: todo.completed, documentID: todo.documentID), viewModel: viewModel)
                            } else {
                                if todo.title.lowercased().contains(searchText.lowercased()) || todo.description.lowercased().contains(searchText.lowercased()) {
                                    TODOView(todo: TODO(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, TODOType: todo.TODOType, completed: todo.completed, documentID: todo.documentID), viewModel: viewModel)
                                } // Batas if Statement dari Else
                            }
                        } // Batas ForEach
                    } // Batas VStack
                    
                } // Batas ScrollView
                
            } // Batas VSTack
            .overlay(
                VStack{
                    Spacer()
                    HStack {
                        
                    }
                }
            )
        } // Batas Zstack
        
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
