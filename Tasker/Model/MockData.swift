//
//  MockData.swift
//  Tasker
//
//  Created by Deka Primatio on 19/06/22.
//

import Foundation

// MockData dibuat agar terlihat ada data Dummy di Preview SwiftUI
// yang mirip dengan Collections Users pada Firestore

let appUser01 = AppUser(id: "1", uid: "1", firstName: "Dummy", lastName: "User", email: "dummyuser@gmail.com")

let todo01 = TODO(id: "1", ownerID: "1", title: "Kebutuhan Bulanan", description: "Belanja ke Pasar", TODOType: "Groceries", completed: false)
let todo02 = TODO(id: "2", ownerID: "2", title: "Meeting", description: "Client Meet", TODOType: "Work", completed: true)
