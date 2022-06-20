//
//  AppUser.swift
//  Tasker
//
//  Created by Deka Primatio on 19/06/22.
//

import FirebaseFirestoreSwift

struct AppUser: Identifiable, Decodable {
    
    // @DocumentID -> Match id dengan id yang ada di Firebase diikuti dengan Variabel dibawahnya
    @DocumentID var id: String?
    let uid: String
    let firstName: String
    let lastName: String
    let email: String
    
    // TODO: Buat Session untuk AuthViewModel
    // Akses AuthViewModel via userSession uid dari id tiap user
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
    
    
    
}
