//
//  TODOViewModel.swift
//  Tasker
//
//  Created by Deka Primatio on 20/06/22.
//

import SwiftUI
import Firebase

// Berisikan Fungsi Load, Create, Delete, Complete, & Uncomplete TODO
class TODOViewModel: ObservableObject {
    
    @Published var todos = [TODO]() // Var todos disimpan dalam bentuk Array
    @Published var showCreateTODOView: Bool = false // Default Show TODO = False
    @Published var filterTODOSelected: SelectedButton = .all // Default Category TODO = All
    @Published var todosFiltered = [TODO]() // Penampung Filter TODO
    
    init(){ // Initialize Load TODO
        loadTODOs() 
    }
    
    // Fungsi Load TODO
    func loadTODOs() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        // Cek apakah User sudah memiliki TODO List sebelumnya? kalo sudah ada tampilkan berdasarkan order by "completed" dan sort secara ascending
        let query = COLLECTION_USERS.document(user.id ?? "").collection("to-dos").order(by: "completed", descending: false)
        
        // Function Query -> Ubah menjadi Object menggunakan compactMap
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.todos = documents.compactMap({ try? $0.data(as: TODO.self) })
            // Return Sequence TODO List yang tersimpan
            for index in stride(from: 0, to: self.todos.count, by: 1) {
                self.todos[index].documentID = documents[index].documentID
            }
            self.todosFiltered = self.todos
            
            // Jika filterTODOSelected tidak = All maka tampilkan Filter yang dipilih
            if self.filterTODOSelected != .all {
                self.todosFiltered = self.todos.filter { todo in
                    return todo.TODOType == self.filterTODOSelected.rawValue
                }
            } else {
                self.todosFiltered = self.todos
            }
        }
    }
    
    // Fungsi Create TODO
    func createTODO(todo: TODO) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        // Default data TODO yang tersimpan
        let data: [String: Any] = ["title": todo.title,
                                   "description": todo.description,
                                   "TODOType": todo.TODOType,
                                   "completed": todo.completed,
                                   "ownerUid": user.id ?? ""]
        // Create TODO List data to Collection of User
        COLLECTION_USERS.document(user.id ?? "").collection("to-dos").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTODOs() // Load hasil TODO List yang baru setelah TODO Baru dibuat
        }
    }
    
    // Fungsi Delete TODO
    func deleteTODO(todoId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        // Get TODO List data by uid yang dipilih from Colections of User terus delete datanya
        COLLECTION_USERS.document(uid).collection("to-dos").document(todoId).delete() { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTODOs() // Load hasil TODO List yang baru setelah ada TODO yang di delete
        }
    }
    
    // Fungsi Toggle Complete TODO
    func completeTODO(todoId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        // Get TODO List data by uid yang dipilih from Colections of User terus updateData berdasarkan status complete = true
        COLLECTION_USERS.document(uid).collection("to-dos").document(todoId).updateData(["completed": true]) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTODOs() // Load hasil TODO List yang baru setelah TODO Lama di Update (complete)
        }
    }
    
    // Fungsi Toggle Uncomplete TODO
    func unCompleteTODO(todoId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        // Get TODO List data by uid yang dipilih from Colections of User terus updateData berdasarkan status complete = false
        COLLECTION_USERS.document(uid).collection("to-dos").document(todoId).updateData(["completed": false]) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTODOs() // Load hasil TODO List yang baru setelah TODO Lama di Update (uncomplete)
        }
    }
}
