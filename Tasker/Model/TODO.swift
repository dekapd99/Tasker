//
//  TODO.swift
//  Tasker
//
//  Created by Deka Primatio on 19/06/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

// Berisikan Data Declaration untuk Informasi TODO
struct TODO: Identifiable, Decodable {
    
    // @DocumentID -> Match id dengan id yang ada di Firebase diikuti dengan Variabel dibawahnya
    @DocumentID var id: String? = UUID().uuidString
    let ownerUid: String
    var title: String
    var description: String
    var TODOType: String
    var completed: Bool
    var documentID: String? = ""
    
    // Buat Fungsi get todo type
    func getType() -> SelectedButton {
        if TODOType == "Groceries" {
            return .groceries
        } else if TODOType == "Work" {
            return .work
        } else if TODOType == "School" {
            return .school
        } else if TODOType == "Home" {
            return .home
        } else if TODOType == "Personal" {
            return .personal
        } else {
            return .extra
        }
    }
    
}
