//
//  AuthViewModel.swift
//  Tasker
//
//  Created by Deka Primatio on 19/06/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

// Berisikan Fungsi Login / Register / Sign Out
class AuthViewModel: ObservableObject {
    
    @Published var userSession: User? // Firebase User
    @Published var currentUser: AppUser?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    // Fungsi Fetch User: Dengan Utils Constants COLLECTION_USERS via uid
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        // Get Users Collection: uid, dan seluruh document sebagai snapshot
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            // Get snapshot dari data dan Try to Match sebagai AppUser Object
            guard let user = try? snapshot?.data(as: AppUser.self) else { return }
            self.currentUser = user // Hasil diatas jadikan sebagai Session User
        }
    }
    
    // Fungsi Login: Dengan Firebase Auth (signIn method) -> Email & Password
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error { // Kalo Gagal Login
                print("DEBUG: Login Failed \(error.localizedDescription)")
                return // Masukkan Ulang
            }
            // Kalo Berhasil Login
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    // Fungsi Register: Dengan Firebase Auth (createUser method) -> Email, Password, First Name, & Last Name
    func register(withEmail email: String, password: String, firstName: String, lastName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error { // Kalo Gagal Register
                print("DEBUG: Register Failed \(error.localizedDescription)")
                return // Masukkin Ulang
            }
            // Kalo Berhasil Register
            guard let user = result?.user else { return }
            // Store hasil Input ke dalam data
            let data = ["uid": user.uid,
                        "firstName": firstName,
                        "lastName": lastName,
                        "email": email]
            // Upload data ke dalam user uid
            COLLECTION_USERS.document(user.uid).setData(data) { _ in
                print("Successfully Uploaded Data")
                self.userSession = user
                self.fetchUser()
            }
        }
    }
    
    // Fungsi Sign Out: Dengan Firebase Auth (signOut method) -> Ubah Session Aktif jadi Nil
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    // TODO: Reset Password -> Not Covered
//    func resetPassword() {
//
//    }
}
