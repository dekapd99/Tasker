//
//  SearchBarView.swift
//  Tasker
//
//  Created by Deka Primatio on 22/06/22.
//

import SwiftUI

// Berisikan UI Forms Search Bar
struct SearchBarView: View {
    
    @Binding var searchText: String // Property Wrapper yang dapat Read / Write
    @State var isSearching = false // is Searching Status ? Boolean
    
    var body: some View { // Body: UI Layout
        
        HStack {
            TextField("Search TODO", text: $searchText)
                // Custom Modifier searchTextFieldStyle()
                .searchTextFieldStyle()
                .onTapGesture(perform: {
                    isSearching = true
                })
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("LightBlue"))
                        Spacer()
                        if isSearching {
                            Button {
                                searchText = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                            }
                        }
                    }
                        .padding(.horizontal, 8)
                        .foregroundColor(.gray)
                )
                .transition(.move(edge: .trailing))
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    
                    // Dismiss Keyboard I/O
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }, label: {
                    Text("Cancel")
                        .foregroundColor(Color("LightBlue"))
                        .padding(.trailing)
                        .padding(.leading, 0)
                })
                .transition(.move(edge: .trailing))
            }
        }
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            SearchBarView(searchText: .constant(""))
        }
    }
}

struct SearchTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17))
            .padding(.leading, 24)
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color(.systemGray6))
            .cornerRadius(15)
    }
}

extension View {
    func searchTextFieldStyle() -> some View {
        modifier(SearchTextFieldModifier())
    }
}
